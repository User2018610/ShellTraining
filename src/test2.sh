#!/usr/bin/env bash
#cd ../

echo "hello world"

func()
{
    num=123
    echo $num
}

echo $num

func2()
{
    local num=456
    echo $num
}
func
func2
echo "spf13-vim并不是很好用, oh my zsh 也一样"
