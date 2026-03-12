class Skrgrep < Formula
  desc "Fast multi-threaded grep in Rust"
  homepage "https://github.com/rayanjainn/skrgrep"
  version "0.1.1"

  # We define both URLs here
  if Hardware::CPU.arm?
    url "https://github.com/rayanjainn/skrgrep/releases/download/v0.1.1/skrgrep-aarch64-apple-darwin.tar.gz"
    sha256 "c4c360a172c277e7865d23e919a157ae750f177a75f873a5044814a4ac7feae8"
  else
    url "https://github.com/rayanjainn/skrgrep/releases/download/v0.1.1/skrgrep-x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    # Since we already have the binary, we just move it to Homebrew's bin folder
    bin.install "skrgrep"
  end

  test do
    system "#{bin}/skrgrep", "--help"
  end
end
