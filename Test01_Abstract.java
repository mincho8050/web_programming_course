package oop0605;

abstract class Animal{ 	//추상메소드가 1개 있으니까 일반클래스가 아니라
						//추상클래스 > abstract를 붙여준다.
						
	String name;
	void view(){}	//일반메소드
	abstract void disp();	//{}가 없음 메소드가 불완전. 추상메소드.
							//void disp(); 하면 불완전해서 에러뜸
							//abstract void disp(); 해야 추상메소드의 형태.
}//animal class

/*
 * 추상클래스는 누군가의 부모역할만 한다.(extends)
 * 추상클래스를 상속받은 자식클래스는 
 * 반드시 추상메소드를 완성해야 한다. (override)
 */


class Elephant extends Animal{ 	// 추상클래스도 상속 가능
								// 추상클래스는 부모역할만 하고 자식이 가져다 변형해서 사용한다.
								// 추상클래스는 확장시킬 때 사용
	@Override
	void disp() {
		System.out.println("점보...");
	}
	
}//elephant class

class Tuna extends Animal{
	@Override
	void disp() {
		System.out.println("니모...");
	}
	
}//tuna class




public class Test01_Abstract {

	public static void main(String[] args) {
		/*
		 * 추상클래스 abstract class
		 * 추상클래스는 객체를 생성할 수 없다.
		 * > 직접 new연산자를 사용할 수 없다.
		 * > 추상클래스 : 일반메소드+추상메소드 (추상클래스는 일반메소드와 추상메소드를 같이 선언가능) > 불완전한 클래스
		 * 				추상메소드가 1개 이상이 있어야 추상화 시킴. 
		 * 				일반메소드만 있어도 추상클래스 설계는 되지만 굳이 그렇게 하지 않음.
		 * 
		 * 추상메소드 
		 * 	> 메소드의 body{}가 없음.
		 * 	   메소드의 머릿말만 존재. > 하는 기능이 없음
		 * 	> 형식 : 리턴형 함수명(); > 바디가 없다는건 불완전함. > 불완전한 함수
		 * 
		 * 인터페이스 : 추상메소드 만 선언 가능하다. > 활용도가 더 높음.
		 */

		
		// 추상클래스는 new연산자로 객체생성 할 수 없다.
//		Animal ani=new Animal();	> 에러
		
		
		Elephant jumbo=new Elephant();
		jumbo.disp();	//점보...
		
		Tuna nimo=new Tuna();
		nimo.disp();	//니모...
		
		
		System.out.println("--------------------------------");
//-------------------------------------------------------------------------------------------------------		
		
		// 추상클래스의 다형성
		Animal ani=new Elephant(); //이게 더 잘됨
		ani.disp();//점보...
		/*
		 * Animal 에는 disp(); 불완전한 함수가 있는데
		 * 자식클래스 Elephant 에서는 disp();를 무조건 오버라이드 하게 되어있어서
		 * 모양이 비슷해 다형성이 더 잘됨.
		 * 추상클래스는 이렇게 쓰기위해서 함.
		 */
		ani=new Tuna();
		ani.disp(); //니모...
		
		
		
		
		
		
		
	}//main

}//class
