class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.1.3"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-apple-darwin.tar.gz"
      sha256 "c6b49ac4563eec39cf877654b96321368363837507ffd5ca7d72c3740c77ac6c"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-apple-darwin.tar.gz"
      sha256 "20752f20a7088bddd197ab459ca988f06d05eb119d5a427fbeb1cd8aeb3e6df4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "17bd44728336b07ba32f3fe33d981bb502177466530982850d3ba187fb9bfcc8"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-unknown-linux-musl.tar.gz"
      sha256 "692418f962757fc340ebd3e7ee359767aef0ca4d0e903522b8f8a0222e70d77b"
    end
  end

  def install
    bin.install "gw"
  end

  test do
    assert_match "gw #{version}", shell_output("#{bin}/gw --version")
  end
end
