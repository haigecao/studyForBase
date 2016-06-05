//
//  main.cpp
//  work_one
//
//  Created by osye on 16/6/3.
//  Copyright (c) 2016年 Hugo Cao . All rights reserved.
//  
//  虚函数就是在基类中定义，在子类中实现
//  这样子类必须实现
//

/*
    1.如果虚函数在基类与派生类中出现，仅仅是名字相同，而形式参数不同，
        或者是返回类型不同，那么即使加上了virtual关键字，也是不会进行滞后联编的。 

    2.只有类的成员函数才能说明为虚函数，因为虚函数仅适合用与有继承关系的类对象，
        所以普通函数不能说明为虚函数。 

    3.静态成员函数不能是虚函数,因为静态成员函数的特点是不受限制于某个对象。 

    4.内联(inline)函数不能是虚函数，因为内联函数不能在运行中动态确定位置。
        即使虚函数在类的内部定义定义，但是在编译的时候系统仍然将它看做是非内联的。 

    5.构造函数不能是虚函数，因为构造的时候，对象还是一片位定型的空间，只有构造完成后，
        对象才是具体类的实例。 

    6.析构函数可以是虚函数,而且通常声名为虚函数。
 */

#include <iostream>
using namespace std;

class Person {
public:
    virtual void test();
};

class Man : Person{
public:
    Man();
    ~Man();

    void test() {
        cout << "test virtual" << endl;
    }
};

int main() {

    Man *m = new Man();
    m->test();
    
    return 0;
}
