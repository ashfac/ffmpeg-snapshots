#!/bin/sh
#fetch-snapshots.sh

url='https://cdn4.mjunoon.tv:8087/web/AAJNews-124/playlist.m3u8'

#ffmpeg -i $aaj_news -vf fps=1/420 snaps/aaj/%09d.jpg


#ffmpeg -i $url -vf fps=1/60 -vframes 3 -q:v 2 snaps/aaj/%09d.jpg

#avconv -i $url -r 1 -f image2 image-%03d.png

avconv -i $url -vsync 1 -r 1/10 -frames:v 3 snaps/aaj/img-%03d.jpg
