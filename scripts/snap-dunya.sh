#!/bin/sh
#fetch-snapshots.sh

dunya_news='https://cdn5.mjunoon.tv:8087/web/DunyaNews-113/playlist.m3u8'

#ffmpeg -user-agent "Mozilla/5.0 (compatible; Companybot/1.0; +http://www.Thecompany.com)" -i $dunya_news -vf fps=1/420 dunya-%02d.jpg 

avconv -user-agent "Mozilla/5.0" -i $dunya_news -vsync 2 -r 1/2 -frames:v 3 dunya-%02d.jpg