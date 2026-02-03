#!/bin/sh
gpu-screen-recorder \
        -w screen \
        -f 60 \
        -o "$HOME/Videos/recording_$(date +%F_%H-%M-%S).mp4" &
