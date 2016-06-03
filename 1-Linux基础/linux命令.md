##

    ls: 展示文件目录

        -a 列出目录下的所有文件，包括以 . 开头的隐含文件.
        -l 列出文件的详细信息.
        -s 在每个文件名后输出该文件的大小.
        -u 以文件上次被访问的时间排序.
        -t 以时间排序.
        -h 显示文件大小时增加可读性.
        -S 以文件大小排序.
        -R 列出所有子目录下的文件.



    more: 展示文件内容

        +n 从第n行开始显示
        -n 定义屏幕大小为n行     
        -c 从顶部清屏，然后显示   
        -l 忽略Ctrl+l（换页）字符

            常用指令：
                Enter       向下n行，需要定义。默认为1行
                Ctrl+F      向下滚动一屏
                空格键       向下滚动一屏
                Ctrl+B      返回上一屏
                =           输出当前行的行号
                ：f         输出文件名和当前行的行号
                V           调用vi编辑器
                !命令        调用Shell，并执行命令
                q           退出more


    cat: 重定向

        cat file    一次性显示文件全部内容
        cat >file   创建一个文件
        cat file1 file2 > file3     合并文件   
        cat -n file1 > file2        从第n行开始
        cat -n [number] file        从第几行，显示行号，默认是1




    less: 分页显示

        less file

            q: 退出
            h: 帮助
            空格: 下一页
            b: 上一页
            g: 第一行
            G: 结尾




    head/tail:

        head -n file    显示文件头n行
        tail -n file    显示文件后n行
        tail -f file    循环读取


    chown 权限

        chown [选项]...[所有者][:组] 文件...   

        chown root file     更改用户，改变用户。

            -R 处理指定目录以及其子目录下的所有文件
            -v 显示详细的处理信息




    chmod  权限

        r ：读权限，用数字4表示
        w ：写权限，用数字2表示
        x ：执行权限，用数字1表示
        R : 对于一个目录所有子文件添加权限





    tar／gzip : 打包、压缩、解压缩

        tar : 打包用的
                -A 新增压缩文件到已存在的压缩
                -B 设置区块大小
                -c 建立新的压缩文件
                -d 记录文件的差别
                -r 添加文件到已经压缩的文件
                -u 添加改变了和现有的文件到已经存在的压缩文件
                -x 从压缩的文件中提取文件
                -t 显示压缩文件的内容
                -z 支持gzip解压文件
                -j 支持bzip2解压文件
                -Z 支持compress解压文件
                -v 显示操作过程
                -l 文件系统边界设置
                -k 保留原有文件不覆盖
                -m 保留文件不被覆盖
                -W 确认压缩文件的正确性
                -p 保留文件属性

                可选参数如下：
                    -b 设置区块数目
                    -C 切换到指定目录
                    -f 指定压缩文件                


            tar -cvf /tmp/etc.tar           /etc    <==仅打包，不压缩！
            tar -zcvf /tmp/etc.tar.gz       /etc    <==打包后，以 gzip 压缩
            tar -jcvf /tmp/etc.tar.bz2      /etc    <==打包后，以 bzip2 压缩


            tar -tf test.tar.gz     查看压缩包内的文件



        gzip ： 压缩



        scp : scp [参数] [原路径] [目标路径]

            远程拷贝文件，并且基本不会影响系统的IO
                scp是 secure copy的缩写, scp是linux系统下基于ssh登陆进行安全的远程文件拷贝命令。
                linux的scp命令可以在linux服务器之间复制文件和目录。

                -1  强制scp命令使用协议ssh1  
                -2  强制scp命令使用协议ssh2  
                -4  强制scp命令只使用IPv4寻址  
                -6  强制scp命令只使用IPv6寻址  
                -B  使用批处理模式（传输过程中不询问传输口令或短语）  
                -C  允许压缩。（将-C标志传递给ssh，从而打开压缩功能）  
                -p 保留原文件的修改时间，访问时间和访问权限。  
                -q  不显示传输进度条。  
                -r  递归复制整个目录。  
                -v 详细方式显示输出。scp和ssh(1)会显示出整个过程的调试信息。这些信息用于调试连接，验证和配置问题。   
                -c cipher  以cipher将数据传输进行加密，这个选项将直接传递给ssh。   
                -F ssh_config  指定一个替代的ssh配置文件，此参数直接传递给ssh。  
                -i identity_file  从指定文件中读取传输时使用的密钥文件，此参数直接传递给ssh。    
                -l limit  限定用户所能使用的带宽，以Kbit/s为单位。     
                -o ssh_option  如果习惯于使用ssh_config(5)中的参数传递方式，   
                -P port  注意是大写的P, port是指定数据传输用到的端口号   
                -S program  指定加密传输时所使用的程序。此程序必须能够理解ssh(1)的选项。

            scp命令的实际应用概述：  
            从本地服务器复制到远程服务器：
            (1) 复制文件：  
            命令格式：  
                scp local_file remote_username@remote_ip:remote_folder  
                scp local_file remote_username@remote_ip:remote_file  
                scp local_file remote_ip:remote_folder  
                scp local_file remote_ip:remote_file  
            第1,2个指定了用户名，命令执行后需要输入用户密码，第1个仅指定了远程的目录，文件名字不变，第2个指定了文件名  
            第3,4个没有指定用户名，命令执行后需要输入用户名和密码，第3个仅指定了远程的目录，文件名字不变，第4个指定了文件名   


            例子：
                scp root@192.168.120.204:/opt/soft/nginx-0.5.38.tar.gz /opt/soft/
                scp osye@127.0.0.1:/www/index.html ./



        rpm :



        wc : (Word Count)命令的功能为统计指定文件中的字节数、字数、行数，并将统计结果显示输出

                -c 统计字节数。
                -l 统计行数。
                -m 统计字符数。这个标志不能与 -c 标志一起使用。
                -w 统计字数。一个字被定义为由空白、跳格或换行字符分隔的字符串
                -help 显示帮助信息
                --version 显示版本信息

            例子：
                wc 2-shell脚本/shell.md                   
                128     191     2601     2-shell脚本/shell.md
                行数     单词数   字节数    文件名

        cut : 从文件的每一行剪切字节、字符和字段并将这些字节、字符和字段写至标准输出
              如果不指定 File 参数，cut 命令将读取标准输入。

              主要参数
                -b ：以字节为单位进行分割。这些字节位置将忽略多字节字符边界，除非也指定了 -n 标志。
                -c ：以字符为单位进行分割。
                -d ：自定义分隔符，默认为制表符。
                -f ：与-d一起使用，指定显示哪个区域。
                -n ：取消分割多字节字符。仅和 -b 标志一起使用。
                    如果字符的最后一个字节落在由 -b 标志的 List 参数指示的<br />范围之内，该字符将被写出；
                    否则，该字符将被排除必须指定 -b、-c 或 -f 标志之一。

                who | cut -b 1  // 输出who输出的，字符串的每行的第一个。



        grep:文本搜索工具

           grep [option] pattern file
                －c：只输出匹配行的计数。
                －I：不区分大 小写(只适用于单字符)。
                －h：查询多文件时不显示文件名。
                －l：查询多文件时只输出包含匹配字符的文件名。
                －n：显示匹配行及 行号。
                －s：不显示不存在或无匹配文本的错误信息。
                －v：显示不包含匹配文本的所有行。
                -A: after 将后面的列出来 例如 －A2， 将后面的2行，也列出来
                -B: 上面 n 行列出来
                -C: 上下，n 行都列出来
                -r: 遍历各个目录
                -E: $ grep -E 'grep | n' linux命令.md   // 查找有 grep 和 n 的行。

                - pattern正则表达式主要参数：
                    \： 忽略正则表达式中特殊字符的原有含义。
                    ^：匹配正则表达式的开始行。
                    $: 匹配正则表达式的结束行。
                    \<：从匹配正则表达 式的行开始。
                    \>：到匹配正则表达式的行结束。
                    [ ]：单个字符，如[A]即A符合要求 。
                    [ - ]：范围，如[A-Z]，即A、B、C一直到Z都符合要求 。

                    * : 0个或多个 字符， 星号前面的字符的0个或多个。
                    . : 1个任意 字符。
                    + : 1个或多个 前面的字符。     [需要加入 －E 或者 egrep] ,扩展正则。
                    ? : 0个或1个   使用的时候，   [需要加入 －E 或者 egrep] ,扩展正则。


            例子：
                grep "-" linux.md   // 查找文件内，包含‘－‘的行

                grep '[a-z]\{5\}' 1-Linux基础/linux命令.md   // 查找连续5个字符的行

                grep -c 'pa' 1-Linux基础/linux命令.md   2

                $ grep -n "pat" 1-Linux基础/linux命令.md
                    209:           grep [option] pattern file
                    218:                - pattern正则表达式主要参数：

                $ grep -A2 -n "pat" 1-Linux基础/linux命令.md
                    208:           grep [option] pattern file
                    209-                －c：只输出匹配行的计数。
                    210-                －I：不区分大 小写(只适用于单字符)。

                $ grep -r "#" ./2-shell脚本       // 搜索文件目录下
                    ./2-shell脚本/shell.md:### histroy
                    ./2-shell脚本/shell.md:### .  ls *.txt *通配符
                    ./2-shell脚本/shell.md:### [1,2] 任选一个
                    ./2-shell脚本/shell.md:### ? 一个任意的支付
                    ./2-shell脚本/shell.md:### 变量：
                    ./2-shell脚本/shell.md:#### 由于使用的是zsh，所以exprot.使用tab建获取命令的执行。
                    ./2-shell脚本/shell.md:### 特殊符号

                grep -r -v "#" ./2-shell脚本
                    过滤出不带某个关键字的行

                $ grep '[0-9]' 1-Linux基础/linux命令.md       
                    查找包含 ［0-9］数字的行

                $ grep '[0-9]' -v 1-Linux基础/linux命令.md    
                    去出［0－9］之外的行


                $ grep -v '^$' test.md | grep -n "^#"
                    首先找到不是空行的行，然后找到开头是 ＃ 的行

                    1:### histroy
                    2:### .  ls *.txt *通配符
                    3:### [1,2] 任选一个
                    4:### ? 一个任意的支付
                    5:### 变量：
                    12:#### 由于使用的是zsh，所以exprot.使用tab建获取命令的执行。
                    42:### 特殊符号
                    58:### 特殊指令


                $ grep -n '^[0-9]' test.md
                    开头是［0-9］
                    94:1
                    95:2
                    96:3 werew
                    97:4

                $ grep -n '[^0-9]' test.md
                    非数字开头的行



                $ grep -n 'pat*' 1-Linux基础/linux命令.md
                    匹配 0个或多个 t

                    208:           grep [option] pattern file
                    221:                - pattern正则表达式主要参数：
                    242:                grep -c 'pa' 1-Linux基础/linux命令.md   2
                    244:                $ grep -n "pat" 1-Linux基础/linux命令.md
                    245:                    209:           grep [option] pattern file
                    246:                    218:                - pattern正则表达式主要参数：
                    248:                $ grep -A2 -n "pat" 1-Linux基础/linux命令.md
                    249:                    208:           grep [option] pattern file


       sed ： sed是一个很好的文件处理工具，本身是一个管道命令，主要是以行为单位进行处理，
              可以将数据行进行替换、删除、新增、选取等特定工作

              sed [-nefri] ‘command’ 输入文本     

            -n∶使用安静(silent)模式。在一般 sed 的用法中，所有来自STDIN的资料一般都会被列出到萤幕上。
               但如果加上 -n 参数后，则只有经过sed 特殊处理的那一行(或者动作)才会被列出来。
            -e∶直接在指令列模式上进行 sed 的动作编辑；
            -f∶直接将 sed 的动作写在一个档案内， -f filename 则可以执行 filename 内的sed 动作；
            -r∶sed 的动作支援的是延伸型正规表示法的语法。(预设是基础正规表示法语法)
            -i∶直接修改读取的档案内容，而不是由萤幕输出。       

            a ∶ 新增， a 的后面可以接字串，而这些字串会在新的一行出现(目前的下一行)～
            c ∶ 取代， c 的后面可以接字串，这些字串可以取代 n1,n2 之间的行！
            d ∶ 删除，因为是删除啊，所以 d 后面通常不接任何咚咚；
            i ∶ 插入， i 的后面可以接字串，而这些字串会在新的一行出现(目前的上一行)；
            p ∶ 列印，亦即将某个选择的资料印出。通常 p 会与参数 sed -n 一起运作～
            s ∶ 取代，可以直接进行取代的工作哩！通常这个 s 的动作可以搭配正规表示法！例如 1,20s/old/new/g 就是啦！


            例子：
              sed '1d' ab              #删除第一行
              sed '$d' ab              #删除最后一行
              sed '1,2d' ab            #删除第一行到第二行
              sed '2,$d' ab            #删除第二行到最后一行

              sed -n '1p' ab           #显示第一行
              sed -n '$p' ab           #显示最后一行
              sed -n '1,2p' ab         #显示第一行到第二行
              sed -n '2,$p' ab         #显示第二行到最后一行

              sed -n '/ruby/p' ab       #查询包括关键字ruby所在所有行
              sed -n '/\$/p' ab         #查询包括关键字$所在所有行，使用反斜线\屏蔽特殊含义


              sed '1a drink tea' ab     #第一行后增加字符串"drink tea
              sed '1,3a drink tea' ab #第一行到第三行后增加字符串"drink tea"

              sed '1c Hi' ab                #第一行代替为Hi
              sed '1,2c Hi' ab             #第一行到第二行代替为Hi

              格式：sed 's/要替换的字符串/新的字符串/g'   （要替换的字符串可以用正则表达式）
              sed -n '/-/p' test.txt | sed 's/-t/bird/g'  // 查找有 － 的段落，

              sed -i '$a bye' ab         #在文件ab中最后一行直接输入"bye"

        awk : 



        iostat，vmstat，



    alias : 设置指令的别名
        alias[别名]=[指令名称]

        操作的:
            alias lm='ls -al | more'




##
    我参考了这个人分享的
        http://www.cnblogs.com/peida/tag/linux%E5%91%BD%E4%BB%A4/   





## df, du，lsof，join，find，top，ps




    ps :  对进程进行监控和控制

            -e 显示所有进程。
            -f 全格式。
            -h 不显示标题。
            -l 长格式。
            -w 宽输出。
            a 显示终端上的所有进程，包括其他用户的进程。
            r 只显示正在运行的进程。
            x 显示没有控制终端的进程。





            ps -efl | grep 4000
