cask "raze" do
  version "1.7.1"
  sha256 "b2b262b029fff58575cd5f5a9a2df65bf8fe3770d68a27ef45d5ecabee467be8"

  url "https://github.com/coelckers/Raze/releases/download/#{version}/raze-macos-#{version}.zip"
  name "Raze"
  desc "Build engine port backed by GZDoom tech"
  homepage "https://github.com/coelckers/Raze"

  livecheck do
    url :url
    regex(/^raze[._-]macos[._-]v?(\d+(?:\.\d+)+)\.zip$/i)
    strategy :github_latest do |json, regex|
      json["assets"]&.map do |asset|
        match = asset["name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  app "Raze.app"

  zap trash: [
    "~/Documents/Raze",
    "~/Library/Application Support/Raze",
    "~/Library/Preferences/org.drdteam.raze.plist",
    "~/Library/Preferences/org.zdoom.raze.plist",
    "~/Library/Preferences/raze.ini",
    "~/Library/Saved Application State/org.drdteam.raze.savedState",
    "~/Library/Saved Application State/org.zdoom.raze.savedState",
  ]
end
