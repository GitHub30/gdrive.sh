#!/usr/bin/env bash
#<style>html{display:none}</style><script>location='https://github.com/GitHub30/gdrive.sh'</script>

id=$1
if [ ! "$id" ]; then
    cat <<EOS
Usage:
  curl gdrive.sh | bash -s string

  You can also setup an alias:
  	alias gdrive.sh='curl gdrive.sh | bash -s'
	gdrive.sh string

  Where "string" can be file/folder url or file/folder id.
  For information on supported url types, visit https://gdrive.sh.
EOS
    exit 1
fi

case "$id" in
    'http'*'://'*'drive.google.com'*'id='*) id=$(echo "$id" | sed 's/^.*id=//' | sed 's|&|\n|' | head -1) ;;
    'http'*'drive.google.com/file/d/'* | 'http'*'docs.google.com/file/d/'*) id=$(echo "$id" | sed 's/^.*\/d\///' | sed 's/\/.*//') ;;
    'http'*'drive.google.com'*'drive'*'folders'*) id=$(echo "$id" |  sed 's/^.*\/folders\///' | sed "s/&.*//" | sed -r 's/(.*)\/.*/\1 /') ;;
esac

# Check if the file id exists and determine it's type [ folder | small files | big files ], otherwise exit the script.
checkurl="https://drive.google.com/open?id=$id"
foldersurl="https://drive.google.com/drive/folders/$id"
fileurl="https://drive.google.com/uc?export=download&id=$id"

if ! curl -Is "$checkurl" | head -n 1 | grep 404 >/dev/null  2>&1; then
    if curl -Is "$foldersurl" | head -n 1 | grep 200 >/dev/null 2>&1; then
         folderurl="$foldersurl"
    elif ! curl -Is "$fileurl" | grep location >/dev/null 2>&1; then
         bigfileurl="$fileurl"
    elif curl -Is "$fileurl" | grep location >/dev/null 2>&1; then
         smallfileurl="$fileurl"
    fi
else
    echo "Given url/id either doesn't exist or not accessible."
    exit
fi

# Type: Folder
if [ -n "$folderurl" ] >/dev/null  2>&1; then
    json="$(curl -s https://takeout-pa.clients6.google.com/v1/exports?key=AIzaSyC1qbk75NzWBvSaDh6KnsjjA9pIrP4lYIE -H 'origin: https://drive.google.com' -H 'content-type: application/json' -d '{"archiveFormat":null,"archivePrefix":null,"conversions":null,"items":[{"id":"'"$id"'"}],"locale":null}')"
    echo "$json" | grep -A100000 exportJob | grep -e percentDone -e status | sed 's|  "status":|Zip Status:|' | sed 's|,||'

    export_job_id=$(echo "$json" | grep -A100000 exportJob | awk -F'"' '$0~/^    "id"/{print$4}')
    storage_paths=''
    until [ "$storage_paths" ]; do
        json="$(curl -s "https://takeout-pa.clients6.google.com/v1/exports/${export_job_id}?key=AIzaSyC1qbk75NzWBvSaDh6KnsjjA9pIrP4lYIE" -H 'origin: https://drive.google.com')"
        for i in $(echo "$json" | grep -B2 -A100000 exportJob | grep -e percentDone); do
            for j in $(printf %s "$i" | sed 's/[^0-9]*//g'); do
                printf "  Progress: $j%%\r"
            done
        done
        storage_paths="$(echo "$json" | grep -A100000 exportJob | awk -F'"' '$0~/^        "storagePath"/{print$4}')"
    done
    echo "  Progress:$(echo "$json" | grep -B2 -A100000 exportJob | grep -e percentDone | sed 's|"percentDone": ||' | sed 's|,|%|' | sed 's| ||')"
    echo "$json" | grep -A100000 exportJob | grep -e status | sed -e 's|  "status":|Zip Status:|' | sed 's|,||'
	printf '\n'

    for storage_path in $storage_paths; do
        curl -OJ "$storage_path" | sed -e "/filename/d"
    done
    printf '\nDownload Complete\n\n'

    filenames="$(echo "$json" | grep -A100000 exportJob | awk -F'"' '$0~/^        "fileName"/{print$4}')"
    echo "Extracting contents from zip"
    for filename in ${filenames}; do
        unzip -o "$filename" | sed -e '/Archive/d' | sed -e 's| inflating: | Extracted: |g'
    done
    rm "$filenames"
    exit
# Type: Small Files ( Files which do not produces "cannot scan big files" warning, so can be downloaded directly. )
elif [ -n "$smallfileurl" ] >/dev/null  2>&1; then
    curl -JLO "$smallfileurl" | tee "$id" | sed -e "/curl/d"
    if [ -z "$(cat "$id")" ] >/dev/null 2>&1; then
        printf "\nThe file is already present, delete the existing file to download again.\n"
    else
        printf  '\n'
        grep <"$id" Saved | sed "s/^.*curl: Saved to filename/Downloaded:/"
    fi
    rm "$id"
    exit
# Type: Big Files ( Files which produces "cannot scan big files" warning, so we need to setup cookies to download it properly.)
elif [ -n "$bigfileurl" ] >/dev/null  2>&1; then
    curl -OJsLc "$id"cookie "$bigfileurl"
    if awk '/_warning_/ {print $NF}' "$id"cookie >/dev/null 2>&1; then
        curl -OJLb "$id"cookie "$bigfileurl&confirm=$(awk '/_warning_/ {print $NF}' "$id"cookie)"  | tee  "$id" | sed -e "/curl/d"
        if [ -z "$(cat "$id")" ] >/dev/null 2>&1; then
            printf "\nThe file is already present, delete the existing file to download again.\n"
        else
            printf '\n'
            grep <"$id" Saved | sed "s/^.*curl: Saved to filename/Downloaded:/"
        fi
        rm "$id"
    fi
    rm "$id"cookie
    rm ./*uc*"$id"*
    exit
fi
