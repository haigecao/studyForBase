#!/bin/bash

# 写一个shell脚本：建立2层目录，生成多个js文件，
# 使用ant命令执行build.xml，
# 使用压缩工具将多个js文件压缩合并成一个。


# 创建了3个文件，名字为test_[1.2.3].js
mk_file()
{
  num=1
  while [ $num -ne 4 ]
  do
    touch test_$num".js"
    num=`expr $num + 1`
  done
}

# 创建文件目录
mkdir "App"
cd "App"


# 定义了一个数组，循环创建数组内的元素
dirname="lib page"
for d in $dirname
  do
    mkdir $d
    cd $d
    mk_file
    cd ..
  done
