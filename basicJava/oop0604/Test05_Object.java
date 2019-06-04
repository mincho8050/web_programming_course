package oop0604;

class Screen{
	public String getData(){
		return "";
	}
}//screen

class TypeA extends Screen{

	@Override
	public String getData() {
		return "기생충";
	}
	
}//typea

class TypeB extends Screen{

	@Override
	public String getData() {

		return "어벤져스";
	}
	
}//typeb

class Picture{
	/*
	 * 1) Method Overloading
	public static void dispStar(TypeA ta){
		System.out.println(ta.getData());
	}
	public static void dispStar(TypeB tb){
		System.out.println(tb.getData());
	}
	*/
	
	/* 2) 다형성
	
	public static void dispStar(Screen scr){
		System.out.println(scr.getData());
	}
	
	*/
	
	// 3) 다형성
	public static void dispStar(Object obj){
		Screen scr=(Screen) obj; //형변환
		System.out.println(scr.getData());
		
	}
	
	
	
	
}//picture

public class Test05_Object {

	public static void main(String[] args) {
		/*
		 * Object 클래스 : 자바의 최상위 클래스
		 */

		
		// 1) 다형성
		Screen scr=new TypeA();
		System.out.println(scr.getData()); //기생충
		
		scr=new TypeB();
		System.out.println(scr.getData()); //어벤져스
		
		
		System.out.println("------------------------------");
//----------------------------------------------------------------------------------------		
		
		
		
		
		TypeA ta=new TypeA();
		TypeB tb=new TypeB();
		
		Picture.dispStar(ta);	//기생충
		Picture.dispStar(tb);	//어벤져스
		
		
		
		
		
		
		
		
	}//main

}//class
