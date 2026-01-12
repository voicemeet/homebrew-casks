cask "voicemeet" do
  version "0.0.3"
  sha256 "c0bd053d84feb7b967352c775630116b1eeb0a2bf587050ef5cf663c3062ef58"

  url "https://github.com/voicemeet/releases/releases/download/v#{version}/VoiceMeet-#{version.tr("+", ".")}-universal.dmg",
      verified: "github.com/voicemeet/releases/"
  name "VoiceMeet"
  desc "Meet the World through Voice"
  homepage "https://voicemeet.io/"

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
    "~/Library/Caches/io.voicemeet.voicemeet",
    "~/Library/Caches/VoiceMeet",
    "~/Library/Preferences/io.voicemeet.voicemeet.plist",
    "~/Library/Saved Application State/io.voicemeet.voicemeet.savedState",
  ]
end
