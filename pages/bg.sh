source config.sh

# helper function to map each
# line of input to an SSE event
event_stream() {
  local line
  while IFS= read -r line; do
    event "$1" "$line"'<br/>'
  done
}

# helper function to write form data to data folder
write_data() {
  echo ${FORM_DATA["video_url"]} > $VIDEO_URL
  echo ${FORM_DATA["artist_name"]} > $ARTIST_NAME
  echo ${FORM_DATA["song_name"]} > $SONG_NAME
}


# start a long running task in the background,
# and pipe its output to the SSE topic+ 'stuff'
#
# important things to note:
# 1. we close stdin at the start with '0>&-'
# 2. we close stdout and stderr at the end of the pipe



write_data

0>&- echo $(get_artist_name) | event_stream update | publish stuff  1>&- 2>&- &
0>&- ./task.sh \
  | event_stream update \
  | publish stuff  1>&- 2>&- &

# this happens immediately; we don't need to wait
# for the above task to finish to get this response.
echo 'Job started!'