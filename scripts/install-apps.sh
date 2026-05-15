#!/bin/bash
APP=$1
if [ -z "$APP" ]; then
    echo "Usage: install-apps.sh <appname>"
    exit 1
fi
echo "Installing $APP..."
apt-get update && apt-get install -y $APP
echo $APP >> /config/saved-apps.txt
echo "$APP installed and saved for next startup!"