#!/bin/sh
#fetch-snapshots.sh

hum_news=`youtube-dl -f301 --get-url https://www.youtube.com/watch?v=GMNJAruCO5I`
dawn_news='http://199.167.151.237:1935/live/sp15_23.stream/gmswf.m3u8'
nine_two_news='http://92news.vdn.dstreamone.net/92newshd/92hd/playlist.m3u8'
ary_news='http://158.69.228.195:1935/newsmobile/myStream/playlist.m3u8'
dunya_news='http://127.0.0.1:6543/streamlink?streamlink=mjunoon.tv/dunya-news-live'
aaj_news='http://127.0.0.1:6543/streamlink?streamlink=mjunoon.tv/aaj-news-live'
lahore_news='http://mlive.lahorenews.tv:1935/lahorelive/lnews_1/playlist.m3u8'

ffmpeg -i $hum_news -vf fps=1/5 snaps/hum/%09d.jpg
ffmpeg -i $dawn_news -vf fps=1/5 snaps/dawn/%09d.jpg
ffmpeg -i $nine_two_news -vf fps=1/5 snaps/ninetwo/%09d.jpg
ffmpeg -i $ary_news -vf fps=1/5 snaps/ary/%09d.jpg
ffmpeg -i $dunya_news -vf fps=1/5 snaps/dunya/%09d.jpg
ffmpeg -i $aaj_news -vf fps=1/5 snaps/aaj/%09d.jpg
ffmpeg -i $lahore_news -vf fps=1/5 snaps/lahore/%09d.jpg
