class Lynxoffice < Formula
  desc "Read, edit and convert Word, Excel, PowerPoint and PDF files from the terminal"
  homepage "https://github.com/LynxOffice/lynxoffice-cli-mac"
  url "https://github.com/LynxOffice/lynxoffice-cli-mac/releases/download/v1.1.1/lynxoffice-1.1.1-macos.tar.gz"
  sha256 "3bbdd58a6fa19d0143fc262556f9ea8edd7ddbd903eb53bcb9d3925f4edb7f82"

  depends_on macos: :sonoma

  def install
    # The engine finds its fonts in the bundle beside the REAL executable, and
    # Homebrew links no bundle into bin, so both go to libexec and bin gets a
    # script that execs the real path.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"lynxoffice"
  end

  test do
    assert_equal "lynxoffice #{version}", shell_output("#{bin}/lynxoffice version").strip
  end
end
