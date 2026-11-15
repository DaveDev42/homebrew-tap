class Qsh < Formula
  desc "Remote shell over QUIC with session resume across network changes"
  homepage "https://github.com/DaveDev42/qsh"
  url "https://github.com/DaveDev42/qsh/releases/download/v0.9.0/qsh-v0.9.0-aarch64-apple-darwin.tar.gz"
  # Kept explicit even though brew can scan it from the URL: qsh's
  # release.yml `homebrew-tap` job rewrites the version / url / sha256 lines
  # by regex on every tag push, so all three must stay one-per-line.
  version "0.9.0"
  sha256 "37e3343065d6235932cfc86e4e11105ba4bae83a38eeef661a95d60159e14bd6"
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
