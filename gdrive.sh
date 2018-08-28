#!/usr/bin/env bash
#<script>location='https://github.com/GitHub30/gdrive.sh'</script>

id=$1
if [ ! "$id" ]
then
    cat << EOS
Usage:
  curl gdrive.sh | bash -s 0B4y35FiV1wh7QWpuVlFROXlBTHc
  curl gdrive.sh | bash -s https://drive.google.com/open?id=0B4y35FiV1wh7QWpuVlFROXlBTHc
  curl gdrive.sh | bash -s https://drive.google.com/file/d/0B4y35FiV1wh7QWpuVlFROXlBTHc/view?usp=sharing
  curl gdrive.sh | bash -s https://drive.google.com/file/d/0B4y35FiV1wh7QWpuVlFROXlBTHc/view

  alias gdrive.sh='curl gdrive.sh | bash -s'
  gdrive.sh 0B4y35FiV1wh7QWpuVlFROXlBTHc

  curl -O gdrive.sh
  chmod +x gdrive.sh
  ./gdrive.sh 0B4y35FiV1wh7QWpuVlFROXlBTHc
EOS
    exit 1
fi

case "$id" in
    'https://drive.google.com/open?id='*) id=${id:33};;
    'https://drive.google.com/file/d/'*) id=$(echo $id | awk -F'/' '{printf"%s",$6}');;
esac



url="https://drive.google.com/uc?export=download&id=$id"
curl -OJLc /tmp/cookie "$url"

confirm="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
if [ "$confirm" ]
then
    curl -OJLb /tmp/cookie "$url&confirm=$confirm"
    rm $(basename "$url")
fi
