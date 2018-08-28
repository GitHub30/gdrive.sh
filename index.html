#!/usr/bin/env bash

id=$1

if [ ! "$id" ]
then
    echo 'Usage: curl gdrive.sh | bash -s 0B4y35FiV1wh7QWpuVlFROXlBTHc';
    echo ' or';
    echo "alias gdrive-dl='curl gdrive.sh | bash -s'";
    echo 'gdrive-dl 0B4y35FiV1wh7QWpuVlFROXlBTHc';
    exit 1
fi



url="https://drive.google.com/uc?export=download&id=$id"

curl -OJLc /tmp/cookie "$url"

confirm="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
if [ "$confirm" ]
then
    curl -OJLb /tmp/cookie "$url&confirm=$confirm"
    rm $(basename "$url")
fi
