package oop0604;

class Father extends Object{ //extends Object 생략가능
	
	public String name="아버지";
	public String addr="주소";
	
	public Father() {} //기본생성자함수
	
	public Father(String name, String addr) {
//		super(); 생략가능
		this.name = name;
		this.addr = addr;
	}
	
	public void disp(){
		System.out.println(this.name);
		System.out.println(this.addr);
	}
	
	
}//father class

class Son extends Father{
	//name,addr 살아있음
	public Son(){}
	public Son(String n,String a){
		super.name=n; //부모한테서 물려받은 거니까 super 사용.
		super.addr=a;
	}
}//son class

class Daugther extends Father{
	//name,addr 살아있음
	String friend="절친"; //멤버변수가 추가되었지만 부모가 물려준게 아니라 형변환이 되지 않는다.
							// > 클래스에 새로 추가된 애들은 다형성의 대상이 아니다.
	public Daugther(){}
	public Daugther(String name,String addr){
		super(name,addr);
		//부모로 부터 물려받은 name, addr 사용 > super 사용
	}
	
}//daugther class

public class Test03_Polymorphism {

	public static void main(String[] args) {
		/*
		 * Polymorphism 다형
		 * 상속관계에서의 다형성 (형태가 다향함.)
		 * 보무클래스 입장에서 형태가 여러가지.
		 * 클래스들간의 형변환을 위해서 필요함.
		 */
		
		// 1) 일반적인 방식의 객체 생성
		//		> new 연산자를 사용
		//		> POJO(Plain Old Java Object)방식
		Father f=new Father();
		f.disp();
		
		Son s=new Son("손흥민","영국");
		s.disp();
		
		Daugther d=new Daugther("김연아","캐나다");
		d.disp();
		/*
		 * 출력값
		 *  아버지
			주소
			손흥민
			영국
			김연아
			캐나다

		 */
		
		System.out.println("------------------------------");
//------------------------------------------------------------------------------------------------------------		
		
		
		// 2) 다형성을 이용한 객체를 생성
		//		> 자식클래스가 부모클래스에 대입 가능하다.
		//		> 자식클래스의 모양으로 부모클래스가 형태를 변경한다.
		//		> 가장 일반적인 다형성
		Father fa=new Son("개나리","관철동");
		fa.disp();
		/*
		 * 출력값
		 * 	개나리
			관철동
		 */
		fa=new Daugther("진달래","인사동");
		fa.disp();
		/*
		 * 	진달래
			인사동
		 */
		System.out.println(fa.name);
		System.out.println(fa.addr);
		//자식클래스에 추가된 멤버는 다형성의 대상이 아니다.
//		System.out.println(fa.friend); 에러
		/*
		 * 	진달래
			인사동
		 */
		
		
		System.out.println("------------------------------");
//------------------------------------------------------------------------------------------------------------	
		
		
		
		// 부모클래스도 자식클래스에 대입 가능하다.
		//	> (단, 자식클래스의 모양으로 변환해야 한다. > 선행조건)
		//	> 자주 쓰이지는 않는다.
		
		Father fa2=new Father();
		Son son2=new Son();
		Daugther daugh2=new Daugther();
		
		fa2=son2;	// 다형성 , 자식 > 부모에 대입
		son2=(Son) fa2;	//  son2=fa2; 에러, 부모 > 자식에 대입
						// 자식클래스 모양으로 변환해야 한다. son2=(Son) fa2;
		
		//Exception 발생
		daugh2=(Daugther) fa2;
		
		
		
		System.out.println("------------------------------");
//------------------------------------------------------------------------------------------------------------	
		
		// 모든 자바 클래스의 최고 조상 : Object
		// 자바의 모든 클래스느느 Object 클래스의 후손이다.
		// 자바의 모든 클래스는 Object 클래스에 대입가능하다.(다형성)
		
		Object inte=new Integer(3); // 다형성
		Object fa3=new Father(); // 다형성
		
		
		
		
		
		
		
		
	}//main

}//class
