package oop0523;

public class Test01_Method {
	
	//함수를 작성하는 영역
	
	//void 는 리턴값이 없다는 의미.
	public static void test1(){//함수정의
		System.out.println("JAVA");
		//test1(함수명) 함수의 기능은
		//콘솔창에 JAVA 를 띄우는 것.
		//호출해야 실행 가능. 
		//이게 가장 기본형태
	}//test1
	
	//함수는 식별자가 겹쳐도 괜찮다. 
	public static void test2(){
		System.out.println("SEOUL");
		return;//호출한 곳으로 되돌아 가는 명령어.
		      //맨마지막에는 return은 생략가능. 왜냐면 어차피 처음으로 돌아가니까. 중간에 return 사용가능.
	}//test2
	

	public static void main(String[] args) {//메인함수
		                                    //함수안에 하면 안됨.
		                                  
		// 함수 ★★★★★
		// > 특별한 기능을 가지고 있음
		// > methood, function, procedure
		// > 형식 : 리턴형 함수명()
		// > maker가 제공하는 함수도 있고 
		// > 사용자가 정의(user defined)할 수도 있다.
		// 식별자 : 프로젝트명 : basicJava
		//         패키지명 : oop0523
		//         클래스명 : Test01_Methood
		//         변수명
		//         함수
		// > 만들었는데 호출 안하면 정상, 호출했는데 없으면 에러.
		
		/*
		 * 함수를 작성 시 고려사항
		 * > 매개변수(parameter,전달값)가 있는지?
		 * > return 값이 있는지?
		 * > 함수 정의(작성)를 하고 호출해야 사용할 수 있다.
		 * 
		 * [교재]
		 * > 자체교재 - chapter09 멤버함수
		 * > 교학사 - 5장의 5.5 메소드
		 * 
		 */
		

		//함수 안에 함수를 작성할 수 없지만 호출할 수 있다.
		//test1인 함수명만 쓰면 그냥 변수다.
		//test1() 함수호출.
		test1();
		test1();
		
		test2();
		test1();
		test2();
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
