#!/bin/bash
source config.sh

FILE_NAME="$(get_artist_name) - $(get_song_name).mp4"

yt-dlp "$(get_video_url)" \
  --rm-cache-dir \
  --merge-output-format mp4 \
  --remux-video mp4 \
  -S vcodec:h264,lang,quality,res,fps,hdr:12,acodec:aac \
  -o "/videos/${FILE_NAME}"

reset_data