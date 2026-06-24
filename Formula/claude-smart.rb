class ClaudeSmart < Formula
  desc "Smart launcher for Claude Code (csm): session select, account switch, usage"
  homepage "https://github.com/DaveDev42/claude-smart"
  version "0.2.2"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/claude-smart/releases/download/v0.2.2/csm-aarch64-apple-darwin.tar.gz"
  sha256 "a7083f50866b7134419b5c222c09d5281bd327a02591029572a827f45ee31607"

  def install
    bin.install "csm"
  end

  test do
    assert_match "csm", shell_output("#{bin}/csm --version")
  end
end