cask "cryptomator" do
  version "1.5.19"
  sha256 "6576c1425e1388d83be525f240a8140c8a73e10dfe2a3ecd65ff452f7c0d6c63"

  url "https://github.com/cryptomator/cryptomator/releases/download/#{version}/Cryptomator-#{version}.dmg",
      verified: "github.com/cryptomator/cryptomator/"
  name "Cryptomator"
  desc "Multi-platform client-side cloud file encryption tool"
  homepage "https://cryptomator.org/"

  livecheck do
    url "https://cryptomator.org/downloads/mac/thanks/"
    strategy :page_match
    regex(%r{href=.*?/Cryptomator-(\d+(?:\.\d+)*)\.dmg}i)
  end

  depends_on macos: ">= :high_sierra"

  app "Cryptomator.app"

  zap trash: [
    "~/Library/Application Support/Cryptomator",
    "~/Library/Logs/Cryptomator",
    "~/Library/Preferences/org.cryptomator.plist",
  ]
end
