class Humdrop < Formula
  desc "Sync 4K video and photos from WiFi bird and trail cameras"
  homepage "https://github.com/Fe2-O3/HumDrop"
  url "https://github.com/Fe2-O3/HumDrop/archive/refs/tags/v0.082.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "Apache-2.0"
  head "https://github.com/Fe2-O3/HumDrop.git", branch: "main"

  depends_on "python@3.12"
  depends_on "tcl-tk"

  def install
    # Create a virtualenv and install dependencies
    venv = libexec/"venv"
    system "python3.12", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", "customtkinter"

    # Install the app
    libexec.install "cross-platform/humdrop.py"

    # Create launcher script
    (bin/"humdrop").write <<~EOS
      #!/bin/bash
      exec "#{venv}/bin/python" "#{libexec}/humdrop.py" "$@"
    EOS
  end

  test do
    assert_predicate bin/"humdrop", :exist?
  end
end
