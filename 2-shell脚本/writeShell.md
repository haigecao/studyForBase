
1)
  首先文件是以sh结尾

2）
  第一行,用bash进行解析并运行
    #!/bin/bash

3)
  注释 #

4)
  执行
    第一种:  $ /bin/bash one.sh
            1111
            2222
            3333

    第二种：chmod 777 one.sh
          ./one.sh

5）
  定义变量：格式 变量名＝变量值
         ［变量开头是字母和下划线，不能以数字开头］

  输出变量：以回车换行，作为分割。
          变量名字之前，加$
          echo "this is a ${name}hg"  使用{}将变量筛选出来，
          例子： name='user1'
                echo "this is a ${name}hg"


  键盘的输入： 将输入赋值给name
          read -p 'please input name:' name


6）单引号，双引号
  单引号：无法解析变量
    echo 'this is a boy $name' ＃原样打印
    但是，echo 'this is a boy‘$name  ＃ 后面连一个变量是可以的。

  双引号：echo "$name \n $name \n" 无法解析转译符，单引号也不行。

  反引号：｀｀ 用来解析命令，并将命令的返回值，进行输入的。
       date=`date`  #将事时间赋值给date
       echo "today is $date"

7) 删除变量
      unset

8) 位置变量: 一共9个参数
    例如： ./hg.sh one two thr
          从$1 --> $9


9) case --> switch

    case word in

      pattern )
        ;;
    esac

10） 计算
    a)  expr
      例子：
        a=10
        b=20
        expr $a + $b  ＃有空格 30
        expr $a+$b    # 10+20

    b)  $((a + b))
      例如：
        a=10
        b=20
        echo $(( a + b ))  // 30



11） 预定变量
    $#    代表多少个参数
    $*    代表所有参数
    $?    上一条命令成功了，就返回0；非0就是异常或者错误。
    $0    当前执行进程的程序名    echo $0   #-zsh


12）
  if 语法
      有空格！！！
      if [[ $? == 0 ]]; then
        echo "上一条命令成功"
      else
        echo "上一条命令失败"
      fi
