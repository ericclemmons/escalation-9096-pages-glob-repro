export async function onRequest(context) {
  return new Response(`function: ${new URL(context.request.url).pathname}`, {
    headers: { "content-type": "text/plain; charset=utf-8" },
  });
}
