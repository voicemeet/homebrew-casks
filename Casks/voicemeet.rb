cask "voicemeet" do
  version "0.0.5"
  sha256 "5869abc92899218f0a8901525fc75c563ae26f8c501ac5fba7cd7287e63e8ac0"

  url "https://github.com/voicemeet/releases/releases/download/v#{version}/VoiceMeet-#{version.tr("+", ".")}-macos-universal.dmg",
      verified: "github.com/voicemeet/releases/"
  name "VoiceMeet"
  desc "Meet the World through Voice"
  homepage "https://voicemeet.net/"

  livecheck do
    url :url
    strategy :git do |tags|
      tags.filter_map do |tag|
        match = tag&.match(/^v?(\d+(?:\.\d+)+(\+\d+)?)$/i)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on macos: ">= :big_sur"

  app "VoiceMeet.app"

  zap trash: [
    "~/Library/Application Support/VoiceMeet",
    "~/Library/Caches/net.voicemeet.voicemeet",
    "~/Library/Caches/VoiceMeet",
    "~/Library/Preferences/net.voicemeet.voicemeet.plist",
    "~/Library/Saved Application State/net.voicemeet.voicemeet.savedState",
  ]
end
