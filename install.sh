#!/usr/bin/env sh
echo "Warning! This will overwrite all existing functions in ~/.config/fish/functions."
echo -n "Continue? [y/N] "
read answer
if [ "$answer" ] && ([ "$answer" = "y" ] || [ "$answer" = "Y" ]); then
    cp ./functions/* ~/.config/fish/functions/
    echo "Functions installed."
else
    echo "Aborting."
fi
