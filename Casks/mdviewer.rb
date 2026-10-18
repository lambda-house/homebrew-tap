cask "mdviewer" do
  arch arm: "aarch64", intel: "x64"

  version "1.1.1"
  sha256 arm:   "c99c4e0db54d0b7eb2f4f4bbce14a6ec12c9bd4032affd6e19eb9187ef28b2d3",
         intel: "375a069278f7a9edbb2cf62577fb645abb762a8b26db57e51c183f665fcedcdc"

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
