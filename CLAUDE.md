# oskrocha.github.io

Jekyll-based personal site.

## Branches

- `source` — dev branch. Jekyll source (`.md`, `_layouts`, `_includes`, `assets/scss`, etc.) plus the built `_site/` output (tracked despite `.gitignore`, from earlier `rake commit` runs).
- `master` — generated output only. Its root *is* the contents of `_site/`, rewritten from `source` via `git filter-branch --subdirectory-filter _site/`. This is what GitHub Pages serves. Never edit `master` directly — it gets fully replaced on every deploy.

## Publishing

Runs in Docker (`Dockerfile` / `docker-compose.yml` / `docker-entrypoint.sh`) rather than host Ruby — bundles gems, forwards the host SSH agent and git identity for push, and maps to the host UID/GID so files stay host-owned instead of root-owned.

```
docker compose run --rm site rake commit_deploy
```

This runs both Rakefile tasks:
- `rake commit` — commits `_site/` changes on `source`, pushes `source` (normal push).
- `rake deploy` — deletes local `master`, rebuilds it from `_site/` via `git filter-branch`, **force-pushes all branches** (`git push --all origin -f`). Destructive/irreversible-ish; confirm with the user before running.

Individual steps: `rake build:pro` (jekyll build only, safe), `rake commit`, `rake deploy`.

## Notes

- No `assets/scss` exists in this repo — the Rakefile's Sass compile step was dead code and has been removed from `build:pro`.
- `Gemfile.lock` is gitignored; Docker regenerates it as needed.
