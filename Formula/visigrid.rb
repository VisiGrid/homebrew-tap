class Visigrid < Formula
  desc "Fast, native spreadsheet with GPU-accelerated rendering"
  homepage "https://visigrid.app"
  version "0.2.2"
  license "MIT"

  on_macos do
    url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-macOS-universal.zip"
    sha256 "418a8c4fee63661b981868f1818e26cde64724a2d9567fc21dbabdcd6ef7097e"
  end

  on_linux do
    url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-linux-x86_64.tar.gz"
    sha256 "9d2f34275500280cfc0d20d14d8cde3a7e5e751a40ced0f27afb2505d6e6212d"

    depends_on "gtk+3"
    depends_on "libxcb"
    depends_on "libxkbcommon"
  end

  def install
    if OS.mac?
      # macOS: install the .app bundle
      prefix.install "VisiGrid.app"
      bin.write_exec_script prefix/"VisiGrid.app/Contents/MacOS/visigrid"
    else
      # Linux: install binaries directly
      bin.install "visigrid"
      bin.install "visigrid-cli" if File.exist?("visigrid-cli")

      # Install desktop file and icon
      (share/"applications").install "visigrid.desktop" if File.exist?("visigrid.desktop")
      (share/"icons/hicolor/256x256/apps").install "visigrid.png" if File.exist?("visigrid.png")
    end
  end

  def caveats
    if OS.mac?
      <<~EOS
        VisiGrid has been installed!

        Run with:
          visigrid

        Or open VisiGrid.app from #{prefix}
      EOS
    else
      <<~EOS
        VisiGrid has been installed!

        Run with:
          visigrid              # GUI
          visigrid-cli --help   # CLI

        You may need to log out and back in for the
        application to appear in your launcher.
      EOS
    end
  end

  test do
    if OS.mac?
      assert_predicate prefix/"VisiGrid.app/Contents/MacOS/visigrid", :executable?
    else
      assert_match "visigrid", shell_output("#{bin}/visigrid --version 2>&1", 1)
    end
  end
end
