#!/usr/bin/env bash

NAME="DailyMisc"

cd ~/Git/$NAME
git remote update

STATUS=$(git status -uno)
TOTAL=0

if [[ $STATUS == *"behind"* ]]; then
    VALUE=${STATUS#*"by"}
    VALUE=${VALUE%"commit,"*}
    TOTAL=$((TOTAL+1))

    echo "Behind on $NAME! $((VALUE)) commit behind"
else
    echo "Up to date on $NAME!"
fi


echo "Total behind: $TOTAL"
