class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.0.32"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-apple-darwin.tar.gz"
      sha256 "ed85207481e3a0a7899c4368cc1b1ed6a34ff3402d62d0283daa71b60cd81e13"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-apple-darwin.tar.gz"
      sha256 "a5544a40754de3a23bfcbf18cc83732d9d7b1029ee7640502c572b029a17e6ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b7cb5c2fd218f0cb5bbb40ebe635ff6b0c479e0623677cd297342120bb64845f"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2936a905ae4e3ee6368067f20014d1495c6a33301fc57a2486c90cf427d9f9e6"
    end
  end

  def install
    bin.install "gw"
    bin.install "cw"
  end

  test do
    assert_match "gw #{version}", shell_output("#{bin}/gw --version")
  end
end
