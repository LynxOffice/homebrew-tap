class Lynxoffice < Formula
  desc "Read and edit Word, Excel, PowerPoint and PDF files from the terminal"
  homepage "https://github.com/LynxOffice/lynxoffice-cli-mac"
  url "https://github.com/LynxOffice/lynxoffice-cli-mac/releases/download/v1.1.5/lynxoffice-1.1.5-macos.tar.gz"
  sha256 "3eca1641988444db6a3707a4262309fd7fd3a3b9f28307c61e6160311e01975c"

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
