#!/bin/sh
#fetch-snapshots.sh

ary_news='http://158.69.228.195:1935/newsmobile/myStream/playlist.m3u8'

ffmpeg -i $ary_news -vf fps=1/420 snaps/ary/%09d.jpg
