cask "macos-modern-notify" do
  version "0.0.2"
  sha256 "9f5467fb9a618f786b32cda08448629f9042ad9ce465bc071e836f28470fd034"

  url "https://github.com/DaveDev42/macos-modern-notify/releases/download/v#{version}/macos-modern-notify-#{version}-universal.tar.gz"
  name "macos-modern-notify"
  desc "macOS user-notification CLI that posts via UNUserNotificationCenter"
  homepage "https://github.com/DaveDev42/macos-modern-notify"

  depends_on macos: ">= :ventura"

  app "macos-modern-notify.app"
  binary "#{appdir}/macos-modern-notify.app/Contents/MacOS/notify"

  zap trash: [
    "~/.local/state/macos-modern-notify.sock",
    "~/.local/state/macos-modern-notify.log",
  ]
end
