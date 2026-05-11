class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.1.6"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v0.1.6/gw-aarch64-apple-darwin.tar.gz"
  sha256 "d1d1c4e23436c4b8a05287da7587dcb05ba0a2c081d1ecca208a4f70a1142ccb"

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw #{version}", shell_output("#{bin}/gw --version")
  end
end