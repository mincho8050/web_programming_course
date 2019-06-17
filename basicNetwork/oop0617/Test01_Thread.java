package oop0617;


class MyThread1{
	
	private int num;
	private String name;
	
	public MyThread1() {} //기본생성자함수
	public MyThread1(int num, String name) {
		this.num = num;
		this.name = name;
	}
	
	public void run(){
		for(int a=0;a<num;a++){
			System.out.println(name+":"+a);
		}
	}//run
	public void start(){
		run(); //start함수에는 run();함수만 넣는다. 
	}//start
	
	
}//class




public class Test01_Thread {

	public static void main(String[] args) {
		/*
		 * Thread 클래스
		 * > 하나의 프로그램이나 하나의 메소드가 CPU 자원을 
		 * 	 전부 점유하는 것을 막을 수 있다.
		 * > ex) 채팅 프로그램
		 */

		//1) 쓰레드를 사용하지 않는 경우
		MyThread1 t1=new MyThread1(100, "★");
		MyThread1 t2=new MyThread1(100, "★★");
		MyThread1 t3=new MyThread1(100, "★★★");
	
		t1.start(); 
		t2.start();
		t3.start();
		//t1이 끝나야 t2,t3가 순서대로 나온다. 
		/*
		출력값
		★:0~★:99
		★★:0~★★:99
		★★★:0~★★★:99
		*/
		
		
		
		
		
		
		
		
		
	}//main

}//class
