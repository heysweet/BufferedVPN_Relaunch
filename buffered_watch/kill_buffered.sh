#!/bin/sh
ps aux | grep 'Applications/Buffered.app/Contents/MacOS/client[[:cntrl:]]*$' | awk '{print $2}' | xargs kill -9
ps aux | grep /Applications/Buffered.app/Contents/MacOS/cacher | awk '{print $2}' | xargs kill -9