cask "mdviewer" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "e06eca1900a8be3f663861fb5b0fef502c8b90795fc37c5a102e2254bd0fed23",
         intel: "108c4917e9142ada12e80be2c6a13ebb9b3313cb477453fbe0dd1d7ca917162e"

  url "https://github.com/lambda-house/mdviewer-mj/releases/download/v#{version}/MDViewer_#{version}_#{arch}.dmg"
  name "MDViewer"
  desc "Markdown viewer with Mermaid diagrams and an agent workspace"
  homepage "https://github.com/lambda-house/mdviewer-mj"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "MDViewer.app"

  zap trash: [
    "~/Library/Application Support/cc.lambdahouse.mdviewer",
    "~/Library/Application Support/mdviewer",
    "~/Library/Caches/cc.lambdahouse.mdviewer",
    "~/Library/Preferences/cc.lambdahouse.mdviewer.plist",
    "~/Library/Saved Application State/cc.lambdahouse.mdviewer.savedState",
    "~/Library/WebKit/cc.lambdahouse.mdviewer",
  ]

  caveats <<~EOS
    MDViewer is not notarized yet. If macOS refuses to open it, allow it in
    System Settings → Privacy & Security → "Open Anyway", or run:
      xattr -dr com.apple.quarantine "#{appdir}/MDViewer.app"
  EOS
end
