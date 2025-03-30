#!/usr/bin/env bash
var=$(hyprctl clients | grep 'class: btop') 

#Check if alpaca is open
if [[ $var ]] ; then
    #Get workspace index
    workspace=$(hyprctl clients -j | jq '.[] | select(.class=="btop") | .workspace | .id')
    active_workspace=$(hyprctl monitors -j | jq '.[] | select(.id==0) | .activeWorkspace | .id')

    #Check if is in special workspace
    if [[ $workspace -eq $active_workspace ]] ; then
        hyprctl dispatch movetoworkspacesilent "special,class:btop"

    else
        hyprctl dispatch movetoworkspacesilent "$active_workspace,class:btop"
    fi

    sleep 0.5


else
    kitty -c ~/DotFiles/Kitty/kitty.conf --class "btop" btop &
fi
