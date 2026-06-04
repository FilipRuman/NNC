#!/bin/sh
wf-recorder -a \
  --codec=prores_ks \
  -r 30 \
  -f "$HOME/Videos/recording_$(date +%F_%H-%M-%S).mov"
