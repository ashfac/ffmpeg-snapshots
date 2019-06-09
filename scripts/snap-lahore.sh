#!/bin/sh
#fetch-snapshots.sh

lahore_news='http://mlive.lahorenews.tv:1935/lahorelive/lnews_1/playlist.m3u8'

ffmpeg -i $lahore_news -vf fps=1/420 snaps/lahore/%09d.jpg
