#!/usr/bin/env bash

# By Matthew MacGregor

DIR="$( dirname -- "${BASH_SOURCE[0]}"; )";   # Get the directory name
DIR="$( realpath -e -- "$DIR"; )";    # Resolve its full path if need be

if [ ! -d ~/.config/sway ]
then
    mkdir ~/.config/sway
fi

cp -r "$DIR"/* ~/.config/
