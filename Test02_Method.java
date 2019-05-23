package oop0523;

public class Test02_Method {
	
	public static void test3(int a){//여기서의 a를 매개변수(parameter)라고한다.
		                            //자료형과 같이 써줘야 한다. 안써주는것이 자바스크립트문법.
		System.out.println(a);
	}//test3
	
	public static void test4(int a,int b){//test3과 test4의 a변수는 다름. {}기준으로 지역변수 내에서만 사용가능하기 때문이다.
		System.out.println(a+","+b);
		return;//생략가능.
	}//test4
	
	public static void test5(double a,char b,String c){
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		return; //호출시점으로 되돌아간다
	}//test5
	

	public static void main(String[] args) {
		/*
		 * 메소드
		 * 매개변수(parameter)가 있는 경우
		 * > 전달값 argument value
		 */
		
        //메소드 호출
		
		//전달값이 1개 경우
		test3(5); //전달값 5,  자료형이 없으면 정수는 기본형이 int , 실수에서는 기본이 double  
		test3(7); //전달값 7
		test3(9);
		
		//전달값이 2개 이상인 경우
		test4(6,8); //,로 구분.
		test4(9,7);
		
		//전달값의 자료형이 다양한 경우
		test5(1.2,'R',"Korea");
		
		
		
	}//main

}//class
