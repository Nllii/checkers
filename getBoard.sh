#!/bin/bash

# set the folder name and file name
folderName="training"
fileName="$folderName/screenshot.png"

# activate Safari
osascript -e 'tell application "Safari" to activate'

# wait for Safari to become the active application
while [[ $(osascript -e 'application "Safari" is frontmost') = "false" ]]; do
    sleep 0.1
done

# find the "cake" tab or window
tabId=$(osascript -e 'tell application "Safari" to if (exists (tab 1 of window 1 whose name contains "cake")) then return id of tab 1 of window 1 whose name contains "cake"')

# if "cake" tab or window is found, take a screenshot
if [[ -n "$tabId" ]]; then
    screencapture -R $(osascript -e "tell application \"Safari\" to get bounds of tab id $tabId") "$fileName"
fi
