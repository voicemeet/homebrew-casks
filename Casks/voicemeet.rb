cask "voicemeet" do
  version "0.0.4"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

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
