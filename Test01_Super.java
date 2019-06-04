package oop0604;

class School{
	String name="학교";
	public School(){
		System.out.println("School()...");
	}//school
}//school class

class MiddleSchool extends School{
	
	String name="중학교";
	public MiddleSchool(){
		// 부모생성자함수를 호출하는 명령어 
		super(); // 생략가능.
		
		System.out.println("MiddleSchool()...");
	}
	
	
}//middleschool class

class HighSchool extends School{ //부모는 School , 자식이 HighSchool
	String name="고등학교";	//field 멤버변수 , class 내에서만 사용.
	public HighSchool() {
		
		super(); //생략가능
	}

	public void disp(){//method 멤버함수
		/*
		 * 아무것도 정의하지않으면 부모 것을 사용하지만
		 * 나의 것을 정의해도 부모것도 쓸 수 있다. 
		 * 옵션이 하나 추가된 느낌
		 */
		String name="종로고등학교"; // 지역변수, disp() 안에서만 사용가능.
						// 지역변수, 멤버변수(this) 부모변수 3개 사용가능.
						// 아무것도 지정안하면 내것이 가장 우선순위 높음
		System.out.println(name);	//지역변수 > 종로고등학교
		System.out.println(this.name);	//멤버변수 > 고등학교
		System.out.println(super.name);	//부모변수 > 학교
	}
	
	
}//highschool class


public class Test01_Super {

	public static void main(String[] args) {
		/*
		 * 부모, 조상	: super
		 * super	: 자식클래스에서 부모클래스 멤버변수에 접근할 때 
		 * super()	: 자식클래스의 생성자함수가 부모클래스의 생성자함수를 호출할 때
		 * this 	: 멤버변수(field)와 지역변수 구분하시 위해
		 * this() 	: 저신의 생성자 함수를 호출할 때
		 * 부모클래스 	: superclass
		 * 자식클래스	: subclass
		 * 
		 */
		
		// 상속관계에서 생성자함수 호출순서
		// 부모 > 자신
		// School() > MiddleSchool()
		MiddleSchool ms=new MiddleSchool();
		
		/*출력값
		 *  School()...
			MiddleSchool()...
			부모 > 자식 순으로 출력
		 */
		System.out.println(ms.name);  	//중학교
										//여기서는 재정의 했기 때문에 중학교출력
		
		
		System.out.println("---------------------------------");
//------------------------------------------------------------------------------------------------------------------------------------------
		
		
		
		HighSchool hs=new HighSchool();
		System.out.println(hs.name);	//재정의 하지 않아서 부모클래스의 name이 나옴.
		/*
		 * 재정의 하기전 출력값
		 *  School()...
			학교
			재정의 및 내용추가 한것이 없어 부모클래스인 School 값이 그대로 출력.
			
			재정의 후 값출력
			School()...
			고등학교
			
		 */
		hs.disp();
		
		/*
		 * 출력값
		 *  종로고등학교
			고등학교
			학교
		 */
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
