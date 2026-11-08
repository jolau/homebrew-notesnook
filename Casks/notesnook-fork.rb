# Written by scripts/fork/release.sh in jolau/notesnook (branch fork).
cask "notesnook-fork" do
  # a release of a private repository: downloaded with the GitHub CLI's
  # login (gh auth login), or with HOMEBREW_GITHUB_API_TOKEN. By its full
  # path: Homebrew's PATH does not have its own bin.
  token = ENV.fetch("HOMEBREW_GITHUB_API_TOKEN") do
    Utils.safe_popen_read((HOMEBREW_PREFIX/"bin/gh").to_s, "auth", "token").chomp
  rescue
    ""
  end

  version "3.4.12-fork.db33b57"
  sha256 "97861dbb288c0166eeafe597fe0127b713887d15c13c557c0579b0639eaf5d08"

  url "https://api.github.com/repos/jolau/notesnook/releases/assets/725185846",
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
