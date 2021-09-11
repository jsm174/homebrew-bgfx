cask "vulkan-sdk" do
  version "1.2.189.0"
  sha256 "0e2f9bf489988211480e0530299096cdfa2650ee120337417cd8f439592abd68"

  url "https://sdk.lunarg.com/sdk/download/#{version}/mac/vulkansdk-macos-#{version}.dmg?Human=true"

  installer script: {
      executable: "#{staged_path}/InstallVulkan.app/Contents/MacOS/InstallVulkan",
      args:       ["--root", "#{staged_path}", "--accept-licenses", "--accept-messages", "--confirm-command", "install"],
      sudo:       true,
  }

  uninstall script: {
      executable: "#{staged_path}/UninstallVulkan.app/Contents/MacOS/UninstallVulkan",
      args:       ["--confirm-command", "purge"],
      sudo:       true,
  }

  name "VulkanSDK"
  desc "Collection of essential tools used by developers to assist in development and debugging of Vulkan applications."
  homepage "https://www.lunarg.com/vulkan-sdk/"
end
