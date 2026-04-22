class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.0.36"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-apple-darwin.tar.gz"
      sha256 "7d15ca9416f181735e1fdf91c795e0f37e585e7ef8a1468aa2f736c054cf54dd"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-apple-darwin.tar.gz"
      sha256 "89283bfd529c4224e64beb9d99d53692716c151764ed241deaeb43969ac111f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f41a24f47cebd811c565ee9270ba5357df5e499868c82163f62aba65620e4c31"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-unknown-linux-musl.tar.gz"
      sha256 "52a5882bc4a26b085753700f9beaf5d849bdbf946fba1109815a31453470012d"
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
