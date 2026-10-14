class AmberAgent < Formula
  desc "C++ AI agent harness: headless CLI, ncurses TUI, benchmark harness"
  homepage "https://github.com/jtrefon/amber"
  version "0.5.6"
  url "https://github.com/jtrefon/amber/releases/download/v#{version}/amber-#{version}-darwin-arm64.tar.gz"
  license "Apache-2.0"

  # Populated by the bump workflow from the release checksums (see
  # .github/workflows/bump.yml). Apple Silicon only: amber no longer ships
  # Intel macOS tarballs, so no on_intel block exists.
  on_arm do
    sha256 "6e8d6516978eae207b5e780b605b4f137237cbc4221562d44ce702df74aee661"
  end

  # The release tarball is a staged install tree (usr/local/{bin,lib,include,
  # share}). Homebrew hoists the single top-level directory, so the staged
  # contents land under local/... here. amber resolves its data files relative
  # to argv0, so the layout works from any Homebrew prefix.
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
