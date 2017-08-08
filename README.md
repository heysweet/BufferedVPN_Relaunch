# BufferedVPN_Relaunch

The [Buffered App](https://buffered.com/) for Mac is an effective VPN. However, upon closing your laptop, the connection is killed and the application does not attempt to reconnect. It does, however, attempt to reconnect upon launch. This bash script sets up a daemon that will safely kill the application when your laptop goes to sleep and launches the application when your laptop wakes up.

Developed/tested for Buffered 1.036 / MacOS Sierra 10.12.5.

## Installation

This script will only work on a Mac.

To install, simply run `./setup.sh`.
