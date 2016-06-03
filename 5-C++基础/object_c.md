# 尝试学习一下Object-c 完成面向对象编程和作业

##

  1）Object-c支持完整的C语言语法，
  2）支持完整的面向对象，
  3）兼容性好，可以进行C／C++混写。

##

  Object-c
      头文件 .h  
      实现文件 .m

  oc和C+＋ 混写的项目
      头文件     .h  
      实现文件   .mm


##

  类的定义
      simple 继承与 NS 这个类
      @interface SimpleClass : NSObject
      @end

  类的属性和声明
    //声明2个属性
      @interface Person:NSObject
        @property NSString \*firstName;
        @property NSString \*lastName;
      @end

    // 对象，值类型， 只读
      @property NSNumber \*yearOfBirth;
      @property int yearOfBirth;
      @property (readonly) NSString \*firstName;

    OC 有 加号方法和减号方法
      减号 对象方法
      加号 静态方法

    @interface Person : NSObject
      -(void) someMethod;
      -(void) someMethodWithValue:(SomeType)value;
      +(id) ....
    @end


    类的实现
      #import "Person.h"
      @implementation Person

      @end


    完整的例子：
      Person.h头文件
        @interface Person : NSObject
        -(void)sayHello;
        @end

      Person.m文件
        @import "Person.h"

        @implementation Person
        -(void)sayHello {
          NSlog(@"hello world");
        }
        @end



    安装Xcode，并根据个人意愿配置。
    create a new XCode project

        #import <Foundation/Foundation.h>
        int main(int argc, const char * argv[]) {
            @autoreleasepool {
                int a = 0;
                int b = 1;
                int c = a + b;

                NSLog(@"%d", c);
            }
            return 0;
        }



    变量的类型：
      int : 32位，
      float ： 1.0
      double ：双精度
      char ：
