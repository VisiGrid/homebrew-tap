# typed: false
# frozen_string_literal: true

class Visigrid < Formula
  desc "The spreadsheet that behaves like code"
  homepage "https://visigrid.app"
  version "0.5.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-macOS-universal.dmg"
      sha256 "cc8a54ec2248e59d5c07a5493c256911f97209eb5710a38726cc6539a0acaa82"
    else
      url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-macOS-universal.dmg"
      sha256 "cc8a54ec2248e59d5c07a5493c256911f97209eb5710a38726cc6539a0acaa82"
    end
  end

  on_linux do
    url "https://github.com/VisiGrid/VisiGrid/releases/download/v#{version}/VisiGrid-linux-x86_64.tar.gz"
    sha256 "cc42fd3d9880a0625724829418812e13ec291d2562ccc2800056b2b49a4662fd"
  end

  def install
    if OS.mac?
      # Extract app from DMG and install
      prefix.install "VisiGrid.app"
      bin.write_exec_script "#{prefix}/VisiGrid.app/Contents/MacOS/visigrid"
      bin.write_exec_script "#{prefix}/VisiGrid.app/Contents/MacOS/visigrid-cli"
    else
      bin.install "visigrid"
      bin.install "visigrid-cli"
    end
  end

  def caveats
    if OS.mac?
      <<~EOS
        VisiGrid.app has been installed to:
          #{prefix}/VisiGrid.app

        To open VisiGrid from the command line:
          visigrid

        To use the CLI tools:
          visigrid-cli --help
      EOS
    end
  end

  test do
    assert_match "visigrid-cli", shell_output("#{bin}/visigrid-cli --version")
  end
end
