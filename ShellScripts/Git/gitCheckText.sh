#!/usr/bin/env bash

#Find all git repos
FOLDERS=($(find ~/Git -maxdepth 1 -type d))

#Search through all the folders
for DIR in "${FOLDERS[@]}"; do

    #Check if folder is git repo
    if [ ! -d "$DIR/.git" ]; then
        continue
    fi

    NAME=$DIR
    cd $DIR
    git remote update

    STATUS=$(git status -uno)
    TOTAL=0

    # OUT
    if [[ $STATUS == *"behind"* ]]; then
        VALUE=${STATUS#*"by"}
        VALUE=${VALUE%"commit,"*}
        TOTAL=$((TOTAL+1))

        echo "Behind on $NAME! $((VALUE)) commit behind"
    else
        echo "Up to date on $NAME!"
    fi
done

echo "Total behind: $TOTAL"
