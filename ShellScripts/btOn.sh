#!/usr/bin/env bash

if systemctl is-active --quiet bluetooth.service; then
    sudo /bin/systemctl stop bluetooth.service
else
    sudo /bin/systemctl start bluetooth.service
fi