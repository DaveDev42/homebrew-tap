class Qsh < Formula
  desc "Remote shell over QUIC with session resume across network changes"
  homepage "https://github.com/DaveDev42/qsh"
  url "https://github.com/DaveDev42/qsh/releases/download/v0.9.1/qsh-v0.9.1-aarch64-apple-darwin.tar.gz"
  # Kept explicit even though brew can scan it from the URL: qsh's
  # release.yml `homebrew-tap` job rewrites the version / url / sha256 lines
  # by regex on every tag push, so all three must stay one-per-line.
  version "0.9.1"
  sha256 "e63ec54272660fffdf0d0e545188c991c84b14755923fd17e1030abba2ac7de0"
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
