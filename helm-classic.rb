class HelmClassic < Formula
  desc "The package manager for Kubernetes"
  homepage "https://helm.sh"
  url "https://bintray.com/deis/helm/download_file?file_path=helmc-0.8.0%2Bf3cafbc-darwin-amd64.zip"
  sha256 "a8056f714e9a660b7fd7d8cd74e63d29d45663bb3edcc6d3188387fbc6475339"

  bottle :unneeded

  depends_on :hg
  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    bin.install "helmc"
  end

  test do
    system "#{bin}/helmc", "create", "foo"
    assert File.directory?("#{testpath}/.helmc/workspace/charts/foo")
  end
end
