public class Test {

    public int add(int x, int y) {
        int t = x;
        x = y;
        y = t;

        return x + y;
    }

    public int add(int [] num) {
        int t = num[0];
        num[0] = num[1];
        num[1] = t;

        return num[1] + num[0];
    }

    public static void main(String[] args) {


        // Test t = new Test();
        // int x = 3, y = 4;

        // System.out.println(t.add(x, y));
        // System.out.println(x);
        // System.out.println(y);

        // System.out.println("");

        // int [] num = new int[]{100, 200};
        // System.out.println(t.add(num));
        // System.out.println(num[0]);
        // System.out.println(num[1]);

        // System.out.println(args.length);

        // String s1 = new String("abc");
        // String s2 = new String("abc");

        // if (s1 == s2) {
        //     System.out.println("true");
        // }
        // else {
        //     System.out.println("false");
        // }

        Test t1 = new Test();
        Test t = t1;
        Test t2 = new Test();

        /**
         * Test@7852e922
         * Test@7852e922
         * Test@4e25154f
         */

        System.out.println(t);
        System.out.println(t1);
        System.out.println(t2);



    }
}
