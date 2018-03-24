#! /bin/bash

function play {
    local var=33
    num=$var
    echo "build your dream"
}

dir=$(basename $(pwd))

echo current dir===$dir
play
echo "var=$var , num=$num"
