class ClaudeWorktree < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/claude-worktree-rs"
  version "0.1.0"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/claude-worktree-rs/releases/download/v#{version}/cw-aarch64-apple-darwin.tar.gz"
      # sha256 will be filled after first release
    else
      url "https://github.com/DaveDev42/claude-worktree-rs/releases/download/v#{version}/cw-x86_64-apple-darwin.tar.gz"
      # sha256 will be filled after first release
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/claude-worktree-rs/releases/download/v#{version}/cw-aarch64-unknown-linux-musl.tar.gz"
    else
      url "https://github.com/DaveDev42/claude-worktree-rs/releases/download/v#{version}/cw-x86_64-unknown-linux-musl.tar.gz"
    end
  end

  def install
    bin.install "cw"
  end

  test do
    assert_match "cw #{version}", shell_output("#{bin}/cw --version")
  end
end
