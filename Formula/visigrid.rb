class Visigrid < Formula
  desc "Fast, native spreadsheet with GPU-accelerated rendering"
  homepage "https://visigrid.app"
  version "0.4.3"
  license "AGPL-3.0-only"

  # Linux only - macOS users should use the cask: brew install --cask visigrid/tap/visigrid
  depends_on :linux

  url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-linux-x86_64.tar.gz"
  sha256 "0df8e99ca000f2d93d32299fa86c06ae13dcac280d1780a244f4d147708cb4c3"

  depends_on "gtk+3"
  depends_on "libxcb"
  depends_on "libxkbcommon"

  def install
    bin.install "visigrid"
    bin.install "visigrid-cli" if File.exist?("visigrid-cli")

    # Install desktop file and icon
    (share/"applications").install "visigrid.desktop" if File.exist?("visigrid.desktop")
    (share/"icons/hicolor/256x256/apps").install "visigrid.png" if File.exist?("visigrid.png")
  end

  def caveats
    <<~EOS
      VisiGrid has been installed!

      Run with:
        visigrid              # GUI
        visigrid-cli --help   # CLI

      You may need to log out and back in for the
      application to appear in your launcher.
    EOS
  end

  test do
    assert_match "visigrid", shell_output("#{bin}/visigrid --version 2>&1", 1)
  end
end
