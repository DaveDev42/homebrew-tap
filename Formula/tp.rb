class Tp < Formula
  desc "Remote Claude Code session controller"
  homepage "https://github.com/DaveDev42/teleprompter"
  version "0.1.41"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/teleprompter/releases/download/v0.1.41/tp-darwin_arm64"
  sha256 "97ce50b9b6f755f4637671c979bd3a2c95e2465891d9edcd4b57388fe125b3d0"

  def install
    bin.install "tp-darwin_arm64" => "tp"
    chmod 0755, bin/"tp"
    generate_completions_from_executable(bin/"tp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tp version")
  end
end