cask "voicemeet" do
  version "0.0.1+2"
  sha256 "8f67f46c0d3099a0f88297bcbba2005f2eed2f38b8301fc9b7d9cd5fc4e15d46"

  url "https://github.com/voicemeet/releases/releases/download/v#{version}/VoiceMeet-#{version.tr("+", ".")}-macos-universal.dmg",
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
