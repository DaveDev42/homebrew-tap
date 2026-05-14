class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.1.9"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v0.1.9/gw-aarch64-apple-darwin.tar.gz"
  sha256 "961538b9344c03ec27f93d39c37fa5bf25935f48c2145e36d0c5518737f6a0bd"

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw #{version}", shell_output("#{bin}/gw --version")
  end
end