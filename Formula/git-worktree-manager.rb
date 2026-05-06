class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.1.4"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v0.1.4/gw-aarch64-apple-darwin.tar.gz"
  sha256 "6d8dede4907e9fd490069164e8a440425d173e20971ca290b908d64cf97c2b56"

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw #{version}", shell_output("#{bin}/gw --version")
  end
end