#!/bin/sh
if [ $EUID != 0 ]; then
  # Get sudo permission for the whole script, or not at all
  sudo "$0" "$@"
  exit $?
fi

echo "Unloading if Buffered-Watch already exists..."
launchctl unload -w /Library/LaunchDaemons/com.heysweet.buffered-watch.plist

echo "Downloading sleepwatcher..."
curl "http://www.bernhard-baehr.de/sleepwatcher_2.2.tgz" -o "sleepwatcher_2.2.tgz"
tar -xzf ./sleepwatcher_2.2.tgz
rm ./sleepwatcher_2.2.tgz

echo "Installing sleepwatcher..."
cp ./sleepwatcher_2.2/sleepwatcher /usr/local/sbin/sleepwatcher

echo "Setting up daemon..."
cp -r ./buffered_watch/ /usr/local/bin/buffered_watch/
chmod +x /usr/local/bin/buffered_watch/*.sh
cp -r ./com.heysweet.buffered-watch.plist /Library/LaunchDaemons/com.heysweet.buffered-watch.plist

echo "Loading daemon..."
launchctl load -w /Library/LaunchDaemons/com.heysweet.buffered-watch.plist

echo "Buffered Watch install complete!"
