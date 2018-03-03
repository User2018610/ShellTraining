#!/usr/bin/env bash

chmod u+rx $0
path=../out/log.log
{
    read line1
    read line2
} 0<$path

echo "line1=$line1"
echo "line2=$line2"

exit 0
