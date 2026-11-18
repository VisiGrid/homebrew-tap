cask "visigrid" do
  version "0.55.2"
  sha256 "a0fca7fbd5ef1274530eb7b19808ec09a084b47c110bbd78dbad7c2ba2627a86"

  url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-macOS-universal.dmg"
  name "VisiGrid"
  desc "Fast, native spreadsheet with GPU-accelerated rendering"
  homepage "https://visigrid.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "VisiGrid.app"

  zap trash: [
    "~/.config/visigrid",
    "~/Library/Application Support/com.visigrid.app",
    "~/Library/Caches/com.visigrid.app",
    "~/Library/Preferences/com.visigrid.app.plist",
    "~/Library/Saved Application State/com.visigrid.app.savedState",
  ]
end
