class GalleyLite < Formula
  desc "Comment-to-edit any local HTML with the Claude Code session that built it"
  homepage "https://github.com/maggiemchen/galley-lite"
  url "https://github.com/maggiemchen/galley-lite/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fc6ae0a8326f87d545cb72c64caa5c0e8d3902ae593d60cbed68ac053161443e"
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
