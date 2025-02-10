#!/usr/bin/env bash

#Find all git repos
FOLDERS=($(find ~/Git -maxdepth 1 -type d))

#Search through all the folders
TOTAL=0
TOTAL_UP=0
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
        VALUE=${STATUS#*"by"}
        VALUE=${VALUE%"commit,"*}
        TOTAL=$((TOTAL+1))
    fi

    MODIFIED=$(git status --porcelain)

    # OUT MODIFIED
    if [[ -n $MODIFIED ]]; then
        ((TOTAL_UP++))
    fi
done

echo "<span color='#FC427B'>$TOTAL </span> <span color='#55E6C1'>$TOTAL_UP </span>"
