class ClaudeSmart < Formula
  desc "Cross-platform Claude Code smart session manager (csm)"
  homepage "https://github.com/DaveDev42/claude-smart"
  version "0.2.0"
  on_macos do
    on_arm do
      url "https://github.com/DaveDev42/claude-smart/releases/download/v0.2.0/csm-aarch64-apple-darwin.tar.gz"
    end
  end
  def install
    bin.install "csm"
  end
end
