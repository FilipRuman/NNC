#!/usr/bin/env sh

file=$(zenity --file-selection \
              --save \
              --confirm-overwrite \
              --filename="$HOME/kden/Screenshot-$(date +%F-%H%M%S).png")

[ -n "$file" ] && grimblast save area "$file"
