package oop0603;

class Korea {  //extends Object 가 생략되어있다. 
	           //> 모든 클래스는 Object 클래스를 상속받아야 한다.
	           //> java.lang.Object
	String name="대한민국"; //private 상속안됨. 
	 					  //package 상속가능, 같은 패키지 안에서만 접근가능
						  //protected 상속가능.다른 패키지에서도 접근가능
	                      //public 상속가능 , basicJava 프로젝트 내에서 모두 접근 가능.
	
	final void view(){
		System.out.println("view()...");
	} //final함수 상속불가.
		void disp(){
			System.out.println("Korea..."+this.name);
		}

	
}//korea

class Seoul extends Korea{ //korea 랑 seoul은 부모자식관계.
	String name="서울특별시";
	
	@Override //< annotation(주석)
			  //< 재정의.
		void disp() {
			System.out.println("Seoul..."+this.name);
		}//리폼의 패턴.
	
/* void view(){} 
 * > 에러
 * > final method는 더이상 오버라이드 할 수 없다.
 * final class는 상속안됨.
 */
}//seoul

class Busan extends Korea{
		String name="부산광역시";

		@Override
		void disp() {
			System.out.println("Busan..."+this.name);
		}

		
		
}//busan

class Jeju extends Object{//extends Object 생략가능. 원래 모든 클래스의 부모

	@Override
	public String toString() {
		// return 형이 String 이니까.
		return "제주특별자치도";
	} 
	
}//jeju


class Suwon{//extends Object 생략가능
	
	private String id="webmaster";
	private String pw="1234";
	@Override
		public String toString() {
		  return "Suwon [id="+id+",pw="+pw+"]";
		}
	
}//suwon

class Incheon{
	
	private String id="soldesk";
	private String pw="5678";
	
	//toString 자동 추가
	//Source > Generate toString()...
	@Override
	public String toString() {
		return "Incheon [id=" + id + ", pw=" + pw + "]";
	}
	
	
}

public class Test02_Override {  //extends Object 생략. 

	public static void main(String[] args) {
		/*
		 * Method Override 함수의 재정의.
		 * > 상속관계에서 메소드를 다시 수정하는 것.(리폼)
		 * > Method Overload는 함수명 중복.(실제로는 다 개별함수.)
		 * 
		 * 오버라이드 할 때
		 * > ctrl+space 또는
		 * > Source->Override/Implements Methods...사용
		 */

		//클래스 레퍼런스변수=객체
		Korea ko=new Korea();
		System.out.println(ko.name);  	// 대한민국
		ko.view(); 					  	// view()...
		ko.disp();						// Korea...대한민국
		
		/*
		 * 자바의 기본 패키지 > java.lang
		 * 자바의 최고 조상 클래스 > Object 클래스(java.lang.Object)
		 * 자바의 모든 클래스는 생성할 때 
		 * 무조건 Object 클래스를 상속받는다.
		 * 자바의 모든 클래스는 Object의 후손이다.
		 * > Object 클래스 점검할 필요가 있다.
		 */
		
		System.out.println("--------------------");
//--------------------------------------------------------------------------------		
		
		//오버라이드 한 후.
		Seoul se=new Seoul();
		System.out.println(se.name);		// 서울특별시
		se.view();							// view()...
		se.disp();							// Seoul...서울특별시
		
		
		System.out.println("--------------------");
//--------------------------------------------------------------------------------		
		
		Busan bu=new Busan();
		System.out.println(bu.name);
		bu.view();
		bu.disp();
		//toString()오버라이드 하기 전
		//출력값 > oop0603.Busan@15db9742 
		// > 메모리할당을 했음(객체)
		System.out.println(bu.toString());
		
		
		System.out.println("--------------------");
//--------------------------------------------------------------------------------			
		
		// toString() 오버라이드 후
		Jeju je=new Jeju();
		System.out.println(je.toString());
		// 출력값 > 제주특별자치도(오버라이딩함.)
		// > 아무것도 하지 않으면 기본값나옴. ex) Busan에서처럼 oop0603.Busan@15db9742 이런값.
		
		System.out.println(je); // toString() 메소드명 생략 가능 > 그냥 object이름만 써도 나옴.
		
		
		
		System.out.println("--------------------");
//--------------------------------------------------------------------------------		
		
		// toString()은 private 변수값을
		// 리턴하는 용도로 주로 사용. (에러값을 잡기 위해.)
		Suwon su=new Suwon();
		System.out.println(su.toString());	//Suwon [id=webmaster,pw=1234]
		System.out.println(su);				//Suwon [id=webmaster,pw=1234]
		
		
		
		
		System.out.println("--------------------");
//--------------------------------------------------------------------------------		
		
		Incheon in=new Incheon();
		System.out.println(in.toString());	//Incheon [id=soldesk, pw=5678]
		System.out.println(in);				//Incheon [id=soldesk, pw=5678]
		
		
		
		
		
		
		
	}//main

}//class
