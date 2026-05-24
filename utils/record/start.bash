#!/bin/sh
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export PULSE_SERVER="unix:${XDG_RUNTIME_DIR}/pulse/native"
export PATH="$PATH:/usr/bin:/bin"

pactl load-module module-combine-sink sink_name=combined slaves=alsa_output.pci-0000_15_00.6.analog-stereo
pactl load-module module-loopback source=alsa_input.usb-MV-SILICON_fifine_Microphone_20190808-00.mono-fallback sink=combined
sleep 1
wf-recorder --audio=combined.monitor -f "$HOME/Videos/recording_$(date +%F_%H-%M-%S).mp4"
