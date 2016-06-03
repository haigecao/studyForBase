#!/bin/bash

# 打印计算机中的用户
for i in `ls /Users`
do
  echo $i
done

# 将目录的信息，写入log
# ls -lhR /../ >> ./test.log

# 定义一个变量
name='user1'
echo "this is a ${name}hg"
echo 'this is a boy $name'
echo "$name \\n $name \\n"
# echo `ls -al`   # 反引号，使用来解析命令，并返还执行结果。

str=`echo 123`  # str=123
echo $str

# 将输入的字符串，赋值给name
# read -p 'please input name:' name
# echo "this is a ${name}"

date=`date`  #将事时间赋值给date
echo "today is $date !!!"

# 打印输入脚本时，添加的参数。
echo '打印一个参数：'$1

case $1 in
  start )
    echo "start"
    ;;

  end )
    echo "end"
    ;;

esac

# 计算第一个参数和第二个参数的和

echo $(($1 + $2))
