package oop0529;

//package class 라고 쓰면 에러. 생략가능.
class Sungjuk{// 클래스 명은 식별자와 같지만 무조건 첫글자는 대문자로 준다.
	          // 접근허용범위 Access Modifier
	          // > 접근지정, 접근제어, 접근수정
	          // > private      : 비공개
	          // > package      : 생략가능, 같은 폴더 내에서만 접근가능.
	          // > protected    : 다른 팩키지라도 상속관계에서는 접근 가능.
	          // > public       : 공개
	
	/*
	 * Sungjuk 클래스는 package가 생략되어 있으므로
	 * > oop0529 팩키지내에서만 접근 가능하다
	 */
	

	 // 멤버변수(field) 선언 : column, property 속성
	
	 String name; //접근허용범위 안쓰면 package
	public int kor,eng,mat;
	private int aver; //Sungjuk 클래스 내에서만 접근가능.
	
	// 멤버함수(method) 선언
	
	void calc(){ //접근제어 package 생략
		aver=(kor+eng+mat)/3;
	}//calc
	
	public void disp(){
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(mat);
		System.out.println(aver);
		
	}//disp
	
	
	
	
}//Sungjuk class





//-------------------------------------------------------------------------------------------------------------

public class Test01_Class {

	public static void main(String[] args) {
		/*
		 * class 클래스
		 * 
		 * C언어 : 구조체(struct) , 공용체(union)
		 *        > 변수로 구성되어 있다.
		 * JAVA : class
		 *        > 변수와 함수로 구성되어 있다.
		 * 
		 * 자바 클래스의 구성
		 * > 멤버변수(field) + 멤버함수(method)
		 * 
		 */
		
		
	/*	
		int a=3;  //정수형 a변수가 메모리 4byte 할당
		
		// 클래스는 메모리를 할당을 한 후 사용한다.
		// new 연산자 : 메모리할당 연산자
		// new를 하면 heap공간에 메모리 할당. 
		
		//new Sungjuk();    // 객체(Object) : 함수가 있으면 객체, 함수가 없으면 변수.
		                  //new 연산자를 이용해서 메모리 할당 함.
		
		
		// kim > #50(예시)번지를 참조하는 변수
		Sungjuk kim=new Sungjuk(); 
		
		// lee > #70(예시)번지를 참조하는 변수
		Sungjuk lee=new Sungjuk();
		
		// 객체의 주소값
		// 주소값 확인하는 hashCode
		System.out.println(kim.hashCode());
		System.out.println(lee.hashCode());
		
		
		int b=5;
		int c=b;
		
		Sungjuk park=lee;
		System.out.println(park.hashCode()); //lee.hashCode() 값과 같다. 
	*/
		              
//--------------------------------------------------------------------------------------------------------------------------
		
		Sungjuk kim=new Sungjuk();
		
		// .연산자를 이용해서 멤버에 접근한다.
		// .연산자로 접근한다. 일반변수와 다른점.
		kim.name="손흥민"; 
		kim.kor=95;
		kim.eng=70;
		kim.mat=55;
		//kim.aver=70; 에러. private 속성은 접근 불가. 
		System.out.println(kim.name);
		System.out.println(kim.kor);
		System.out.println(kim.eng);
		System.out.println(kim.mat);
		
		kim.calc(); //평균은 private속성이지만 평균값을 계산하는 calc함수는 package기 때문에 가져올 수 있음.
		kim.disp(); // 그 값이 다 들어있는 disp함수를 가져오면 
		           /*
		            * 츌력값
		            * 손흥민
						95
						70
						55
						73  > 평균값도 같이 나옴.
		            */
		
		
		
		Sungjuk lee=new Sungjuk();
		lee.name="박지성";
		lee.kor=100;
		lee.eng=85;
		lee.mat=70;
		
		lee.calc();
		lee.disp();
		
		
		

	}//main

}//class
