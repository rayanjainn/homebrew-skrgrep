class Skrgrep < Formula
  desc "Fast multi-threaded grep in Rust"
  homepage "https://github.com/rayanjainn/skrgrep"
  version "0.1.1"

  # We define both URLs here
  if Hardware::CPU.arm?
    url "https://github.com/rayanjainn/skrgrep/releases/download/v0.1.1/skrgrep-aarch64-apple-darwin.tar.gz"
    sha256 "HASH_OF_THE_ARM_FILE"
  else
    url "https://github.com/rayanjainn/skrgrep/releases/download/v0.1.1/skrgrep-x86_64-apple-darwin.tar.gz"
    sha256 "HASH_OF_THE_INTEL_FILE"
  end

  def install
    # Since we already have the binary, we just move it to Homebrew's bin folder
    bin.install "skrgrep"
  end

  test do
    system "#{bin}/skrgrep", "--help"
  end
end
