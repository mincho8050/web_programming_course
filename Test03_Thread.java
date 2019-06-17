package oop0617;

class MyThread3 implements Runnable{ //구현
	private int num;
	private String name;
	public MyThread3() {} //기본생성자함수
	public MyThread3(int num, String name) {
		this.num = num;
		this.name = name;
	}
	
	@Override
		public void run() {
			for(int a=0;a<num;a++){
				System.out.println(name+":"+a);
			}
		}//run
	
}//class

public class Test03_Thread {

	public static void main(String[] args) {
		/*
		 * 3) Runnable 인터페이스를 이용한 경우
		 * >JVM이 쓰레드 관리자에 등록하고
		 * >start()메소드가 run()을 호출한다.
		 */
		
		//다형성
		//Runnable target=new Thread();
		Thread t1=new Thread(new MyThread3(1000,"★"));
		Thread t2=new Thread(new MyThread3(1000,"★★"));
		Thread t3=new Thread(new MyThread3(1000,"★★★"));

		t1.start();
		t2.start();
		t3.start();
		
		/*
		 * 출력값
		 * 	★:0
			★:1
			★★★:0
			★★:0
			★★★:1
		 */
		
		

	}//main

}//class
