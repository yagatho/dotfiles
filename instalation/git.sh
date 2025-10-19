#!/bin/bash
mail=""
name=""
read -p "Enter git email: " mail
read -p "Enter git username: " name

git config --global user.name $name
git config --global user.email $mail

gh auth login
