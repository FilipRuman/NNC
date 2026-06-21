ffmpeg \
-i /etc/nixos/NNC/utils/manim/notes/media/videos/main/2160p60/DefaultTemplate.mov \
-i /etc/nixos/NNC/utils/manim/notes/woosh.wav \
-i /etc/nixos/NNC/utils/manim/notes/click.wav \
-filter_complex "
[1:a]adelay=0|0[a1];
[2:a]adelay=2200|2200[a2];
[a1][a2]amix=inputs=2[aout]
" \
-map 0:v \
-map "[aout]" \
-c:v copy \
-c:a pcm_s16le \
-ar 48000 \
-y \
output.mov
