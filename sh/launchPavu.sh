#!/usr/bin/env bash
var=$(hyprctl clients | grep 'class: org.pulseaudio.pavu') 



#Check if pavu is open
if [[ $var ]] ; then
    #Get workspace index
    workspace=$(hyprctl clients -j | jq '.[] | select(.class=="org.pulseaudio.pavucontrol") | .workspace | .id')
    active_workspace=$(hyprctl monitors -j | jq '.[] | select(.id==0) | .activeWorkspace | .id')

    #Check if is in special workspace
    if [[ $workspace -eq $active_workspace ]] ; then
        hyprctl dispatch movetoworkspacesilent "special,class:org.pulseaudio.pavucontrol"

    else
        hyprctl dispatch movetoworkspacesilent "$active_workspace,class:org.pulseaudio.pavucontrol"
    fi

    sleep 0.5


else
    pavucontrol & 
fi
