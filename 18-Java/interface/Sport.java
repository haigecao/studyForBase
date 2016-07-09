

interface Sport {
   void run();
   void jump();
}

class Test implements Sport {
    public void run () {
        System.out.println("run");
    }

    public void jump () {
        System.out.println("jump");
    }

    public static void main(String[] args) {
        Test t = new Test();
        t.run();
        t.jump();
        System.out.println(t.run());
    }
}
