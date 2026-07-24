class Hats < Formula
  desc "Identity profiles for agents and shells"
  homepage "https://github.com/chrismcdermut/hats"
  url "https://github.com/chrismcdermut/hats/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "4ad76aa4221b3a8d4b8b1108c620aa95f3517b3e79956567f84b4e03c3972f08"
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
