#!/bin/bash
#author: MrLiu
#version: v1.0
#date: 2023-12-12
#判断userinfo.txt是否存在
if [ -f /data/userinfo.txt ]
then
	rm -rf /data/userinfo.txt
fi

#判断mkpasswd命令是否存在
if ! which mkpasswd
then
	yum install -y expect
fi
#使用seq生成后缀队列
for i in `seq -w 0 09`
do
	#每次执行mkpasswd赋值给临时
	tmp=`mkpasswd -l 15 -s 0`
	useradd user_${i} && echo "${tmp}" | passwd --stdin user_${i}
	echo "user_${i} ${tmp}" >> /data/userinfo.txt
done
