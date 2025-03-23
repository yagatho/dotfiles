#!/usr/bin/env bash
var=$(hyprctl clients | grep 'class: com.github.th_ch.youtube') 



#Check if youtube music is open
if [[ $var ]] ; then
    #Get workspace index
    workspace=$(hyprctl clients -j | jq '.[] | select(.class=="com.github.th_ch.youtube_music") | .workspace | .id')
    active_workspace=$(hyprctl monitors -j | jq '.[] | select(.id==0) | .activeWorkspace | .id')

    #Check if is in special workspace
    if [[ $workspace -eq $active_workspace ]] ; then
        hyprctl dispatch movetoworkspacesilent "special,class:com.github.th_ch.youtube_music"

    else
        hyprctl dispatch movetoworkspacesilent "$active_workspace,class:com.github.th_ch.youtube_music"
    fi

    sleep 0.5


else
   youtube-music & 
fi
