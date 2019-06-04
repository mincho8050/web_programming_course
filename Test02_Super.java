package oop0604;

class Parent{
	int one;
	int two;
	public Parent(){}
	public Parent(int one, int two) {
		this.one = one;
		this.two = two;
	}
	
}//parent class

class Child extends Parent{
	int three; //물려받은 one, two를 그대로 쓰고 싶을 때 그냥 둔다. 여기에 다시 쓰면 재정의되기 때문이다.
	public Child(){
		//super(); 생략되어 있음
	}
	public Child(int a,int b,int c){
		super(a,b); //부모로부터 물려받은 멤버변수(field)에 초기값 전달.
		//super.one=a;
		//super.two=b;도 같은의미
		three=c;
	}
	
}//child class


public class Test02_Super {

	public static void main(String[] args) {
		/*
		 * 부모클래스 super
		 */
		
		Child child=new Child(10,20,30);
		System.out.println(child.one);		//10
		System.out.println(child.two);		//20
		System.out.println(child.three);	//30
		
		

	}//main

}//class
