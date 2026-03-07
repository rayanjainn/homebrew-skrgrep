# We define a class that inherits from Formula (the Homebrew base)
class Skrgrep < Formula
  # A short description of what the tool does
  desc "A lightning-fast, multi-threaded grep implementation written in Rust"
  
  # The website for your project
  homepage "https://github.com/rayanjainn/skrgrep"
  
  # The link to the specific version of source code we want to download
  url "https://github.com/rayanjainn/skrgrep/archive/refs/tags/v0.1.0.tar.gz"
  
  # The security hash we generated in Phase 2
  sha256 "754da75a5c3de265ce3f8e29bdad2ac1d163745c9ad0ffe7dbc0a445e26f2084"
  
  # Software license (optional but good)
  license "MIT"

  # We tell Homebrew that this software REQUIRES Rust to be installed to build it
  depends_on "rust" => :build

  # This function contains the actual terminal commands to install the app
  def install
    # 'system' runs a shell command
    # 'cargo install' compiles the code
    # '*std_cargo_args' is a Homebrew shortcut that tells Cargo:
    # "Install this into the proper Homebrew folder (like /usr/local/bin) 
    # and build it in --release mode for maximum speed."
    system "cargo", "install", *std_cargo_args
  end

  # A small test to make sure it actually installed correctly
  test do
    # Create a dummy file
    (testpath/"test.txt").write("hello world")
    # Run skrgrep and see if it finds "hello"
    assert_match "hello", shell_output("#{bin}/skrgrep hello test.txt")
  end
end
