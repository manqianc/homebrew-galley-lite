class GalleyLite < Formula
  desc "Comment-to-edit any local HTML with the Claude Code session that built it"
  homepage "https://github.com/maggiemchen/galley-lite"
  url "https://github.com/maggiemchen/galley-lite/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "35bf10c52bcfc0da9a0745fb8eb5dbbc7920447abcaee3200aaef0e807c7c6c7"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "galley-lite.mjs", "examples"
    (bin/"galley-lite").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/galley-lite.mjs" "$@"
    SH
  end

  test do
    assert_match "Usage: galley-lite", shell_output("#{bin}/galley-lite --help")
  end
end
