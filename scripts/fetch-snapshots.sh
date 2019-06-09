#!/bin/sh
#fetch-snapshots.sh

dawn_news='http://199.167.151.237:1935/live/sp15_23.stream/gmswf.m3u8'
nine_two_news='http://92news.vdn.dstreamone.net/92newshd/92hd/playlist.m3u8'
ary_news='http://158.69.228.195:1935/newsmobile/myStream/playlist.m3u8'
lahore_news='http://mlive.lahorenews.tv:1935/lahorelive/lnews_1/playlist.m3u8'

ffmpeg -i $dawn_news -vf fps=1/420 snaps/%09d.jpg
