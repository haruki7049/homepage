+++
title = "Raku言語用Nostrライブラリを作ったという日記"
date = 2025-11-23
+++

## ソースコード

ソースコードはこれだ。仕様確認、動作確認、実際のコードの確認や「コードが汚えよ！！」ってIssueはここからお願いする。<br />
[github.com/haruki7049/nostraku](https://github.com/haruki7049/nostraku)

## 何を作ったのか

Nostrを使うためのデータ型を色々定義した、Raku言語用ライブラリ。

## 日記本文

今日は親戚の家に行って作業した。本来は学校の課題をするつもりだったが、なんやかんやいつも通りにOSS作成作業になってしまった。

今日作ったのは、NostrをRaku言語で扱うためのライブラリだ。NIP-01でのeventを扱うEventクラスと、Jsonフォーマットで表現されるメッセージにするためのMessageクラス、後Eventに署名するためのSignerクラスだ。Eventクラスのインスタンスを作って、それをSignerクラスのインスタンスで署名、署名後のEventクラスのインスタンスをMessageクラスのメソッドでMessageクラスのインスタンスにラップする。

…書いていて、一文で表すには長すぎると思った。要はこういう構造で、送信するJsonを作れる。めっちゃ文字が小さくなってしまった…。

<figure>
  <img
    src="/src/picture/nostraku-architecture.png"
    alt="The picture that rendered nostraku's architecture" />
  <figcaption>実はこの写真もGeminiに作ってもらったんだよね</figcaption>
</figure>

WebSocketサーバーは作成しなかった。というのも、どのWebSocketライブラリを使うかはプログラマに委ねたいと思ったからだ。ミニマルにした方が、私の責務が減る。つまりメンテナンスが楽になる。まあ、責務を減らしたと言いつつNativeCallを使っているのは、メンテナンスが大変そうだけど。これは仕方がないんだ…。

ここまで、全て自分で書いたような事を言っているが、そうではなく、ここまでの実装は全てGoogleのGeminiと相談しながら書いた。いわゆるバイブコーディングってやつだ。生成AIってすげえ！！

そんなこんなで、Nostr用Raku言語ライブラリ、とりあえず完成と言って良いくらいにはなった。だけどまだ実際に送信するとかの統合テストが出来てないので、もうちょっと書かないとならないかもしれない。頑張るぞ。
