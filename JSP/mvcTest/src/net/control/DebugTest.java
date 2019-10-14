package net.control;

public class DebugTest {
	public static void main(String[] args) {
		int c;
		c=0;
		c=sum(10,20);
		System.err.println("합"+c);
	}
	
	public static int sum(int i, int j) {
		int tmp;
		tmp=i+j;
		return tmp;
	}
}
