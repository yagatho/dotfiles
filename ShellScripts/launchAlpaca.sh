#!/usr/bin/env bash
var=$(hyprctl clients | grep 'class: com.jeffser.Al') 



#Check if alpaca is open
if [[ $var ]] ; then
    #Get workspace index
    workspace=$(hyprctl clients -j | jq '.[] | select(.class=="com.jeffser.Alpaca") | .workspace | .id')
    active_workspace=$(hyprctl monitors -j | jq '.[] | select(.id==0) | .activeWorkspace | .id')

    #Check if is in special workspace
    if [[ $workspace -eq $active_workspace ]] ; then
        hyprctl dispatch movetoworkspacesilent "special,class:com.jeffser.Alpaca"

    else
        hyprctl dispatch movetoworkspacesilent "$active_workspace,class:com.jeffser.Alpaca"

        hyprctl dispatch focuswindow "class:com.jeffser.Alpaca"
    fi

    sleep 0.5


else
    alpaca & 
fi
