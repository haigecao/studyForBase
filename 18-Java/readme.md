###
    1)javac test.java

        编译出2个类


    2)jar cvf
        jar cvf hg.jar Hello.class Welcome.class
        生成了一个jar包

        jar cvf hg.jar test/
            将test目录下的所有文件，打到jar包里面。
s
###
    java 中只有一个定义为public的类

###
      java 解释器加载的是类，不是文件。
      java world，执行的时候，大小写敏感。


###
    byte 类型定义一个变量，byte b = 3;
    b = b * 3; byte做运算的时候，自动提升了变量的数据类型。
    在java中，小数的常量。是一个double类型。比如 float f; f = 1.3; 是一个double类型。
    因此，需要 f = 1.3f;

    条件判断的时候，用true 或 false，不能使用1，因为，是整形。

    数组：
        int num[] = new int[3];

        推荐： int[] num; 的方式。

        int [][] num;
        num = new int[3][4];
        num[0][1]=12;
        num[2][3]=34;

        java 的二位数组，每一行的列数，可以控制。
        有点类似C语言的指针数组。
            int [][] testnum;
            num=new int[3][];
            num[0] = new int[5];
            num[1] = new int[3];
            num[2] = new int[4];


       if
       while
       for (int i = 0; i < 10; i++) {
           // i 是一个局部变量
           // for 的外边是访问不到的
       }

###
    java 中包的概念。

    可以理解为文件夹，来解决命名冲突的问题，可以理解为，命名空间。

    一个文件中有很多class类名称，最好一个文件一个类。

    // 程序执行的开始
    public class Main {
        public static void main() {

        }
    }



###

    java 的 类名大写 —— Student，只要首字母大写。
    String 双引号，使用其内容。
    数据类型转换


###
    类：
    对象：
    对象 ＝  new 类();  // 自动执行构造函数，如果没有定义，使用缺损的构造函数。
    new
        （1）为对象分配内存空间；
        （2）构造方法的调用；
        （3）为对象返回一个引用。

        当一个变量没有被初始化的时候，系统会默认给初始化。
        比如：int --> 0
            boolean false
            char  '\n'
            对象   null


    javap Point     // javap + (javac 编译的文件)
        javap Point
            Compiled from "Point.java"
            class Point {
              int x;
              int y;
              Point(int, int);
              void outPut();
              public static void main(java.lang.String[]);
            }


    构造函数通过参数的类型和个数，进行重载。使用的时候，通过参数的个数个类型，进行选择。

    this
    （1）this变量代表对象本身。
    （2）使用this来区分变量
    （3）this在不带参数的构造函数中，可调用带参数的构造函数。


###

    内存分配
        对象中的函数，一份拷贝；
        变量，每个对象有自己独立的拷贝。


###

    static 方法，用 类名.function. 其余的方法，是实例方法。
    有一个需要注意的，静态方法中的变量，只能是静态变量。不能使用普通的成员变量。
    因为，普通的成员变量，是需要new的时候，才去分配内存空间的。
    而静态函数，明显并不需要分配的时候，就可以被使用。那么成员变量无法使用。

    内存模型：如果方法和变量没有被分配代码区域，或者内存。那么，无法使用。
    静态方法，不可以引用非静态方法和非静态的成员变量，而反过来了是可以的。

    静态方法和变量，是属于某一个类，而不是特定的对象。变量和方法的引用，
    是通过类名引用。也可以通过类的对象，对调用静态的方法。

###

    main方法，是一个全局的方法.为了解决程序的运行问题。就让这个方法，变成静态方法。


###
    final double a = 1.1;
    final 是一个常量，运行的时候，不能被修改。
        声明的同时，需要初始化。当然。放到构造函数里面也可以。



###

    继承
        extends

        supper  访问父类，被隐藏的变量和函数。





###

    包 package 在最前面，不能有空白，在package之前，不能有任何语句。
    包 对应着文件系统的目录层次结构
    在 package 语句中， " . " 代表着目录的层次。

    package hg;     // 这个报名，可以有很多种，比如。a.b.c.d.hg，但是文件目录可以对应。
    class Test {
        public static void main(String[] args) {
            System.out.println("hg package..");
        }
    }

    javac Test.java

    所谓的包，就是文件目录，因此要建立文件夹hg,将编译以后的文件移入。

    执行： java hg.Test
            hg package..

    也可以使用 “ / ” 来分别类名和包名  java hg／Test


    javac -d 把文件目录层次结构补齐。
        javac -d . (当前目录)   . 点 是当前目录

        javac -d . test.java    // 编译,

        ls
            hg        test.java


###
    javac -d . Test.java 在当前目录下生成包

    java -d ../../  Test.java  指定目录



###

    import 引入包中的类
            import java.io.File;
        引入整个包
            improt java.io.*;

    java lang 包是自动加入的。


    import java.io.File;    // 倒入一个jia包，然后就可以使用File
        File f; // 声明一个变量
    如果不倒入的话，就使用 java.io.File f; 去声明一个变量。



###

    访问相关的说明符
    （1）public
    （2）default
    （3）在同一个包中类，无需引用。
            但是要注意，编译顺序，需要被引用的放在前面。

            也可以，javac -d . ＊.java   // 这样就不考虑，先后顺序了。

    default 缺损的类，就只能在同一个包当众被访问。

    final   定义的类，就是最终的类，不能由




    public 再不同的包之间引用类，只能访问到声明为public的类




###

###


###
































###

    IDEA 的项目，成为模块。






































 ###
