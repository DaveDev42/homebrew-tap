class Qsh < Formula
  desc "Remote shell over QUIC with session resume across network changes"
  homepage "https://github.com/DaveDev42/qsh"
  url "https://github.com/DaveDev42/qsh/releases/download/v0.1.0-alpha.2/qsh-v0.1.0-alpha.2-aarch64-apple-darwin.tar.gz"
  # Kept explicit even though brew can scan it from the URL: qsh's
  # release.yml `homebrew-tap` job rewrites the version / url / sha256 lines
  # by regex on every tag push, so all three must stay one-per-line.
  version "0.1.0-alpha.2"
  sha256 "a23d1289be1fa5050789b4d08f6b85861c7295795f370fb5efbeb60ede0f72b1"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "qsh"
  end

  test do
    assert_match "qsh", shell_output("#{bin}/qsh --version")
  end
end
