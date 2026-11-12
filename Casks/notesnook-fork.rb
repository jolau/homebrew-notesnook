# Written by scripts/fork/release.sh in jolau/notesnook (branch fork).
cask "notesnook-fork" do
  # a release of a private repository: downloaded with a GitHub token that
  # can read it, set in ~/.homebrew/brew.env (so that every brew command
  # has it, brew autoupdate's too):
  #   HOMEBREW_GITHUB_API_TOKEN=github_pat_...
  # (the GitHub CLI itself cannot be asked from here: Homebrew downloads
  # where it has no access to its login)
  token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN", "")

  version "3.4.13-fork.9d17391"
  sha256 "e20ba8778ecf26dfb035920e556e655d7cca806877490bbbca6ab33de56fe788"

  url "https://api.github.com/repos/jolau/notesnook/releases/assets/741219522",
      header: ["Accept: application/octet-stream", "Authorization: Bearer #{token}"]
  name "Notesnook (fork)"
  desc "Notesnook, built from jolau's fork"
  homepage "https://github.com/jolau/notesnook"

  depends_on arch: :arm64
  conflicts_with cask: "notesnook"

  app "Notesnook.app"

  # an upgrade replaces the app: it should not be running then
  uninstall quit: "org.streetwriters.notesnook"

  # signed with a certificate of its own, not one Apple knows: without
  # this, macOS would refuse to open it after downloading
  installed = "#{appdir}/Notesnook.app"
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", installed], must_succeed: false
  end
end
