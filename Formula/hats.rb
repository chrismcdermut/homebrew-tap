class Hats < Formula
  desc "Identity profiles for agents and shells"
  homepage "https://github.com/chrismcdermut/hats"
  url "https://github.com/chrismcdermut/hats/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "81863373e5e1d6c9de093a05d62ab4949e40e6c6c61e99f5017528558ba28f46"
  license "MIT"
  head "https://github.com/chrismcdermut/hats.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match "identity profiles", shell_output("#{bin}/hats --help")
  end
end
