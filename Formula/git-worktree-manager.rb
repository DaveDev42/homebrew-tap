class GitWorktreeManager < Formula
  desc "CLI tool integrating git worktree with AI coding assistants"
  homepage "https://github.com/DaveDev42/git-worktree-manager"
  version "0.0.29"
  license "BSD-3-Clause"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-apple-darwin.tar.gz"
      sha256 "8fdd7d8ec87ad007a8465fcea7387ac327d829fbb255bf5c577d2786c1214475"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-apple-darwin.tar.gz"
      sha256 "fbda86053d2d81f2363a06321b2e3a47e57ad0bd8d13df75e8f1e67668403199"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0fba452174d073f37782bb21ffb4ce007a5774f3ed72380664a2b7799eea34e2"
    else
      url "https://github.com/DaveDev42/git-worktree-manager/releases/download/v#{version}/gw-x86_64-unknown-linux-musl.tar.gz"
      sha256 "58750ed65236c199ab3181652d0cfc4f04318e8fd92d34058c29be6150c48d57"
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
