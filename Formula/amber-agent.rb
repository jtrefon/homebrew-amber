class AmberAgent < Formula
  desc "C++ AI agent harness: headless CLI, ncurses TUI, benchmark harness"
  homepage "https://github.com/jtrefon/amber"
  version "0.4.9"
  url "https://github.com/jtrefon/amber/releases/download/v#{version}/amber-#{version}-darwin-#{Hardware::CPU.arch}.tar.gz"
  license "Apache-2.0"

  # Populated by the bump workflow from the release checksums (see
  # .github/workflows/bump.yml). Shas are for the darwin tarballs attached to
  # each GitHub Release.
  on_arm do
    sha256 "ccf1e82401fa434646d3bbd01326a3f7939d68490e5e3bf480d5e4b53eb640cb"
  end
  # Intel tarballs ship once release-macos runs an x86_64 runner; the matching
  # on_intel/sha256 block lands here via the bump workflow.
  # on_intel do
  #   sha256 "REPLACE_ME"
  # end

  # The release tarball is a staged install tree (usr/local/{bin,lib,include,
  # share}). Homebrew hoists the single top-level directory, so the staged
  # contents land under local/... here. amber resolves its data files relative
  # to argv0, so the layout works on Intel and Apple Silicon alike.
  def install
    %w[amber amber-cli amber-bench].each do |binary|
      bin.install "local/bin/#{binary}"
    end
    lib.install Dir["local/lib/*.a"]
    include.install "local/include/agent" => "agent"
    share.install "local/share/amber" => "amber"
  end

  test do
    version_out = shell_output("#{bin}/amber-cli --version")
    assert_match(/v?#{version}/, version_out)
  end

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end
end