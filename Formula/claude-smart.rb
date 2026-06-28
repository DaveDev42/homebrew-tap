class ClaudeSmart < Formula
  desc "Smart launcher for Claude Code (csm): session select, account switch, usage"
  homepage "https://github.com/DaveDev42/claude-smart"
  version "0.2.9"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/claude-smart/releases/download/v0.2.9/csm-aarch64-apple-darwin.tar.gz"
  sha256 "5b825d9f918d45bc85b2d1decdd59e45813da763609c581c7508c16a220ffb6d"

  def install
    bin.install "csm"
  end

  test do
    assert_match "csm", shell_output("#{bin}/csm --version")
  end
end