package oop0529;

class Jumsu{ //package생략
	         //oop0529 패키지 내에서만 접근.
	
	private String name="손흥민"; //멤버변수
	private int kor,eng,mat;
	private int aver;

	public Jumsu(){}  //default constructor 생성자함수.
	public Jumsu(String name,int kor,int eng,int mat){
		this.name=name; //멤버변수와 지역변수를 구분하기 위해 this를 붙인다.
						//멤버변수에 지역변수를 대입.
		this.kor=kor; 
		this.eng=eng; 
		this.mat=mat;
		this.aver=(kor+eng+mat)/3;
	}                   
	
	public void disp(){
		String name="박지성"; //지역변수
		System.out.println(name); //아무것도 지정하지 않으면 일반 지역변수가 우선.
		                          //this로 구분한다.
		System.out.println(this.name); //this를 붙이면 멤버변수를 가리킨다.
		                               //같은지역내에 변수이름이 같으면 헷갈리니까 this를 붙인다.
		System.out.println(this.kor);
		System.out.println(this.eng);
		System.out.println(this.mat);
		System.out.println(this.aver);
	}//disp
	
	
	
}//jumsu


public class Test03_This {

	public static void main(String[] args) {
		/*
		 * this   : 자신의 클래스 멤버를 가리킴
		 *          일반변수와 멤버변수를 구분하기 위함
		 * this() : 생성자 함수간의 호출
		 * 
		 */

		Jumsu one=new Jumsu();
		one.disp();
		
		Jumsu two=new Jumsu("차범근", 55, 65, 75);
		two.disp();
		
		
		
		
		
		
		
		
	}//main

}//class
