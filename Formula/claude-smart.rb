class ClaudeSmart < Formula
  desc "Smart launcher for Claude Code (csm): session select, account switch, usage"
  homepage "https://github.com/DaveDev42/claude-smart"
  version "0.4.6"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/claude-smart/releases/download/v0.4.6/csm-aarch64-apple-darwin.tar.gz"
  sha256 "93e40b8439504e9c8b07dc23bcf0457e585fffa637fca3ddd8ccef9d514be70f"

  def install
    bin.install "csm"
    # Command aliases: csm dispatches on argv[0] only for "csm-hook"; every
    # other name behaves identically to `csm`, so these are safe drop-in names.
    bin.install_symlink "csm" => "smart-claude"
  end

  test do
    assert_match "csm", shell_output("#{bin}/csm --version")
    assert_match "csm", shell_output("#{bin}/smart-claude --version")
  end
end