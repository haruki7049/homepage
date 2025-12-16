+++
title = "拙作Zigライブラリ、lightmixのバージョンアップをした日記"
date = 2025-12-16
+++

## ソースコード

今回作成したタグ、リリースはこれ。

[github.com/haruki7049/lightmix/releases/tag/0.5.0](https://github.com/haruki7049/lightmix/releases/tag/0.5.0)

## 日記本文

拝啓、皆さんお元気していますか云々。私は今、喉風邪を引いています。クソ痛え。咳がめちゃくちゃ出る。インフルエンザと新型コロナではないらしいです。病院に行ったら検査を受けられたので、多分確かです。

この間、[lightmix](https://github.com/haruki7049/lightmix)をリファクタリングしようとして、とりあえずGeminiに投げ込んでみたんです。そしたら、「お前なぁ、このコードはメモリーリークを起こすからめっちゃ危険だぜ。その設計は今すぐやめな！」（意訳）って言ってきやがったんです。

もうね、結構心に来たんです。しばらくlightmixに関して何も出来ませんでした。

というのも、Wave.filter関数に関することで、この設計をやめろと、そう言ってきたんですよね。これはこのライブラリを作るにあたって、かなり心を込めている部分だったので、それをクソ設計と言われたんだと思ったんです。

filter関数、当時はこんな感じの実装をしていました(見る人が見ればすぐに分かりそうなメモリーリーク…かも？)。

```zig
/// Filters a zig function.
/// Use this function as `wave.filter(your_filter);`
pub fn filter(
    self: Self,
    filter_fn: fn (self: Self) anyerror!Self,
) Self {
    const result: Self = filter_fn(self) catch |err| {
        std.debug.print("{any}\n", .{err});
        @panic("Error happened in filter function...");
    };

    return result;
}
```

こう実装すると、こう書けるようになります。

```zig
const wave: Wave = create_wave(); // A dummy function to create Wave
defer wave.deinit();

// the `decay` is also a dummy function, to be a decayed sound.
const decayed_wave: Wave = wave
    .filter(decay)
    .filter(decay)
    .filter(decay)
    .filter(decay);
defer decayed_wave.deinit();
```

まぁ試したら実際にメモリーリークを起こしたので、指摘は合っていたんですけど。要は、filter元のdataは、filter後にはもうどこからも参照されないのにdeinit関数も呼んでないよね、って感じでした。filter関数内で元のSelfのdeinit関数をdeferで呼べば良いだけでした。

これで解決したんですけど、Wave型の値を作って代入した後に、また別のWave型の定数にfilterで値を作ろうとすると、元々の値をdeinitするとセグフォになるようになりました。つまり今までのコードが動かなくなります！！()

こうすれば良いってだけなんですけど、意外と適用範囲が大きいと思うんですよね。今までのサンプルプログラムの全てが先程の書きかたをしてましたから。以下のプログラムが、今回のリリースのlightmixコードです。

```zig
const wave: Wave = create_wave(); // A dummy function to create Wave
//defer wave.deinit(); // Delete this deiniting

// the `decay` is also a dummy function, to be a decayed sound.
const decayed_wave: Wave = wave
    .filter(decay)
    .filter(decay)
    .filter(decay)
    .filter(decay);
defer decayed_wave.deinit();
```

まあ破壊的変更ってのは仕方ないので、0.5.0としてリリースすることにしました。この破壊的変更について、まだリリースの説明に書けてなかったりするので、それはこれからやるつもりです。

久しぶりにlightmixについてプログラムを書けて楽しかったです！  少し考えているlightmix用インターフェイス構造体として、楽器用Waveを一つの構造体から引き出せるような、そんなのを思いつきました。次はそれを作るかなぁ？  名前は、多分instruments-hakoとして、構造体名をHakoとしようかなって思ってます。
