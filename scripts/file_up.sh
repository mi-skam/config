#!/bin/sh

## TODO: needs to be reworked for WSL!

FILE="$1"

if [ -z "$1" ]
then
        echo "usage: [file]"
        exit 1
fi
                
                
MD5=$(md5 -b "$1" | awk '{ print $NF }' | tr -d '/+=' )
NAME=${MD5}.${FILE##*.}

scp -P 22022 $FILE maksim@pub.miskam.xyz:/webroot/pub.miskam.xyz/i/${NAME}

URL="https://pub.miskam.xyz/f/${NAME}"
echo -n "$URL" | xclip -selection clipboard

notify-send -u low "$URL"