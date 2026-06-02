class Tp < Formula
  desc "Remote Claude Code session controller"
  homepage "https://github.com/DaveDev42/teleprompter"
  version "0.1.44"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/teleprompter/releases/download/v0.1.44/tp-darwin_arm64"
  sha256 "5b87e6bc4e3a0f753f318213357475ee793ff7a64eba31f70e7d6fbb7966c985"

  def install
    bin.install "tp-darwin_arm64" => "tp"
    chmod 0755, bin/"tp"
    generate_completions_from_executable(bin/"tp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tp version")
  end
end