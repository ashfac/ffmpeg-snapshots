#!/bin/sh
#fetch-snapshots.sh

dawn_news='http://199.167.151.237:1935/live/sp15_23.stream/gmswf.m3u8'

ffmpeg -i $dawn_news -vf fps=1/420 snaps/dawn/%09d.jpg
