cask "humdrop" do
  version "0.082"
  sha256 :no_check

  url "https://github.com/Fe2-O3/HumDrop/releases/download/v#{version}/HumDrop-macOS.zip"
  name "HumDrop"
  desc "Sync 4K video and photos from WiFi bird and trail cameras"
  homepage "https://github.com/Fe2-O3/HumDrop"

  app "HumDrop.app"

  zap trash: [
    "~/Library/Application Support/HumDrop",
  ]
end
