class BgfxCmake < Formula
  desc "Independently maintained CMake build scripts for bgfx"
  homepage "https://github.com/bkaradzic/bgfx.cmake"
  url "https://github.com/bkaradzic/bgfx.cmake/archive/76e5f9985d96c3390598b7213ded7ef46eb49a16.tar.gz"
  sha256 "825a88bac01cc4e18a8ffa16198189c23ea3638115efd25a07e5cd858c7a3503"
  license "CC0-1.0"
  head "https://github.com/bkaradzic/bgfx.cmake.git", branch: "master"

  depends_on "cmake" => :build

  resource "bgfx" do
    url "https://github.com/bkaradzic/bgfx.git", revision: "9ecd4625388f3ff4601bb05e37f7bb6414203a73"
  end

  resource "bimg" do
    url "https://github.com/bkaradzic/bimg.git", revision: "6693de0e50ff7e76a22d6f37251fa2dec12168cd"
  end

  resource "bx" do
    url "https://github.com/bkaradzic/bx.git", revision: "e50536ac03eb404f50123d23f2c9ab2b3e4663e7"
  end

  def install
    unless build.head?
      (buildpath/"bgfx").install resource("bgfx")
      (buildpath/"bimg").install resource("bimg")
      (buildpath/"bx").install resource("bx")
    end

    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "#{bin}/shaderc", "-v"
  end
end
