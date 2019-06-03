package oop0603;

class Fruit{
	public Fruit(){
		System.out.println("Fruit()...");
	}
}//fruit

class Apple extends Fruit{
	public Apple(){
		System.out.println("Apple()...");
	}
}//apple

class PineApple extends Apple{
	public PineApple(){
		System.out.println("PineApple()...");
	}
}//pineapple

public class Test06_Constructor {

	public static void main(String[] args) {
		/*
		 * 클래스 상속관계에서의 생성자 호출 순서
		 * > 부모생성자() -> 자신의 생성자() 호출된다.
		 */
		
		// Fruit() > Apple()
		Apple app=new Apple(); 
		/*
		 * 출력값
		 *  Fruit()...
			Apple()...
		 */
		
		System.out.println("--------------------------");
		
		// Fruit() > Apple() > PineApple()
		PineApple pine=new PineApple();
		
		
		
		
		
	}//main

}//class
