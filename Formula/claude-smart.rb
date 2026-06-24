class ClaudeSmart < Formula
  desc "Smart launcher for Claude Code (csm): session select, account switch, usage"
  homepage "https://github.com/DaveDev42/claude-smart"
  version "0.2.1"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/claude-smart/releases/download/v0.2.1/csm-aarch64-apple-darwin.tar.gz"
  sha256 "3e7eee1ead4b827e3be3a17a35f9ef6b1f278c612ce366cb4dbc1c414881d0d7"

  def install
    bin.install "csm"
  end

  test do
    assert_match "csm", shell_output("#{bin}/csm --version")
  end
end