class Lynxoffice < Formula
  desc "Read, edit and convert Word, Excel, PowerPoint and PDF files from the terminal"
  homepage "https://github.com/LynxOffice/lynxoffice-cli-mac"
  url "https://github.com/LynxOffice/lynxoffice-cli-mac/releases/download/v1.1.0/lynxoffice-1.1.0-macos.tar.gz"
  sha256 "c8f5d52aca40ea610b49c0dd5e06dc1d6b27844c75dd55e2700f6639c4037dec"

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
