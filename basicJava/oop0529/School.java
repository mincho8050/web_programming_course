package oop0529;

public class School { //public 으로 열어두면 프로젝트 basicJava 에선 모두 사용할 수 있음. 
	                  //public을 지우면 기본이 package이기 때문에 package oop0529안에서만 사용 가능.
	
	// 멤버변수 field
	private String name;
	private int kor,eng,mat;
	private int aver;
	
	/*
	 * 생성자함수 constructor
	 * > 클래스명과 동일한 함수
	 * > 기본생성자(default constructor) : 매개변수가 없다. 
	 * 
	 * > 기본생성자 함수는 자동 코딩
	 * > 대부분 기본생성자함수는 필요가 없어도 수동으로 public School(){} 이런식으로 써놓음.
	 * > (단, 기본생성자함수는 생성자 함수가 오버로딩이 되면 자동추가되지 않는다.
	 * 		  강제적으로 선언하는 것을 강추!)
	 */
	

	public School(){
		System.out.println("School()객체 생섬됨...");
	}//School
	
	//생성자함수는 리턴형이 존재하지 않는다(주의)
	//public void School(){}  > 가능

	
	 // 생성자 함수도 오버로딩(overloading)이 가능하다.
	 // 생성자 함수가 많은게 좋다. 할일이 줄어들기 때문에.
	public School(String n){
		name=n;
	}//school
	
	public School(int k,int e,int m){
		kor=k;
		eng=e;
		mat=m;
	}//
	
	public School(String n,int k,int e,int m){
		name=n;
		kor=k;
		eng=e;
		mat=m;
	}//
	
	// 멤버함수 method
	public void init(String n,int k,int e,int m){
		name=n;
		kor=k;
		eng=e;
		mat=m;
	}//init
	
	public void calc(){
		aver=(kor+eng+mat)/3;
	}//calc
	
	public void disp(){
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(mat);
		System.out.println(aver);
		
	}//disp

}//school
