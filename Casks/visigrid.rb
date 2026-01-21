cask "visigrid" do
  version :latest
  sha256 :no_check

  url "https://github.com/VisiGrid/VisiGrid/releases/latest/download/VisiGrid-macOS-universal.dmg"
  name "VisiGrid"
  desc "Fast, native spreadsheet with GPU-accelerated rendering"
  homepage "https://visigrid.app"

  livecheck do
    url "https://github.com/VisiGrid/VisiGrid/releases/latest"
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  app "VisiGrid.app"

  zap trash: [
    "~/.config/visigrid",
    "~/Library/Application Support/com.visigrid.app",
    "~/Library/Caches/com.visigrid.app",
    "~/Library/Preferences/com.visigrid.app.plist",
    "~/Library/Saved Application State/com.visigrid.app.savedState",
  ]
end
