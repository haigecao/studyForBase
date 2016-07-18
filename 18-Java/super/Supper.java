// class Test {
//     class Sp {

//     }
// }


// public class Supper extends Test.Sp {

//     /**
//      * 使用 super 方法，可以使一个类，继承一个类的内部类。
//      */
//     Supper (Test t) {
//         t.super();
//     }

//     public static void main(String[] args) {

//         Test t = new Test();
//         Test.Sp sp = t.new Sp();

//     }
// }

//-------------------------------------------------------------------

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





































//
//
//
//
//
//
