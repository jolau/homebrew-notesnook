# Notesnook (fork) for Homebrew

A tap with builds of [jolau/notesnook](https://github.com/jolau/notesnook)
(branch `fork`): Notesnook's latest stable release with this fork's changes.
It is an unofficial build, not one from Streetwriters, the makers of
[Notesnook](https://github.com/streetwriters/notesnook).
The cask is written by `scripts/fork/release.sh` there, which runs daily on the
Mac that builds it and only publishes when Notesnook has a new stable release.

## Install on a Mac

Apple Silicon only.

1. Add the tap, and trust it: Homebrew only loads casks from taps you trust.

   ```bash
   brew tap jolau/notesnook
   ```

   ```bash
   brew trust jolau/notesnook
   ```

2. Install. If a `Notesnook.app` is already in `/Applications`, add `--force`
   to replace it; your notes are kept.

   ```bash
   brew install --cask notesnook-fork
   ```

On the first launch, macOS asks whether Notesnook may use "Notesnook Safe
Storage" in your keychain: choose **Always Allow**. Every build is signed with
the same certificate, so it does not ask again after updates.

## Updates

```bash
brew upgrade
```

or let [homebrew-autoupdate](https://github.com/DomT4/homebrew-autoupdate) do
it, e.g. `brew autoupdate start --upgrade`.

The app's own updater is turned off: the official updates would replace the
fork.
