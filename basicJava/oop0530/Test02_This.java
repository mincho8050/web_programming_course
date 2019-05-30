package oop0530;


class Sungjuk{
	private String name;
	private int kor,eng,mat;
	private int aver;
	
	public Sungjuk(){
		//생성자 함수가 생성자 함수를 호출할 수 있다.
		//Sungjuk("손흥민"); > 이렇게 부르면 에러.
		this("손흥민"); //이렇게 불러야 에러가 안남. 
	}//sungjuk > 매개변수가 없는 생성자함수는 default constructor > 이거 안적어도 되고 edit가면 자동생성
	

	public Sungjuk(String name){
		this.name=name; //여기서 this.name은 매개변수 name, 여기에 위에서 private name한 것을 대입.
	}
	
	public Sungjuk(int kor,int eng,int mat){
		this(); //생성자 함수가 자신의 생성자 함수를 호출할 수 있다. 
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
	}
	
	public Sungjuk(int aver){
		this(10,20,30); //첫줄. 여기에 적으면 에러아님
		this.aver=aver;
	  //this(10,20,30); > 에러, 생성자 함수를 호출하려 할때는 첫줄에서 한다.
		disp(); //생성자 함수에서는 일반함수 호출 가능.
	}
	
	public void disp(){
		//this(85); > 에러, 일반함수에서는 this를 사용할 수 없다. (생성자함수 호출 불가능)
	}//disp
	
}//Sungjuk


public class Test02_This {

	public static void main(String[] args) {
		/*
		 * this()
		 * > 생성자함수가 생성자함수를 호출할 때
		 */

		
		
		
		
	}//main

}//class
