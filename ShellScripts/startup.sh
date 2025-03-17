#!/usr/bin/env bash
~/DotFiles/ShellScripts/Wallpaper/swww.sh init

#APPS
discord &
lutris &
sleep 1

#ALL KITTIES
~/DotFiles/ShellScripts/launchFetch.sh init
~/DotFiles/ShellScripts/launchKittyGlances.sh init

#WALLPAPER AND WAYBAR
~/DotFiles/ShellScripts/waybarLaunch.sh init
