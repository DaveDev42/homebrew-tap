class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.0.1"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-apple-darwin.tar.gz"
      # sha256 will be filled after first release
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-apple-darwin.tar.gz"
      # sha256 will be filled after first release
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-unknown-linux-musl.tar.gz"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-unknown-linux-musl.tar.gz"
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
