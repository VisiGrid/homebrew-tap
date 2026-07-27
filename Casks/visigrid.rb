cask "visigrid" do
  version "0.12.2"
  sha256 "ebe1facb65c1f1eb7196e2128413a1d612b6f6555b4939ca305b144b041d7f00"

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
