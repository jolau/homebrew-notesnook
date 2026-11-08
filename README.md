# Notesnook (fork) for Homebrew

A private tap with builds of [jolau/notesnook](https://github.com/jolau/notesnook)
(branch `fork`): Notesnook's latest stable release with this fork's changes.
The cask is written by `scripts/fork/release.sh` there, which runs daily on the
Mac that builds it and only publishes when Notesnook has a new stable release.

## Install on a Mac

Apple Silicon only.

1. Give Homebrew a GitHub token that can read the builds: they are releases
   of a private repository. Create a
   [fine-grained token](https://github.com/settings/personal-access-tokens/new)
   with access to **only** `jolau/notesnook` and the permission
   **Contents: Read-only**, then save it where every `brew` command (`brew
   autoupdate` too) finds it, replacing `github_pat_...` with the token:

   ```bash
   mkdir -p ~/.homebrew && echo 'HOMEBREW_GITHUB_API_TOKEN=github_pat_...' >> ~/.homebrew/brew.env && chmod 600 ~/.homebrew/brew.env
   ```

2. Add the tap (over SSH, since it is private), and trust it: Homebrew only
   loads casks from taps you trust.

   ```bash
   brew tap jolau/notesnook git@github.com:jolau/homebrew-notesnook.git
   ```

   ```bash
   brew trust jolau/notesnook
   ```

3. Install. If a `Notesnook.app` is already in `/Applications`, add `--force`
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
