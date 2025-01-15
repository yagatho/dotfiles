#!/usr/bin/env bash

#APPS
code &
wait $!

vesktop &
sleep 1

firefox &
sleep 1

#ALL KITTIES
~/DotFiles/ShellScripts/launchFetch.sh init
~/DotFiles/ShellScripts/launchKittyGlances.sh init

#WALLPAPER AND WAYBAR
~/DotFiles/ShellScripts/waybarLaunch.sh init
~/DotFiles/ShellScripts/Wallpaper/swww.sh init