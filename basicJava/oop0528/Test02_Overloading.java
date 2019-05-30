package oop0528;

public class Test02_Overloading {

	
	public static void print(int a){
		System.out.println(a);
	}//print
	
	
	public static void print(int a,int b){
		System.out.println(a);
		System.out.println(b);
	}//print
	
	public static void print(double a){
		System.out.println(a);
	}//print
	
	public static void print(double a, double b){
		System.out.println(a);
		System.out.println(b);
	}//print
	
	/*
	 * 에러
	 * > 메소드의 리턴형은 오버로딩의 대상이 아님. 
	 * > ex) 똑같은 함수명, 매개변수에 void 대신 int 를 쓰는건 오류. 
	 * > 매개변수를 다르게 해야 중복으로 함수명 사용가능.
	 * public static int print(int a){
		
	}
	*/
	
	
	
	public static void main(String[] args) {
		// 메소드 오버로딩 method overloading
		// 함수명 중복정의
		
		// 1) 매개변수의 갯수가 달라야 한다.
		// 하나주면 하나짜리 함수 찾아가고, 두개주면 두개짜리 함수를 찾아간다.
		print(3); 
		print(2,4);
		
		// 2) 매개변수의 자료형이 달라야 한다.
		print(5.6);
		print(2.1,4.0);
		
//------------------------------------------------------------------------------------------------------
		
		
	    System.out.println(Math.abs(3));     //int 형
	    System.out.println(Math.abs(5L));	 //long 형
	    System.out.println(Math.abs(1.2f));  //float 형
	    System.out.println(Math.abs(4.6d));  //double 형
		
		
		
		
		
		

	}//main

}//class
