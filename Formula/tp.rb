# Formula for the `tp` CLI — Teleprompter remote Claude Code session controller.
#
# INSTALLATION LAYOUT (set once manually; persists across automated bumps):
#
#   The bundle tarball (tp-darwin_arm64.tar.gz) has a single top-level directory
#   tp-darwin_arm64/ containing the prefix tree:
#
#     tp-darwin_arm64/
#       bin/tp                   ← Rust CLI binary (user-facing entrypoint)
#       libexec/tp/tpd           ← Bun SEA (passthrough trampoline blob; retired in task #5)
#       libexec/tp/tp-daemon     ← Rust daemon (default daemon since task #4)
#       libexec/tp/tp-relay      ← Rust relay
#       libexec/tp/tp-runner     ← Rust runner (default runner since task #4)
#
#   Homebrew auto-extracts the tarball and cd's into the single root directory
#   (tp-darwin_arm64/) before running `def install`. Therefore bin.install "bin/tp"
#   and (libexec/"tp").install "libexec/tp/<bin>" reference paths RELATIVE to that
#   single root directory — Homebrew has already stripped the outer tp-darwin_arm64/
#   component. This is Homebrew's standard tarball behaviour for archives with a
#   single top-level directory.
#
#   The Rust binary's locate_* resolvers resolve each helper binary as:
#     canonicalize(/opt/homebrew/bin/tp)          → /opt/homebrew/Cellar/tp/<ver>/bin/tp
#     ../../libexec/tp/<bin>                       → /opt/homebrew/Cellar/tp/<ver>/libexec/tp/<bin>
#   This path is exactly where (libexec/"tp").install puts each binary. ✓
#
#   POST-FLIP (task #4): the Rust `tp` now spawns the Rust `tp-daemon` (which
#   spawns `tp-runner`) by default instead of the Bun `tpd` blob. The
#   libexec/tp/tp-daemon, tp-relay, and tp-runner binaries MUST be installed or
#   `tp` fails with "bundled tp-daemon not found". Each install is guarded with
#   `if File.exist?` so this formula stays compatible with an older tarball that
#   predates those binaries (they simply won't be installed for such a build).
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
  version "0.1.53"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  # url + sha256 are rewritten by the homebrew-tap-release action on each release.
  # The url points at the darwin_arm64 bundle tarball (prefix tree: bin/tp + libexec/tp/*).
  url "https://github.com/DaveDev42/teleprompter/releases/download/v0.1.53/tp-darwin_arm64.tar.gz"
  sha256 "c55ebdf28c0b5f09ec994ed0a9bc0fd4c89184df0fd2a45c83ecee330a7dc2ef"

  def install
    # Rust CLI binary → /opt/homebrew/Cellar/tp/<ver>/bin/tp
    # Homebrew has already cd'd into the single root dir (tp-darwin_arm64/) extracted
    # from the tarball, so "bin/tp" is the correct relative path.
    bin.install "bin/tp" => "tp"

    # Helper binaries → /opt/homebrew/Cellar/tp/<ver>/libexec/tp/<bin>
    # Not in bin/ so they do not appear in user PATH — only the Rust tp binary is
    # user-facing. The Rust tp's locate_* resolvers find each at
    # ../../libexec/tp/<bin> relative to the canonicalized bin/tp path.
    #
    #   tpd        — Bun SEA passthrough trampoline blob (retired in task #5).
    #   tp-daemon  — default daemon (task #4). REQUIRED post-flip.
    #   tp-relay   — Rust relay.
    #   tp-runner  — default runner (task #4). REQUIRED post-flip.
    #
    # Each is guarded with `if File.exist?` so the formula also installs cleanly
    # from an older tarball that predates a given binary.
    libexec_tp = libexec/"tp"
    %w[tpd tp-daemon tp-relay tp-runner].each do |b|
      libexec_tp.install "libexec/tp/#{b}" if File.exist?("libexec/tp/#{b}")
    end

    # Ensure all binaries are executable (they are chmod +x in the tarball, but
    # Homebrew may reset permissions on install in some edge cases).
    chmod 0755, bin/"tp"
    Dir[libexec_tp/"*"].each { |f| chmod 0755, f }

    # Shell completions — generated from the installed Rust binary.
    # `tp completions <shell>` is a pure-native subcommand (no blob/network/daemon),
    # so it runs safely at brew install time.
    generate_completions_from_executable(bin/"tp", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tp version")
  end
end
