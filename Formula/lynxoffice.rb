class Lynxoffice < Formula
  desc "Read and edit Word, Excel, PowerPoint and PDF files from the terminal"
  homepage "https://github.com/LynxOffice/lynxoffice-cli-mac"
  url "https://github.com/LynxOffice/lynxoffice-cli-mac/releases/download/v1.1.2/lynxoffice-1.1.2-macos.tar.gz"
  sha256 "cffe45d17e89635ab9f716f6b6d1b99023e150ac76fcdac050c463378eaba9d8"

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
