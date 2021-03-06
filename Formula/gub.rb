class Gub < Formula
  desc "The missing Github command-line"
  homepage "https://github.com/owahab/gogub"
  url "https://github.com/owahab/gogub.git",
    tag: "0.0.4"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    system(
      "go",
      "get",
      "-d",
      "./..."
    )

    system(
      "go",
      "build",
      "-o", bin/"gub",
      "-v",
      "github.com/owahab/gogub",
    )
  end

  test do
    system "#{bin}/gub", "--help"
  end
end
