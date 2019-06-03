package oop0603;

public class Test03_Null {

	public static void main(String[] args) {
		/*
		 * null 값
		 * > 레퍼런스 변수를 선언만 해 놓은 상태.
		 * > 빈값
		 * true : 참 , false : 거짓
		 */

		String str=null; //빈값. 그냥 str 변수만 선언상태. 
		String name=""; //빈 문자열. 메모리를 잡는다.
		
		//NullPointerException 발생
//		System.out.println(str.length()); //데이터가 없기 때문에 글자갯수가 존재하지 않음
		
		System.out.println(name.length()); //출력값 0 나옴
		
		
		System.out.println("------------------------------");
//-------------------------------------------------------------------------		

		
		Integer inte1=null; //빈값. 선언만 함.
		Integer inte2=new Integer(0); //메모리를 잡고 메모리 안에 0을 할당. 주소를 받음.
		
		System.out.println(inte2.toString());	//0
		System.out.println(inte2);				//0
		
		
		Double dou=new Double(3.4);
		System.out.println(dou.toString());	//3.4
		System.out.println(dou);			//3.4
		
		
		
	}//main

}//class
