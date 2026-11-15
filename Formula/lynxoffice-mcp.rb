class LynxofficeMcp < Formula
  desc "MCP server that lets AI agents read, edit and convert Office documents and PDFs"
  homepage "https://github.com/LynxOffice/lynxoffice-mcp-mac"
  url "https://github.com/LynxOffice/lynxoffice-mcp-mac/releases/download/v1.1.1/lynxoffice-mcp-1.1.1-macos.tar.gz"
  sha256 "06259be847d21c2cde97b6d16737fad39187da76f691b5df7a10cd64fada0705"

  depends_on macos: :sonoma

  def install
    # Same layout as the lynxoffice formula: the fonts bundle sits beside the
    # real executable, so both go to libexec and bin gets an exec script.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"lynxoffice-mcp"
  end

  def caveats
    <<~EOS
      Point an MCP client at #{HOMEBREW_PREFIX}/bin/lynxoffice-mcp, for example:
        claude mcp add lynxoffice -- #{HOMEBREW_PREFIX}/bin/lynxoffice-mcp
    EOS
  end

  test do
    request = '{"jsonrpc":"2.0","id":1,"method":"initialize","params":' \
              '{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"brew","version":"1"}}}'
    output = pipe_output("#{bin}/lynxoffice-mcp", "#{request}\n")
    assert_match "lynxoffice-mcp", output
  end
end
