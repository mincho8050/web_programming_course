package kr.co.singleton1;

//싱글톤 클래스 설계하기
public class Singleton {

	/*void disp(){int a}//여기서 a는 지역변수, 메모리가 나오면 없어지고 다시 생기고. stack에 저장 reset
	static int b; //한번 만들어지면 또 안만들어짐 있는거 끌어다씀. 연산이 계속 이어짐.
				  // 주소값 공유, 연산을 하게되면 계속 이어짐.
	
	 * 메모리는 크게 3가지
	 * new는 heap 공간
	 * 일반적인 변수는 stack
	 * 나머진 static 한번 만들어지면 두번다시 안만들어짐. 같이 씀.
	 */
	
	//1)외부에서 생성자 함수를 호출할 수 없다. 
	//>하지만 객체를 단 하나는 생성할 수 있다.
	private Singleton(){}	//생성자함수 . package 생략.
							//private로 해놓으면 내부에서만 사용가능해서 객체생성 불가.
	
	//2) private으로 선언되어 있어도 내부 클래스에서는 생성자 호출이 가능하다는 것을 이용한다.
	// > 클래스에 고정되어 정적 필드로 자기 자신의 객체를 생성하였는데
	// > 여기에도 private를 붙여서 외부클래스의 접근을 막는다.
	private static Singleton single=new Singleton();	//자신이 자신이 부른거>에러아님.
														//static 공간에 잡음. new를 여러번 못함. 
	
	//3)이 객체를(위에서 private로 만든 single) 외부에서 접근할 수 있게 메소드를 만들어 줘야 한다.
	// > 이것이 외부에서 이 객체를 얻는 유일한 방법이다.
	static Singleton getSingle(){
		return single;
	}//직접적으로 new를 안하고 메소드를 통해서 하는것.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class
