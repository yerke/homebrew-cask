cask "visual-studio-code" do
  arch = Hardware::CPU.intel? ? "darwin" : "darwin-arm64"

  version "1.61.1"

  url "https://update.code.visualstudio.com/#{version}/#{arch}/stable"
  if Hardware::CPU.intel?
    sha256 "a8860ab67239c11c962e6ed147024e4ce543d4e54c9a6371b7f3397f6713a3ad"
  else
    sha256 "3fe4747efe2630efd7e3d29805f3b8ab2ca04f62e6b7a102d5973b0ac404b72d"
  end

  name "Microsoft Visual Studio Code"
  name "VS Code"
  desc "Open-source code editor"
  homepage "https://code.visualstudio.com/"

  livecheck do
    url "https://update.code.visualstudio.com/api/update/#{arch}/stable/VERSION"
    strategy :page_match
    regex(/"productVersion"\s*:\s*"(\d+(:?\.\d+)*)"/)
  end

  auto_updates true

  app "Visual Studio Code.app"
  binary "#{appdir}/Visual Studio Code.app/Contents/Resources/app/bin/code"

  zap trash: [
    "~/Library/Application Support/Code",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.microsoft.vscode.sfl*",
    "~/Library/Caches/com.microsoft.VSCode",
    "~/Library/Caches/com.microsoft.VSCode.ShipIt",
    "~/Library/Preferences/ByHost/com.microsoft.VSCode.ShipIt.*.plist",
    "~/Library/Preferences/com.microsoft.VSCode.helper.plist",
    "~/Library/Preferences/com.microsoft.VSCode.plist",
    "~/Library/Saved Application State/com.microsoft.VSCode.savedState",
    "~/.vscode",
  ]
end
