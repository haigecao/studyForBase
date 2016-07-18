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
    final 类名前加上的时候，就是最终的类。


###
                    public         protected       default        private
    同一个类中          1                1              1               1
    同一个包中          1                1              1
    子类中             1                1
    通用性             1



###
    final
        当一个方法前面被final 修饰的时候，这方法就是无法被覆盖的方法。
    子类就无法重写它。如果重写，就报错。

        final 方法编译器可以优化

        private 和 static 方法本身都是final 方法。

###

    abstract  类无法被实例化
        如果父类定义了一个抽象方法，那么子类就必须实现它。
    如果子类不实现它，一样也要声明为抽象的方法，声明以后，
    那么这个类就变成了一个抽象类。


###
    System.gc();    显示的运行垃圾收集器。

    finalize    继承自Object，析构的时候，可以使用




###

        interface Sport {
            public abstract void run();
            public abstract void jump();
            double PI = 3.14;
        }

        public class Test implements Sport {
            void run () {
                System.out.println("run");
            }

            void jump () {
                System.out.println("jump");
            }

            public static void main(String[] args) {
                Test t = new Test();
                t.run();
                t.jump();
            }
        }

        在接口中，所有的方法，默认为是 puclic abstract 类型的。
    因此，在 implements 出来的类，需要接口设定的权限，需要大于这个。
    否则无法被访问。就定义成 public 。

        接口中声明方法，不能使用那些修饰符。也即是说，不适用修饰符就好了。
        public 接口，也需要定义在同名的文件中。

        在实现接口的时候，需要讲接口的方法，都实现了，否则就是抽象类，
    否则就无法实例化了。

        接口是用来通信的，系统开发，定义规格。

        并且接口可以继承多个 implements 接口；

        接口中的数据成员，都是 公用静态常量。
                            public static final
            如何访问这种数据成员呢？

        举例：
            Sport.PI;
            Test.PI;    // Test 继承自 Sport，所以访问静态成员。


        类只能单继承，但是，一个类可以实现多个接口。
    一个类在继承的时候，还可以实现多个接口。

        //在继承类的同时，实现多个接口
            interface Sittable {
                void sit();
            }
            interface Lie {
                void sleep();
            }
            interface HealthCare {
                void massage();
            }

            // 实现了 Sittable 接口
            class Chair implements Sittable
            {
                public void sit(){};
            }

            // 继承了Chair 类，并实现了两个接口
            class Sofa extends Chair implements Lie, HealthCare
            {
                public void sleep(){};
                public void massage(){};
            }


###
    内部类：在一个类中，又定义了另一个类。这个类就是内部类。
        内部类可以让逻辑相关的一组类组织在一起，并由外部类来控制内部类的可见性。
    通过特殊的 this 引用可以使内部类访问外部类的相关成员。


            class A {

                private int index = 100;

                class B {
                    int index = 10;
                    void fun() {
                        int index = 1;
                        System.out.println(index);  // 1
                        System.out.println(this.index);  // 10
                        System.out.println(A.this.index);  // 100
                    }
                }

                void test() {
                    B b = new B();  // 这里保存了A.this 的指针，指向外部。
                    b.fun();
                }

            }

            public class Test {
                public static void main(String[] args) {
                    A a = new A();
                    a.test();

                    // B b = new B();  // 这是不行的
                    // A.B b = new A.B();

                    // 创建内部类对象的正确方式。
                    A a = new A();
                    A.B b = a.new B();

                }
            }

        类 B 是类 A 的内部类。在内部类B中，可以访问类 A 的所有资源。
    因此，在内部类中，他可以访问外部类的任何方法。是通过 this 这个特殊
    的对象，来连接的。如果类 B 在外部定义，那么显然就无法访问 A 类的内部
    变量。在创建对内存的时候，内部类会产生一个 Outer.this 的外部类指针。

    javac 编译出来的内部类，会产生 A$B.class


###
        将类放入一个方法中，放到 if 的语句块当中，放到 {} 语句块当中。
    调用的区间只在语句块中被使用。


            void fun1 (final int a) {
                final int b = 20;

                class C {
                    int index = 99;
                    void print () {
                        int index = 9;
                        System.out.println(index);
                        System.out.println(this.index);
                        System.out.println(A.this.index);

                        System.out.println(a);
                        System.out.println(b);

                    }
                }

                C c = new C();
                c.print();
            }

        如果内部类是一个静态的，那么外部类，就是不必须得存在了。但是，在内部类中，
    无法访问外部类的，成员方法。必须是静态成员方法或者静态的成员方法。

        并且，只有static 中。 在类的顶层使用。


###

        如果一个静态类的内部类，虽然无需非要创建一个对象，在使用，但是，还是要遵守，
    静态的规则，就是静态内部类，只能使用静态的方法，而不是在使用普通的成员方法了。

    注意： 在一个 静态的内部类中，是可以有静态的方法。
    但是一个非静态的内部类，是不能有静态的方法。


###
        内部类的使用1，通过super方法，可以使得一个类去继承内部类。
    从而，得到内部类的方法。

    class Test {
        class Sp {

        }
    }

    public class Supper extends Test.Sp {

        /**
          使用 super 方法，可以使一个类，继承一个类的内部类。
         */
        Supper (Test t) {
            t.super();
        }

        public static void main(String[] args) {

            Test t = new Test();
            Test.Sp sp = t.new Sp();

        }
    }



###
    内部类使用2，跟接口结合使用。
    接口，可以返回一个匿名的内部类，进而控制访问。

        // 定义了一个接口
        interface Test {
            void run ();
            void jump();
        }

        //
        class A {

            Test getTest () {
                return new Test() {
                    public void run () {
                        System.out.println("run...");
                    }
                    public void jump() {
                        System.out.println("jump...");
                    }
                };
            }
        }

        public class Supper {
            public static void main(String[] args) {

                A a = new A();
                Test t = a.getTest();

                t.run();
                t.jump();
            }
        }


###

        1）使用内部类的好处，就是，可以在内部类中随意使用外部类的代码。
    增加代码的可读性，更好的组织和管理代码。
        2) 使用内部类实现接口，适配器。


        匿名内部类



###

    boolean
    byte
    char
    int
    string
    long
    double
    float
    八种基本类型，其余的都是引用。


        string 中重载了 + 操作符，因此可以任意加。
    但是java不允许重写操作符。



    String a = "abc";   // 这是一个常量，不能被改变。






###

    int [] num  = new int[3];
    num = null; //垃圾回收


    函数的调用，传递的参数是变量的拷贝。而不是引用。


    打印对象，会自动调用tostring方法。可以覆盖。



###
    拷贝

        浅拷贝：标准类型可以直接复制，但是，对象类型，就指向同一个变量。

        深拷贝：标准类型和












































###

    IDEA 的项目，成为模块。






































 ###
