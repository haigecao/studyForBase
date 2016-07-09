package hg.test;

import sx.test.*;

public class Test extends Test1 {

	// String s =  "ni hao";

 //    public void fun () {
 //        System.out.println("Test");
 //    }
 //
    Test1 t1;

    Test () {
        t1 = new Test1();
        // t1.defun();
        t1.profun();
        t1.pubfun();
        // t1.prifun    // 同包下面私有的访问不了
    }

}
