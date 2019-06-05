package oop0605;

interface Parent{ //interface는 추상메소드만 올 수 있다.
	
	// void disp();{} > 에러, 일반메소드 사용불가
	
	abstract void kind();	//추상메소드
	void breathe();			//interface자체는 추상메소드만 올 수 있기 때문에
							//abstract를 생략 가능.
}//interface 

class Son implements Parent{	// 구현 
								// 클래스 입장에서 부모가 인터페이스
	@Override
	public void kind() {
		System.out.println("아들");
	}
@Override
	public void breathe() {	
	System.out.println("허파 숨쉬기 1");
	}
}//son class


class Daughter implements Parent{	// 구현
	@Override
	public void kind() {
		System.out.println("딸");
	}
	@Override
	public void breathe() {
		System.out.println("허파 숨쉬기 2");
	}
}//daughter

public class Test03_Interface {

	public static void main(String[] args) {
		/*
		 * 인터페이스 Interface
		 * 	> 추상메소드만 구성되어 있다. (일반메소드와 추상메소드가 섞여있으면 추상클래스)
		 * 	> 추상클래스보다 더 추상화 되어있다.
		 * 클래스 입장에서 부모가 클래스 : extends 확장
		 * 				부모가 인터페이스 : implements 구현
		 */

		// 인터페이스 자신으로 직접 객체 생성 불가.
//		Parent parent=new Parent();
		
		Son son=new Son();
		son.kind();
		son.breathe();
		/*출력값
		 아들
		 허파 숨쉬기 1
		 */
		
		Daughter daug=new Daughter();
		daug.kind();
		daug.breathe();
		/*출력값
		 딸
		 허파 숨쉬기 2
		 */
		
		System.out.println("--------------------------------------");
//-------------------------------------------------------------------------------------------------------		
		
		// 인터페이스에서의 다형성
		// > 다형성은 인터페이스에서 더 잘된다.
		Parent parent=new Son();
		parent.kind();
		parent.breathe();
		/*
		 * 출력값
		 아들
		 허파 숨쉬기 1
		 */
		
		parent=new Daughter();
		parent.kind();
		parent.breathe();
		/*
		 * 출력값
		 딸
		 허파 숨쉬기 2
		 */
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
