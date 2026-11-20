class Lynxoffice < Formula
  desc "Read and edit Word, Excel, PowerPoint and PDF files from the terminal"
  homepage "https://github.com/LynxOffice/lynxoffice-cli-mac"
  url "https://github.com/LynxOffice/lynxoffice-cli-mac/releases/download/v1.1.3/lynxoffice-1.1.3-macos.tar.gz"
  sha256 "903f6ee6cd4fadba88ae20e9919c0521363b636ef7d45ed8a36d45e0b0b8f788"

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
