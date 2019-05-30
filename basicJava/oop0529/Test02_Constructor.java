package oop0529;

public class Test02_Constructor {

	public static void main(String[] args) {
		/*
		 * 생성자 함수(constructor)
		 * > new 연산자와 함께 메모리를 할당하는 경우 호출.
		 * > 생성자 함수는 클래스명과 동일한 함수.
		 * 
		 * 소멸자 함수(destructor)  : 자바에는 없음
		 * 
		 * 가비지 콜렉팅(Garbage Collecting)
		 * > 자바가상머신(JVM)은 가비지 콜렉터라는
		 * > 인스턴스 자동 해제(메모리 반환) 시스템을
		 * > 가동시켜 필요한 메모리를 관리한다.
		 */
		
		//여기서 one이 참조변수(reference 변수)
		//School() : 생성자함수 (클래스명과 동일해야함)
		School one=new School(); 
		one.init("김연아", 90, 85, 95);
		one.calc();
		one.disp();
		
		School two=new School("무궁화");
		two.disp();
		
		School three=new School(10, 15, 20);
		three.disp();
		
		School four=new School("라일락", 50, 60, 70);
		four.disp();

		
		
		
	}//main

}//class
