#!/usr/bin/env bash
echo "Warning! This will overwrite all existing functions in ~/.config/fish/functions."
read -p "Continue? [y/N] " answer
if [ "$answer" ] && ([ "$answer" = "y" ] || [ "$answer" = "Y" ]); then
    cp ./functions/* ~/.config/fish/functions/
    echo "Functions installed."
else
    echo "Aborting."
fi
