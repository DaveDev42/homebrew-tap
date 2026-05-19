class Tp < Formula
  desc "Remote Claude Code session controller"
  homepage "https://github.com/DaveDev42/teleprompter"
  version "0.1.38"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/teleprompter/releases/download/v0.1.38/tp-darwin_arm64"
  sha256 "9307ea336e9718940a091fe72daf85b601ba629f0090a750ff1c4ae1224bbf2f"

  def install
    bin.install "tp-darwin_arm64" => "tp"
    chmod 0755, bin/"tp"
    generate_completions_from_executable(bin/"tp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tp version")
  end
end