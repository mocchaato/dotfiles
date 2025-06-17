#!/bin/bash

killall steam

while pgrep steam > /dev/null;
do
    sleep 1
done

# qdbus org.kde.Shutdown /Shutdown  org.kde.Shutdown.logout
hyprctl dispatch exit

exit 0
