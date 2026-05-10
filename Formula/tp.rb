class Tp < Formula
  desc "Remote Claude Code session controller"
  homepage "https://github.com/DaveDev42/teleprompter"
  version "0.1.27"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/teleprompter/releases/download/v0.1.27/tp-darwin_arm64"
  sha256 "b768d7db053373d487f8881d2c9144c0f0fbc7c80099bd6498a27a63a947e2a1"

  def install
    bin.install "tp-darwin_arm64" => "tp"
    chmod 0755, bin/"tp"
    generate_completions_from_executable(bin/"tp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tp version")
  end
end