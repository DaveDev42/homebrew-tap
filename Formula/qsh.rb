class Qsh < Formula
  desc "Remote shell over QUIC with session resume across network changes"
  homepage "https://github.com/DaveDev42/qsh"
  url "https://github.com/DaveDev42/qsh/releases/download/v0.8.1/qsh-v0.8.1-aarch64-apple-darwin.tar.gz"
  # Kept explicit even though brew can scan it from the URL: qsh's
  # release.yml `homebrew-tap` job rewrites the version / url / sha256 lines
  # by regex on every tag push, so all three must stay one-per-line.
  version "0.8.1"
  sha256 "ac4cea7dda5b0fc3920a3522f6c6b2d25d49a8f1f50f0d820d657217fb1b0c52"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "qsh"
    man1.install Dir["man/*.1"]
  end

  test do
    assert_match "qsh", shell_output("#{bin}/qsh --version")
  end
end
