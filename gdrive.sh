#!/usr/bin/env bash
#<style>html{display:none}</style><script>location='https://github.com/GitHub30/gdrive.sh'</script>

id=$1
if [ ! "$id" ]
then
    cat << EOS
Usage:
  curl gdrive.sh | bash -s 0B4y35FiV1wh7QWpuVlFROXlBTHc
  curl gdrive.sh | sh -s https://drive.google.com/open?id=0B7EVK8r0v71pZjFTYXZWM3FlRnM
  curl gdrive.sh | bash -s https://drive.google.com/open?id=0B4y35FiV1wh7QWpuVlFROXlBTHc
  curl gdrive.sh | bash -s https://drive.google.com/file/d/0B4y35FiV1wh7QWpuVlFROXlBTHc/view?usp=sharing
  curl gdrive.sh | bash -s https://drive.google.com/file/d/0B4y35FiV1wh7QWpuVlFROXlBTHc/view
  curl gdrive.sh | bash -s https://docs.google.com/file/d/0BwmPMFurnk9Pak5zWEVyOUZESms/edit

  alias gdrive.sh='curl gdrive.sh | bash -s'
  gdrive.sh 0B4y35FiV1wh7QWpuVlFROXlBTHc
EOS
    exit 1
fi

case "$id" in
    'https://drive.google.com/open?id='*) id=$(echo "$id" | awk -F'=|&' '{printf"%s",$2}');;
    'https://drive.google.com/file/d/'*|'https://docs.google.com/file/d/'*) id=$(echo "$id" | awk -F'/' '{printf"%s",$6}');;
esac



url="https://drive.google.com/uc?export=download&id=$id"
curl -OJLc /tmp/cookie "$url"

filename=$(basename "$url")
test -f "$filename" && rm "$filename"

confirm="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
if [ "$confirm" ]
then
    curl -OJLb /tmp/cookie "$url&confirm=$confirm"
fi
