#!/bin/sh
pkill -f wf-recorder
pactl unload-module module-combine-sink
