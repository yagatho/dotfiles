#!/usr/bin/env bash
var=$(hyprctl clients | grep 'class: Caprine') 



#Check if youtube music is open
if [[ $var ]] ; then
    #Get workspace index
    workspace=$(hyprctl clients -j | jq '.[] | select(.class=="Caprine") | .workspace | .id')
    active_workspace=$(hyprctl monitors -j | jq '.[] | select(.id==0) | .activeWorkspace | .id')

    #Check if is in special workspace
    if [[ $workspace -eq $active_workspace ]] ; then
        hyprctl dispatch movetoworkspacesilent "special,class:Caprine"

    else
        hyprctl dispatch movetoworkspacesilent "$active_workspace,class:Caprine"
        hyprctl dispatch focuswindow "Caprine"
    fi

    sleep 0.5


else
   caprine & 
fi
