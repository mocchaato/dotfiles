#!/bin/bash

killall steam

while pgrep steam > /dev/null;
do
    sleep 1
done

hyprctl dispatch exit

exit 0
