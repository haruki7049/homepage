import { Hono } from "hono";
import { html } from "hono/html";
import type { FC } from "hono/jsx";

const app = new Hono();

const Layout: FC = () => {
  return (
    <html>
      <head>
        <Head />
      </head>
      <body>
        <main>
          <Greeting />
          <Projects />
        </main>
        <footer>
          <Address />
          <License />
          <UseNix />
        </footer>
      </body>
    </html>
  )
}

const Head: FC = () => {
  return (
    <>
      <meta charset="utf-8" />
      <meta content="GitLab Pages" />
      <title>haruki7049's homepage</title>
      <link rel="stylesheet" href="style.css" />
      <link rel="icon" type="image/jpg" sizes="64x64" href="./haruki7049.jpg" />
    </>
  )
}

const Greeting: FC = () => {
  return (
    <>
      <h1>Hi! I am haruki7049.</h1>
      <img
        src="./haruki7049.jpg"
        alt="haruki7049's icon created by Rereri."
      />
    </>
  )
}

const Projects: FC = () => {
  return (
    <>
      <h1>Projects which I have joined</h1>
      <ul>
        <li><a href="https://gitlab.com/haruki7049/my_neovim_config">my_neovim_config</a></li>
        <li><a href="https://gitlab.com/haruki7049/harulisp">harulisp</a></li>
        <li><a href="https://gitlab.com/haruki7049/hrsp">hrsp</a></li>
        <li><a href="https://github.com/haruki7049/hrtor">hrtor</a></li>
        <li><a href="https://gitlab.com/kakei/kakei">kakei</a></li>
        <li><a href="https://gitlab.com/haruki7049/acb">Abstructed-CodeBase</a></li>
        <li><a href="https://github.com/SuteraVR/SuteraVR">SuteraVR</a></li>
        <li><a href="https://github.com/web-phone">web-phone</a></li>
        <li><a href="https://github.com/haruki7049/surrealdb-overlay">surrealdb-overlay</a></li>
        <li><a href="https://github.com/haruki7049/surrealist-overlay">surrealist-overlay</a></li>
        <li><a href="https://github.com/haruki7049/cpython-overlay">cpython-overlay</a></li>
        <li><a href="https://github.com/haruki7049/deno-overlay">deno-overlay</a></li>
        <li><a href="https://github.com/haruki7049/iasc">iasc</a></li>
      </ul>
    </>
  )
}

const Address: FC = () => {
  return (
    <>
      <h1>Address</h1>
      <address>
        <ul>
          <li>GitHub: <a href="https://github.com/haruki7049">haruki7049</a></li>
          <li>GitLab: <a href="https://gitlab.com/haruki7049">haruki7049</a></li>
          <li>Twitter: <a href="https://twitter.com/Love__Yoshi">@Love__Yoshi</a></li>
          <li>Bluesky: <a href="https://bsky.app/profile/haruki7049.bsky.social">@haruki7049.bsky.social</a></li>
          <li>YouTube: <a href="https://www.youtube.com/@haruki7049">@haruki7049</a></li>
          <li>Ko-fi: <a href="https://ko-fi.com/haruki7049">haruki7049</a></li>
        </ul>
      </address>
    </>
  )
}

const License: FC = () => {
  return (
    <>
      <p>This site is hosted under MIT license using GitHub Pages.</p>
      <p>Repository: <a href="https://github.com/haruki7049/homepage">https://github.com/haruki7049/homepage</a></p>
    </>
  )
}

const UseNix: FC = () => {
  return (
    <>
      <p>BTW, I use NixOS. Wanna use NixOS? <a href="https://nixos.org">https://nixos.org</a></p>
    </>
  )
}

app.get('/', (c) => {
  return c.html(
    <Layout />
  );
});

export default app
