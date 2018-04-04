#! /bin/bash

# grep "file_name" MT6757_Android_scatter.txt | awk '{print $2}' | grep -v "NONE" | uniq

path_list=$(grep "file_name" MT6757_Android_scatter.txt | awk '{print $2}' | grep -v "NONE")

#echo $path_list

head=$(pwd)
for line in $path_list
do
    echo "$head/$line"
done
