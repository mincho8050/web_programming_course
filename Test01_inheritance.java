package oop0603;


 // final class AA{} 클래스라면 종단클래스는 상속시킬 수 없다.


class AA{
	private void zero(){} //상속안됨.
	public void one(){
		System.out.println("one()...");
	}
	public void two(){
		System.out.println("two()...");
	}
}//aa

class BB extends AA{//부모클래스 AA
	                //자식클래스 BB
	public void three(){
		System.out.println("three()...");//부모클래스에서 상속받은것과 다르게 나만의 함수를 만들 수 있다.
	}
	
}//bb

class CC extends BB{
	public void four(){
		System.out.println("four()...");
	}
}//cc

class DD{}//dd

//class EE extends AA, DD{} > 에러 클래스는 ,로 연속으로 올 수 없다. 단일상속만 가능. 다중상속 불가.

public class Test01_inheritance {

	public static void main(String[] args) {
		/*
		 * 상속(inheritance)
		 * > 클래스의 재활용
		 * > 부모, 조상, super class
		 * > 자식, 파생, sub class
		 * 
		 * 형식) class 자식 extends 부모클래스{} 
		 */

		
		AA aa=new AA();
		aa.one();
		aa.two();
//		aa.zero(); > private속성은 클래스 내부에서만 접근가능. 상속불가.
		
		/*
		 * 출력값
		 * one()...
		   two()...
		 */
		              
		System.out.println("------------------------");
//---------------------------------------------------------------------------------------------------------
		
		BB bb=new BB();
		bb.three();
		bb.one(); //AA에서 상속받은 클래스
		bb.two(); //AA에서 상속받은 클래스
//		BB.zero(); private속성은 상속되지 않는다.
		
		/*
		 * 출력값
		 *  three()...
			one()...
			two()...
		 */
		
		System.out.println("------------------------");
//---------------------------------------------------------------------------------------------------------
		
		CC cc=new CC();
		cc.four();
		cc.three(); //BB에서 상속받은 것. > 부모
		cc.one(); //BB가 AA한테 상속받은것.  > AA는 조부모
		cc.two(); //BB가 AA한테 상속받은것.  > AA는 조부모
		
		
		/*
		 * 출력값
		 *  four()...
			three()...
			one()...
			two()...
		 */
		
		System.out.println("------------------------");
//---------------------------------------------------------------------------------------------------------

		
		
		
		
		
		
	}//main

}//class
