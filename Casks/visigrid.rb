cask "visigrid" do
  version "0.6.3"
  sha256 "0447af3f279a06af1fa522ce03a9784996dcb1f31a2ba6ccff96fc91868418e9"

  url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-macOS-universal.dmg"
  name "VisiGrid"
  desc "Fast, native spreadsheet with GPU-accelerated rendering"
  homepage "https://visigrid.com"

  livecheck do
    url :url
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
