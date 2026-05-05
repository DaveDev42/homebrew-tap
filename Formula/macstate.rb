class Macstate < Formula
  desc "CLI exposing macOS system signals (network, power) as JSON"
  homepage "https://github.com/DaveDev42/macstate"
  version "0.0.4"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/macstate/releases/download/v#{version}/macstate-v#{version}-aarch64-apple-darwin.tar.gz"
  sha256 "6c4253962a25979f717f5c9ec9319801d361c1c96ba44561b93a5cd879367d6d"

  def install
    bin.install "macstate"
  end

  test do
    assert_match "{", shell_output("#{bin}/macstate --schema")
  end
end
