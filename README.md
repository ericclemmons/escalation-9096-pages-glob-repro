# Pages route-exclude E2E reproduction

This repository distinguishes static asset responses from Pages Functions responses while exercising the affected route exclusions reported in ESCALATION-9096. The customer configuration contains about 80 individually listed paths; this minimal reproduction uses the three paths identified by the escalation's live traces.

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

The three excluded trailing-slash paths should return their asset markers. The non-trailing forms and `/other` are controls and should return the Function marker. The script follows redirects and prints the final URL.
