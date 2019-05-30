package oop0530;

class Sawon{
	String sabun; //사원번호
	String name;
	int pay;      //급여
	int sudang;   //수당
	
	Sawon(){}
	Sawon(String sabun,String name,int pay){
		this.sabun=sabun;
		this.name=name;
		this.pay=pay;
	}
	
	//static 변수
	static String COMPANY="(주)솔데스크"; //static변수는 일반적으로 일반변수와 구별하기위해 기울어져있고, 주로 대문자를 사용.
	static int Sudang=10;
	static double TAX=0.03;
	
	//static 함수
	static void line(){
		System.out.println("--------------------------------------");
	}
	
}//sawon

public class Test03_Static {

	public static void main(String[] args) {
		/*
		 * static
		 * > 변수, 함수
		 * > 정적변수, 정적함수
		 * > 메모리 생성도 1번, 소멸도 1번
		 * > new 연산자를 이용해서 별도의 객체생성 없이 사용 가능하다.
		 */

		Sawon one=new Sawon("1001","손흥민",100);
		//총 지급액:(급여*세금)+수당
		int total=(int)(one.pay-one.pay*one.TAX)+one.Sudang;
		
		//출력
		System.out.println(one.COMPANY);
		System.out.println("사원번호:"+one.sabun); //출력값 1001
		System.out.println("이름:"+one.name); //출력값 손흥민
		System.out.println("총 지급액:"+total);//출력값 107
		one.line();
		
//---------------------------------------------------------------------------------------------------------------------------------
		
		
		/*
		 * 2) static 특징을 적용한 경우
		 *  > static 변수와 함수는 이미 static 메모리에
		 *  > 값이 상주해 있기 때문에 별도의 객체생성을
		 *  > 하지 않고도 직접 접근할 수 있다.
		 *  
		 *  > static 접근 방법 : 클래스명.static변수
		 *                     클래스명.static함수()
		 */
		Sawon two=new Sawon("1002","박지성",200);
		//총 지급액:(급여*세금)+수당
		int total2=(int)(two.pay-two.pay*Sawon.TAX)+Sawon.Sudang;
		
		//출력
		System.out.println(Sawon.COMPANY);
		System.out.println("사원번호:"+two.sabun); //출력값 1001
		System.out.println("이름:"+two.name); //출력값 손흥민
		System.out.println("총 지급액:"+total2);//출력값 107
		Sawon.line();
		
//--------------------------------------------------------------------------------------------------------------------------------
		
		// static 변수의 연산
		Sawon kim=new Sawon("1003","개나리",200);
		Sawon lee=new Sawon("1004","진달래",300);
		
		System.out.println(kim.Sudang);
		System.out.println(lee.Sudang);
		
		kim.Sudang=kim.Sudang+1; //출력값 11
		System.out.println(kim.Sudang);
		
		lee.Sudang=lee.Sudang+1; //출력값 12
		System.out.println(lee.Sudang);		
		
		System.out.println(kim.Sudang); //출력값 12
		
		Sawon.Sudang=Sawon.Sudang+1;
		System.out.println(Sawon.Sudang); //출력값 13
		
		System.out.println(lee.Sudang);		//출력값 13
		System.out.println(kim.Sudang);		//출력값 13
		
		//하나의 프로젝트에서 특정 값을 공유할 때 static을 사용.
		//지금 공유되어서 값이 누적된 것임.
		
		Sawon.line();
		
//---------------------------------------------------------------------------------------------------------------------------------------------		
		
		System.out.println(Math.PI); //static변수 출력값 > 파이값
		System.out.println(Math.abs(-3));//static함수
		
		System.out.println(Integer.parseInt("5"));
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
