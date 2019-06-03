package oop0603;

public class Test04_CallBy {
	
	public static void test1(int a,int b){}

	public static void test2(int[] su){}

	public static void test3(Integer a){}
	

	public static void main(String[] args) {
		/*
		 * 메소드 호출 방식
		 * > Call By Value
		 * > Call By Reference
		 * 
		 * 함수명 작성 시 고려사항
		 * > is~~~   : 맞고,틀리다. 대부분 return 값이 boolean형
		 * > to~~~   : 
		 * > get~~~  : 주고 받기. 대부분 return값이 있음.
		 * > set~~~  : 대부분 주고 끝나서 return 값 없음. 대부분 void
		 */

		int[] su={10,15,20};
		
		// 값에 의한 호출방식
		// Call By Value
		test1(su[0],su[2]);  //10,20
		          
		// 참에 의한 호출방식
		// Call By Reference
		// 주소값. 객체나 클래스
		test2(su);
		
		// Call By Reference
		test3(new Integer(5));
		
		
		
		
		
	}//main

}//class
