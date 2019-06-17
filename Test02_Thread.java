package oop0617;

class MyThread2 extends Thread{	//Thread 클래스를 상속받음
								//클래스가 클래스 상속받는 경우 단일 상속만 가능하다.
								// > start(),run()함수가 있음 	
								// > 오버라이드 해야함. 대신 run() 함수만 수정해야함 start()는 run()을 실행시키는 것.
	
	private int num;
	private String name;
	public MyThread2() {} //기본생성자함수
	public MyThread2(int num, String name) {
		this.num = num;
		this.name = name;
	}
	
	//Thread 클래스에서 물려받은 함수를 오버라이드 하기.
	@Override
		public void run() {
			for(int a=0;a<num;a++){
				System.out.println(name+":"+a);
			}
		}//run
	//start함수는 실제적으로 run()을 실행하는것이기 때문에 굳이 오버라이드 안해도 된다.

}//class




public class Test02_Thread {

	public static void main(String[] args) {
		/*
		 * 2) 쓰레드를 사용하는 경우
		 * Thread클래스와 인터페이스Runnable 있는데 
		 * Thread클래스를 받으면 단일상속밖에 안되기 때문에, 
		 * 보통 인터페이스Runnable을 많이 받는다.(다중상속가능) > 활용도가 더 높음.
		 */
		
		
		MyThread2 t1=new MyThread2(1000, "★");
		MyThread2 t2=new MyThread2(1000, "★★");
		MyThread2 t3=new MyThread2(1000, "★★★");
		
		t1.start();
		t2.start();
		t3.start();
		
		/*
		 * 출력값
		 * 	★:0
			★★★:0
			★★:0
			★★★:1
			★:1
			★★★:2
			★★:1
			★★★:3
		 */
		
		
		
	}//class

}//main
