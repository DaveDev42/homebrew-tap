class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.1.12"
  license "BSD-3-Clause"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v0.1.12/gw-aarch64-apple-darwin.tar.gz"
  sha256 "42eadc8fba2a57a6f83f534e7ae77731b714c121013d0c9eeaf6a37cd69db349"

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw #{version}", shell_output("#{bin}/gw --version")
  end
end