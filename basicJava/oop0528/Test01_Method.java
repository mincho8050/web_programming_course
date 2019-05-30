package oop0528;

public class Test01_Method {
	
	//public static void test(); //추상메소드 
	
	public static void test(){ //함수정의
		test(); //자신의 함수를 호출(재귀적 함수 호출)
		
	}//test
	
	public static long fact(int a){
		if(a==0){
			return 1;
		}else{
			return a*fact(a-1);
		}
	}//fact
	
	/*
	 * 재귀적 함수 관계 분석.
	 * 
	 * a=3   if(3==0) >아님
	 *       else return 3*fact(3-1); >함수를 계속 부르고 있어서 return을 못만남. , 3*살이있음
	 *                     a=2   if(2==0) >아님  
	 *                           else return 2*fact(2-1); > 2*살아있음
	 *                                       a=1   if(1==0) > 아님
	 *                                             else return 1*fact(1-1); >아직도 fact를 부르고 있음. 1*살아있음.
	 *                                                         a=0   if(0==0) > 맞음 값은 1
	 *   > 남아있는 값은 3* , 2* , 1* , 1 만 남아있다. 그래서 전체 값이 3*2*1*1 > 6                                                      
	 */
	
	public static void test2(){
		fact(4); //꼭 main에서만 함수를 부르는 것은 아니다. 위의 fact함수를 호출.
		/*main(); main() 함수는 사용자가 임의의 호출 불가능.
		 *  > 클래스가 실행될 때
		 *  > 자바 가상 머신(Java Virtual Machine)이 호출한다.
		 */
		
		/*
		 * 자바 클래스 (.class) 실행 순서
		 * 
		 * main()함수 호출 후 .class 실행
		 * ---------------------------------
		 * JVM > javaw.exe가 실행해줌.
		 * ---------------------------------
		 * 운영체제(Operating System) : Windows, Linux, MacOS
		 * 
		 * 자바 특징 : 플랫폼이 독립되어 있다. OS를 구분하지 않는다. 가상머신이 깔려있으면 클래스가 실행됨.
		 */
		
	}//test2
	

	public static void main(String[] args) { 
		// 재귀적 함수 호출
		// > 자신의 함수를 호출
		
		long result=fact(3);
		System.out.println(result);
		
		
		
		
		
		

		

	}//main

}//class
