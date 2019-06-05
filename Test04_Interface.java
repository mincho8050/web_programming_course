package oop0605;

interface Icalc{		// 산술연산 + - * / %
	public int add();
	public int sub();
	public int mul();
	public int div();
	public int mod();
}//icalc

class Calclmp implements Icalc{
	private int x,y;
	
	public Calclmp(){}
	public Calclmp(int x,int y){
		this.x=x;
		this.y=y;
	}

	@Override
	public int add() {
		return x+y;
	}

	@Override
	public int sub() {
		return x-y;
	}

	@Override
	public int mul() {
		return x*y;
	}

	@Override
	public int div() {
		return x/y;
	}

	@Override
	public int mod() {
		return x%y;
	}
	
}//calclmp

public class Test04_Interface {

	public static void main(String[] args) {
		/*
		 * 인터페이스를 활용해서
		 * 개발 프로젝트에서 발생하는 여러 페이지들을
		 * 표준화, 구조화 할 수도 있다.
		 */

		//다형성
		Icalc calc=new Calclmp(5,3);
		System.out.println(calc.add());
		System.out.println(calc.sub());
		System.out.println(calc.mul());
		System.out.println(calc.div());
		System.out.println(calc.mod());
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
