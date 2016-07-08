class Point {
	int x, y, z;
	char c;
	boolean b;

	static int xx = 0;

	final int ation;	// 常量

	Point() {		// 构造方法，没有返回值
		// x = 10;
		// y = 100;
		ation = 1;
		// this(100, 1999);	// 调用带参数的构造方法
	}
	// 
	// 
	
	Point (int a, int b) {		// 带参数的构造函数
		ation = 0;
		x = a;
		y = b;
	}

	static void test () {
		System.out.println("static function");
		System.out.println(xx);

	}

	void outPut() {
		System.out.println(x);
		System.out.println(y);
		System.out.println("---------------");

		// System.out.println(z);	// 默认会初始化
		// System.out.println(c);
		// System.out.println(b);

	}

	void outPut(int x, int y) {
		System.out.println(x);
		System.out.println(y);
	}

	void setPoint(int a, int b) {
		this.x = a;
		this.y = b;
	}




}

class SubPoint extends Point {

	void outPut (char c) {
		System.out.println("sub function");
	}
}



class testhg {

	// 主程序－－－－－－
	public static void main(String[] args) {

		Point.test();

		Point pt1, pt2;
		pt1 = new Point(100, 200);	// 自动调用构造函数
		pt1.outPut();

		// pt1.x = 10;
		// pt1.y = 20;
		// pt1.outPut();


		pt2 = new Point();
		pt2.outPut();
		pt2.setPoint(99, 88);
		pt2.outPut();


		SubPoint subPt;
		subPt = new SubPoint();
		subPt.outPut();		// 父类
		subPt.outPut('s');	// 调子类


	}
}








