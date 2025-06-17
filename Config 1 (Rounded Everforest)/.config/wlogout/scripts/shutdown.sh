#!/bin/bash

killall steam 

while pgrep steam > /dev/null;
do
    sleep 1
done

shutdown -h now

exit 0
