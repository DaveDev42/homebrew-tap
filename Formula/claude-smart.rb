class ClaudeSmart < Formula
  desc "Smart launcher for Claude Code (csm): session select, account switch, usage"
  homepage "https://github.com/DaveDev42/claude-smart"
  version "0.2.3"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/claude-smart/releases/download/v0.2.3/csm-aarch64-apple-darwin.tar.gz"
  sha256 "9415eb00ffc586032d268cdefae7dd83b9520fd22929c47ebc6238aeddf93a9d"

  def install
    bin.install "csm"
  end

  test do
    assert_match "csm", shell_output("#{bin}/csm --version")
  end
end