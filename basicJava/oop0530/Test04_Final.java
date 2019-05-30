package oop0530;

/*
 * 1) final 클래스
 
final class Animal{ //final class Animal{}
	          //만약 class앞에 final을 붙이면 부모 클래스가 될 수 없어 에러.
	          //final 클래스를 종단 클래스
	
}//animal


class Elephant extends Animal{//extends는 Animal 한테 상속받을 때 씀. 상속관계
	                          //이렇게 쓰면 Animal에서 파생된 관계가 Elephant
                              //부모 클래스인 Animal이 final클래스 이기 때문에 에러.
                              //final클래스를 상속 받을 수 없다.
}

*/

// 2) final 메소드
class Fruit{
	void viwe(){}
	final void disp(){}
	
}//fruit

class Apple extends Fruit{ //Fruit가 종단클래스가 아니라 상속가능.
	@Override //< 재정의(리폼)
	void viwe() {}
	
	/* 에러
	 * final 메소드는 더이상 override 할 수 없다.
	@Override
	void disp(){}
	*/
	
}//apple




public class Test04_Final {

	public static void main(String[] args) {
		/*
		 * final
		 * 변수     : 변수의 상수화. 주로 static과 같이 사용한다.
		 * 클래스   : 누군가의 부모 클래스가 될 수 없다. 더 이상 파생시킬 수 없다. 
		 * 함수     : 더 이상 override(재정의)를 할 수 없다.
		 */

		//final 변수
		int a=3;
		System.out.println(a); //3
		a=5;
		System.out.println(a); //5
		
		final int b=2; //변수의 상수화
		System.out.println(b); //2
		//b=4; 에러
		//final은 변수를 상수화(절대변하지않는갓)를 시켜서 다시 대입시킬 수 없다.
		//final 변수는 새로운 값을 대입할 수 없다.
		//b++;도 에러.
		
		
		
	}//main

}//class
