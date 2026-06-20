class ClaudeSmart < Formula
  desc "Smart launcher for Claude Code (csm): session select, account switch, usage"
  homepage "https://github.com/DaveDev42/claude-smart"
  version "0.2.0"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/claude-smart/releases/download/v0.2.0/csm-aarch64-apple-darwin.tar.gz"
  sha256 "4ddcfa26b0604b3b75eb61eb8628cdbe0c94f66fa206ef6628e80a41be396c4a"

  def install
    bin.install "csm"
  end

  test do
    assert_match "csm", shell_output("#{bin}/csm --version")
  end
end
