# Formula for the `tp` CLI — Teleprompter remote Claude Code session controller.
#
# INSTALLATION LAYOUT (set once manually; persists across automated bumps):
#
#   The bundle tarball (tp-darwin_arm64.tar.gz) has a single top-level directory
#   tp-darwin_arm64/ containing the prefix tree:
#
#     tp-darwin_arm64/
#       bin/tp              ← Rust CLI binary (user-facing entrypoint)
#       libexec/tp/tpd      ← Bun SEA (daemon/runner trampoline blob)
#
#   Homebrew auto-extracts the tarball and cd's into the single root directory
#   (tp-darwin_arm64/) before running `def install`. Therefore bin.install "bin/tp"
#   and (libexec/"tp").install "libexec/tp/tpd" reference paths RELATIVE to that
#   single root directory — Homebrew has already stripped the outer tp-darwin_arm64/
#   component. This is Homebrew's standard tarball behaviour for archives with a
#   single top-level directory.
#
#   locate_bun_blob() in the Rust binary resolves:
#     canonicalize(/opt/homebrew/bin/tp)          → /opt/homebrew/Cellar/tp/<ver>/bin/tp
#     ../../libexec/tp/tpd                         → /opt/homebrew/Cellar/tp/<ver>/libexec/tp/tpd
#   This path is exactly where (libexec/"tp").install puts tpd. ✓
#
# AUTOMATED BUMPS:
#   The DaveDev42/homebrew-tap-release@v1 reusable action rewrites only the
#   `version`, `url`, and `sha256` fields (awk per-line). The field order below
#   mirrors the previous working formula so the action's line-matching is
#   unchanged. The `def install` block is PRESERVED across all automated version
#   bumps — do not restructure it.

class Tp < Formula
  desc "Remote Claude Code session controller"
  homepage "https://github.com/DaveDev42/teleprompter"
  version "0.1.51"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  # url + sha256 are rewritten by the homebrew-tap-release action on each release.
  # The url points at the darwin_arm64 bundle tarball (prefix tree: bin/tp + libexec/tp/tpd).
  url "https://github.com/DaveDev42/teleprompter/releases/download/v0.1.51/tp-darwin_arm64.tar.gz"
  sha256 "bc6ddb37108169b6a928c2217c183bf99b4dd3d13f1504ba579b4dfc919f6ef7"

  def install
    # Rust CLI binary → /opt/homebrew/Cellar/tp/<ver>/bin/tp
    # Homebrew has already cd'd into the single root dir (tp-darwin_arm64/) extracted
    # from the tarball, so "bin/tp" is the correct relative path.
    bin.install "bin/tp" => "tp"

    # Bun SEA blob (tpd) → /opt/homebrew/Cellar/tp/<ver>/libexec/tp/tpd
    # Not in bin/ so it does not appear in user PATH — only the Rust tp binary
    # is user-facing. locate_bun_blob() finds tpd at ../../libexec/tp/tpd relative
    # to the canonicalized bin/tp path.
    (libexec/"tp").install "libexec/tp/tpd"

    # Ensure both binaries are executable (they are chmod +x in the tarball, but
    # Homebrew may reset permissions on install in some edge cases).
    chmod 0755, bin/"tp"
    chmod 0755, libexec/"tp/tpd"

    # Shell completions — generated from the installed Rust binary.
    # `tp completions <shell>` is a pure-native subcommand (no blob/network/daemon),
    # so it runs safely at brew install time.
    generate_completions_from_executable(bin/"tp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tp version")
  end
end