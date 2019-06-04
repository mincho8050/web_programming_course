package oop0604;

class Print{
	/*
	 * static : 클래스명으로 직접접근 가능.
	 * 클래스명.멤버변수
	 * 클래스명.멤버함수()
	 * method overloading : 매개변수의 자료형과 갯수로 구분.(함수이름이같아도됨)
	 */
/*	public static void view(Integer a){
		System.out.println(a.toString());
	}
	public static void view(Double a){
		System.out.println(a.toString());
	}
	public static void view(String a){
		System.out.println(a.toString());
	}
	//이렇게 해도 틀린건 아님
	*/
	
	public static void view(Object obj){
		System.out.println(obj.toString());
	}
	
	public static Integer disp1(){
		return new Integer(3);
	}
	
	public static Double disp2(){
		return 5.6; //이렇게 해도 autoboxing 됨.
	}
	
	public static Object disp3(){
		return new Integer(9); //틀린문법 아님.
	}
	
	public static Object disp4(){
		return new Double(9);
	}
		
	public static Object disp5(){
		return "Happy";
	}
	
}//print class

public class Test04_Object {

	public static void main(String[] args) {
		/*
		 * Object 클래스
		 * 자바 클래스의 최고 조상 : Object
		 * 자바의 모든 클래스는 Object 클래스의 후손이다.
		 * 자바의 모든 클래스는 Object 클래스에 대입 가능하다.
		 */

		
		// 가장 일반적인 형태
		Integer inte=new Integer(3); 
		System.out.println(inte);				// "3"
		System.out.println(inte.toString()); 	// "3" 같은 의미.
		
		
		String str=new String("HAPPY");
		System.out.println(str);			//"HAPPY"
		System.out.println(str.toString());	//"HAPPY"
		
		
		System.out.println("----------------------------");
//------------------------------------------------------------------------------------------
		
		// 다형성
		Object obj=new Integer(5);	// 5
		System.out.println(obj);
		
		obj=new String("Soldesk");
		System.out.println(obj); 	// Soldesk
		
		obj=new Double(3.4);
		System.out.println(obj); 	// 3.4
		
		
		Double dou=(Double) obj;	// Double dou=obj; 하면 에러
									// Object는 조상이기 때문에 형변환 후 대입. > Double dou=(Double) obj;
		System.out.println(dou);	// 3.4
		
		
		
		System.out.println("----------------------------");
//------------------------------------------------------------------------------------------
		
		
		// 메소드와 관련된 Object 클래스
		
		// 1) 매개변수가 Object 클래스
		//	> Object 클래스에 들어갈 수 있다. 후손들이라서.
		//	> Object 하나로 받아도 됨.
		Print.view(new Integer(3));
		Print.view(new Double(5.6));
		Print.view(new String("Happy"));
		Print.view(new Father());
		
		// autoboxing
		// > 기본형값이 전달되면 참조형으로 자동으로 변환된다.
		Print.view(7);
		Print.view(8.9);
		
		
		
		// 2) 메소드의 리턴형이 Object 클래스
		Integer a=Print.disp1();
		System.out.println(a); //3
		
		Double b=Print.disp2();
		System.out.println(b); //5.6
		
		
		Object obj2=Print.disp3();
		System.out.println(obj.toString()); //3.4
		
		Double c=(Double) Print.disp4(); //부모가 자식한테 들어갈땐 형변환.
		System.out.println(c);			//9.0
		
		String d=(String) Print.disp5(); //부모가 자식한테 들어갈땐 형변환.
		System.out.println(d);			//Happy
		
		
		
		
		
	}//main

}//class
