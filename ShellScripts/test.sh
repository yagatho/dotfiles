#!/bin/bash
killall dunst
dunst &
notify-send -u low "Reminder" "Don't forget to take a break!"
notify-send -u critical "Reminder" "Don't forget to take a break!"
notify-send -u normal "Reminder" "Don't forget to take a break!"
notify-send -h int:value:42 "Working ..."
