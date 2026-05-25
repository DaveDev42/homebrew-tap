class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.1.15"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v0.1.15/gw-aarch64-apple-darwin.tar.gz"
  sha256 "81610dca4aed5774e68990cd37806a6a3a1ad344a600e7a8879e7f4202214189"

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw #{version}", shell_output("#{bin}/gw --version")
  end
end