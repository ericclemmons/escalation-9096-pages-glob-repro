# Pages route-exclude E2E reproduction

This repository distinguishes static asset responses from Pages Functions responses while exercising the route exclusions reported in ESCALATION-9096.

Pages requires every `_routes.json` rule to start with `/`. The source rules therefore use `/*/…`; Pages compiles these to the downstream `*/…` glob form.

## Pages setup

Connect this repository to a Pages project with:

- Production branch: `main`
- Framework preset: None
- Build command: leave empty
- Build output directory: `public`

The `functions/[[path]].js` catch-all returns `function: <path>`. The three excluded paths have static assets that return `asset: <name>`.

## Expected results

After deployment, set `PAGES_URL` and run:

```sh
PAGES_URL=https://example.pages.dev ./verify.sh
```

Both forms of each excluded path should return its asset marker. `/other` should return the Function marker. The script follows redirects and prints the final URL.
