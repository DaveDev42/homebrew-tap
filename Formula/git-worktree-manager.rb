class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.1.2"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-apple-darwin.tar.gz"
      sha256 "8bcc6ce5bf7d1c4caec916d9585e1f288a94892ccdfe60e2ed970b039c630fca"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-apple-darwin.tar.gz"
      sha256 "d4579344966942d88c3b2b08f7115795062f9121aa479dfa765dce1a1ac60871"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f9f0e0e916506061cc4a5b65999d4bd3a6bcb2600413a33850cdee3eea9bbc2f"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9d1647779d2a1da71a9ff94e7521128b950f8fe25cd8fdc60b4d39c5b50e5180"
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
