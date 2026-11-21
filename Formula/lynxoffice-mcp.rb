class LynxofficeMcp < Formula
  desc "MCP server that lets AI agents read and edit Office documents and PDFs"
  homepage "https://github.com/LynxOffice/lynxoffice-mcp-mac"
  url "https://github.com/LynxOffice/lynxoffice-mcp-mac/releases/download/v1.1.4/lynxoffice-mcp-1.1.4-macos.tar.gz"
  sha256 "8b5ab6179b880c5c5886bb2d3c31df18dda344391e654bc02cdd1a2c37f41f5d"

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
