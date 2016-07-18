

class A {

    private int index = 1;

    // static void fun() {
        // A a = new A();
        // int index = 100;
        // System.out.println(index);          // funciton
        // System.out.println(this.index);     // B
        // System.out.println(A.this.index);   // A
    // }


    // class B {
    //     private int index = 10;

        // static void fun() {
        //     // A a = new A();
        //     // int index = 100;
        //     // System.out.println(index);          // funciton
        //     // System.out.println(this.index);     // B
        //     // System.out.println(A.this.index);   // A
        // }

    // }

    // void test() {
    //     B b = new B();
    //     b.fun();
    // }

    // B getB() {
    //     return  new B();
    // }

    // void fun1 (final int a) {
    //     final int b = 20;

    //     class C {
    //         int index = 99;

    //         void print () {
    //             int index = 9;
    //             System.out.println(index);
    //             // System.out.println(this.index);
    //             // System.out.println(A.this.index);

    //             System.out.println(a);
    //             System.out.println(b);
    //         }


    //     }


    //     C c = new C();
    //     c.print();
    // }

    // void fun2 (final int a) {
    //     final int b = 120;

    //     class C {
    //         int index = 199;
    //         void print () {
    //             int index = 19;
    //             System.out.println(index);
    //             System.out.println(this.index);
    //             System.out.println(A.this.index);

    //             System.out.println(a);
    //             System.out.println(b);

    //         }
    //     }


    //     C c = new C();
    //     c.print();
    // }
    //
    //

    static class SA {
        int x = 0;

        void fun() {
            System.out.println(x);
        }
    }

}

public class Test {
    public static void main(String[] args) {

        // A a = new A();
        // a.fun1(1);
        // A.B b = a.getB();
        // b.fun();

        // A a = new A();
        // A.B b1 = a.new B();

        A.SA sa = new A.SA();
        sa.fun();


    }
}



