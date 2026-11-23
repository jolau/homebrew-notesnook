# Written by scripts/fork/release.sh in jolau/notesnook (branch fork).
cask "notesnook-fork" do
  version "3.4.13-fork.a427033"
  sha256 "713bfdc7582e6f2ac25382534d4b857c1d9f3bffd78516fd28a5347cce5b06f1"

  url "https://github.com/jolau/notesnook/releases/download/v#{version}/Notesnook-#{version}-arm64.zip"
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
