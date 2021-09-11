# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class BgfxCmake < Formula
  desc "Independently maintained CMake build scripts for bgfx."
  homepage "https://github.com/bkaradzic/bgfx.cmake"
  license "https://github.com/bkaradzic/bgfx.cmake/blob/master/LICENSE"
  head "https://github.com/bkaradzic/bgfx.cmake.git"

  depends_on "cmake" => :build

  def install
    system "cmake", ".", "-B", "build"
    system "make", "-C", "build", "install"
  end

  test do
    system "false"
  end
end
