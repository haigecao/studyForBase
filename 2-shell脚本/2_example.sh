#!/bin/bash

# 打印当前sh文件名
echo $0   #./2_example.sh


#  $# 可以获取参数的个数
echo $#

# $* 所有的参数
echo $*

a=0
for pro in $*;
  do
    a=$(($a + $pro))
  done

echo "总和是：$a"



# 打印 0，因为上一条语句执行成功
echo $?

if [[ $? == 0 ]]; then
  echo "上一条命令成功"
else
  echo "上一条命令失败"
fi


echo "当前执行的脚本名称：$0"



# 计算
echo `expr 4 + 2`   #6
echo `expr 4 \* 2`  #8
echo `expr 4 % 2`   #0

echo $((2*4))       #8
echo $((2+4))       #6
echo $((2-4))       #-2
echo $((2/4))       #0
echo $((2%4))       #2
