class Hats < Formula
  desc "Identity profiles for agents and shells"
  homepage "https://github.com/chrismcdermut/hats"
  url "https://github.com/chrismcdermut/hats/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "252f5b14ee8eb9bb125b95e0f9f4e33546900c570e0abb7ee03394109c79e0e9"
  license "MIT"
  head "https://github.com/chrismcdermut/hats.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "identity profiles", shell_output("#{bin}/hats --help")
  end
end
