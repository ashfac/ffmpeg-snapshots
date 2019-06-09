#!/bin/sh
#fetch-snapshots.sh

nine_two_news='http://92news.vdn.dstreamone.net/92newshd/92hd/playlist.m3u8'

ffmpeg -i $nine_two_news -vf fps=1/420 snaps/ninetwo/%09d.jpg
