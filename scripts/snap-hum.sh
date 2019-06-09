#!/bin/sh
#fetch-snapshots.sh

hum_news=`youtube-dl -f301 --get-url https://www.youtube.com/watch?v=GMNJAruCO5I`

ffmpeg -i $hum_news -vf fps=1/420 snaps/hum/%09d.jpg
