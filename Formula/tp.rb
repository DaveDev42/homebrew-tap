class Tp < Formula
  desc "Remote Claude Code session controller"
  homepage "https://github.com/DaveDev42/teleprompter"
  version "0.1.24"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  url "https://github.com/DaveDev42/teleprompter/releases/download/v0.1.24/tp-darwin_arm64"
  sha256 "2a85e03edbaaa3d287697805ecc2c487503d7b7895fc5f85ddfbc938d8c10d6b"

  def install
    bin.install "tp-darwin_arm64" => "tp"
    chmod 0755, bin/"tp"
    generate_completions_from_executable(bin/"tp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tp version")
  end
end