#!/usr/bin/env bash

#Find all git repos
FOLDERS=($(find ~/Git -maxdepth 1 -type d))

#Search through all the folders
TOTAL=0
TOTAL_UP=0
TOOLTIP=""
for DIR in "${FOLDERS[@]}"; do

    #Check if folder is git repo
    if [ ! -d "$DIR/.git" ]; then
        continue
    fi

    #Check if folder is syncable
    if [ ! -d "$DIR/.git" ]; then
        continue
    fi

    NAME=$DIR
    cd $DIR
    git remote update> /dev/null 2>&1

    STATUS=$(git status -uno)

    # OUT
    if [[ $STATUS == *"behind"* ]]; then
        TOTAL=$((TOTAL+1))

        # Format the name
        NAME=${NAME#*"Git/"}
        TOOLTIP="$TOOLTIP Behind on $NAME \n"
    fi

    MODIFIED=$(git status --porcelain)

    # OUT MODIFIED
    if [[ -n $MODIFIED ]]; then
        # Counter up
        ((TOTAL_UP++))

        # Format the name
        NAME=${NAME#*"Git/"}
        TOOLTIP="$TOOLTIP Uncommited update on $NAME \n"
    fi
done

echo "{\"text\": \"<span color='#FC427B'>$TOTAL </span>  <span color='#55E6C1'>$TOTAL_UP </span>\", \"tooltip\": \"$TOOLTIP\"}"
