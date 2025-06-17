#!/bin/bash

killall steam

while pgrep steam > /dev/null;
do
    sleep 1
done

systemctl reboot

exit 0
