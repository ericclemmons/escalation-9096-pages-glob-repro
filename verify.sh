#!/usr/bin/env bash
set -euo pipefail

: "${PAGES_URL:?Set PAGES_URL to the deployed Pages URL}"

for path in /agenda /agenda/ /la-sala /la-sala/ /transparencia /transparencia/ /other; do
  printf '\n%s\n' "$path"
  curl --silent --show-error --location \
    --write-out '\nstatus=%{http_code} final_url=%{url_effective}\n' \
    "${PAGES_URL%/}${path}"
done
