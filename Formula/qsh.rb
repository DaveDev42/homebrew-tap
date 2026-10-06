class Qsh < Formula
  desc "Remote shell over QUIC with session resume across network changes"
  homepage "https://github.com/DaveDev42/qsh"
  url "https://github.com/DaveDev42/qsh/releases/download/v0.4.2/qsh-v0.4.2-aarch64-apple-darwin.tar.gz"
  # Kept explicit even though brew can scan it from the URL: qsh's
  # release.yml `homebrew-tap` job rewrites the version / url / sha256 lines
  # by regex on every tag push, so all three must stay one-per-line.
  version "0.4.2"
  sha256 "023e98cd8c3b65aab716bf3d0da6be0ac191d186295e2f09c67f4f809eaba8f0"
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
