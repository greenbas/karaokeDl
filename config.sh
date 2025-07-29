PROJECT_NAME=karaokeDl

VIDEO_URL=data/video_url
ARTIST_NAME=data/artist_name
SONG_NAME=data/song_name

reset_data() {
    rm $VIDEO_URL
    rm $ARTIST_NAME
    rm $SONG_NAME
}

get_video_url() {
    cat $VIDEO_URL
}

get_artist_name() {
    cat $ARTIST_NAME
}

get_song_name() {
    cat $SONG_NAME
}

