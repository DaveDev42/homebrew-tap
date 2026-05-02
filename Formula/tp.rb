class Tp < Formula
  desc "Remote Claude Code session controller"
  homepage "https://github.com/DaveDev42/teleprompter"
  version "0.1.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DaveDev42/teleprompter/releases/download/v#{version}/tp-darwin_arm64"
      sha256 "3a8d489d5b5ec39dcaa831ddacf5e55fae75f1ffedca089f27c69989f5deede3"
    else
      url "https://github.com/DaveDev42/teleprompter/releases/download/v#{version}/tp-darwin_x64"
      sha256 "4c8d118b0da405fb7149e8a85979d835487dbae6a794690d4d9bfec939ba4f92"
    end
  end

  def install
    binary = Dir["tp-darwin_*"].first
    bin.install binary => "tp"
    generate_completions_from_executable(bin/"tp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tp version")
  end
end
