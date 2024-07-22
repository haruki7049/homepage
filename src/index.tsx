import { Hono } from "hono";

const app = new Hono();

app.get('/', (c) => {
  return c.html('Hello, World!');
});

export default app
