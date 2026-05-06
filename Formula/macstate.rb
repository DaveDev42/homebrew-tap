class Macstate < Formula
  desc "CLI exposing macOS system signals (network, power) as JSON"
  homepage "https://github.com/DaveDev42/macstate"
  version "0.0.11"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/macstate/releases/download/v0.0.11/macstate-v0.0.11-aarch64-apple-darwin.tar.gz"
  sha256 "031c7a199e6c30027651483c88d2b6b5753a13332a52efe0eed6a22ce8b0ea4d"

  def install
    bin.install "macstate"
  end

  test do
    assert_match "{", shell_output("#{bin}/macstate --schema")
  end
end