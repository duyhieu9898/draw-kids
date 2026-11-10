# Version 1 checkpoint

Checkpoint before migration to the supplied 3.141 APKS reference.
Git tag: `version-1`.

Includes current web source, packaged web assets, dependency lockfile, scripts,
documentation and retained analysis/runtime evidence. This is a recovery point,
not a claim of complete parity or successful new testing.

The existing reference is `original/kids-coloring-and-drawing-games-3-101.apk`.
Source APK/APKS files, `original/`, `extracted/`, dependencies and generated builds
remain local and are excluded from Git. The web app uses its committed public
assets; extraction scripts additionally need those local source packages/files.
Package hashes are recorded in `reports/version-1-packages.sha256`.

To inspect or resume version 1 without overwriting the migration branch:

```sh
git switch -c restore-version-1 version-1
cd web
npm ci
npm run dev
```

Commit or stash any pending changes before switching. Browser IndexedDB data and
service-worker caches are not part of Git; use a separate browser profile/origin
when comparing versions with different saved-data formats.
