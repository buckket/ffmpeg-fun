#!/bin/sh

# Takes 9 files with same width and hight and combines them to one
# big 3x3 grid showing all videos simultaneously. It also mixes
# all sound tracks togehter. In the end the video is resized.

# Example: https://www.youtube.com/watch?v=q7q9WTstdXo

ffmpeg -i 0.mp4  -i 1.mp4 -i 2.mp4 -i 3.mp4 -i 4.mp4 -i 5.mp4 -i 6.mp4 -i 7.mp4 -i 8.mp4 \
    -filter_complex "[0:v][1:v][2:v]hstack=3[r1]; \
                     [3:v][4:v][5:v]hstack=3[r2]; \
                     [6:v][7:v][8:v]hstack=3[r3]; \
                     [r1][r2][r3]vstack=3[vb]; \
                     [vb]scale=1900:1080[v]" \
    -map "[v]" \
    -filter_complex "amix=inputs=9" \
    output.mp4

