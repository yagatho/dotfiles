#!/usr/bin/env bash


LOCK_FILE="/tmp/wallpaper_change.lock"

# CHECK IF LOCK FILE EXISTS
if [[ -f "$LOCK_FILE" ]]; then
    echo "Zmiana tapety już trwa, anulowano."
    exit 1
fi


touch "$LOCK_FILE"


NEW_WALLPAPER=$(find "$HOME/Wallpaper" -type f | shuf -n 1)
OLD_WALLPAPER=$(find "$HOME/Wallpaper/Current" -type f | head -n 1)


#COPY THE NEW WALLPAPER TO THE CURRENT
mv "$NEW_WALLPAPER" "$HOME/Wallpaper/Current"

#CHECK IF CURRENT FOLDER IS EMPTY
if [[ -n "$OLD_WALLPAPER" ]]; then
    mv "$OLD_WALLPAPER" "$HOME/Wallpaper"
else
    echo "Brak tapety w katalogu Current."
fi

#GET PATH AND CHANGE TO NEW WALLPAPER
WALLPAPER_PATH="$(find "$HOME/Wallpaper/Current" -type f | head -n 1)"
echo "New wallpaper = $WALLPAPER_PATH"
swww img "$WALLPAPER_PATH" --transition-type=outer

#REMOVE LOCK FILE
rm -f "$LOCK_FILE"

#GENERETE NEW COLOR SCHEME
hellwal -i "$WALLPAPER_PATH"
wal -i "$WALLPAPER_PATH"

cp "/home/yagatho/.cache/hellwal/colors.json" "/home/yagatho/.cache/wal"

#CHANGE DISCORD THEME
themecord
pywalfox update

#RELOAD WAYBAR
~/DotFiles/ShellScripts/waybarLaunch.sh