#!/bin/bash
#author: MrLiu
#version: v1.0
#date: 2023-12-11

#时间
timebuf=`date +%Y%m%d`
filepath="/data/"
#echo "${timebuf}"

for file in `find ${filepath} -type f -name "*.txt"`
do
	echo "备份文件:${file}"
	cp ${file} "${file}_${timebuf}"
done
