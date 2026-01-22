class Visigrid < Formula
  desc "Fast, native spreadsheet with GPU-accelerated rendering"
  homepage "https://visigrid.app"
  version "0.1.8"
  license "MIT"

  on_linux do
    url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-linux-x86_64.tar.gz"
    sha256 "SKIP"  # Update with actual sha256 after release

    depends_on "gtk+3"
    depends_on "libxcb"
    depends_on "libxkbcommon"
  end

  def install
    bin.install "visigrid"
    bin.install "visigrid-cli"

    # Install desktop file and icon for Linux
    if OS.linux?
      (share/"applications").install "visigrid.desktop"
      (share/"icons/hicolor/256x256/apps").install "visigrid.png"
    end
  end

  def caveats
    <<~EOS
      VisiGrid has been installed!

      Run with:
        visigrid              # GUI
        visigrid-cli --help   # CLI

      On Linux, you may need to log out and back in for the
      application to appear in your launcher.
    EOS
  end

  test do
    assert_match "visigrid-cli", shell_output("#{bin}/visigrid-cli --version")
  end
end
