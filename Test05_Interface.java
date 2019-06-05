package oop0605;


class Unit{
	int currentHP;	//유닛의 체력
	int x,y;		//유닛의 x,y좌표
}//unit class

interface Movable{
	void move(int x,int y);
}//movable interface

interface Attackable{
	void attack(Unit u);
}//attackable interface

//인터페이스가 인터페이스를 상속받을때는 extends (클래스가 클래스를 상속받을때도.)
//클래스가 인터페이스를 상속받을때는 implement 
interface Fightable extends Movable,Attackable{
							//인터페이스는 다중상속이 가능하다.
							//클래스간에는 단일상속만 가능하다.
	
}//fightable

class Fight extends Unit implements Fightable{

	@Override
	public void attack(Unit u) {
	}

	@Override
	public void move(int x, int y) {
	}
	
}//fight 

public class Test05_Interface {

	public static void main(String[] args) {
		/*
		 * 클래스와 인터페이스간의 상속 및 구현
		 */


		
		
	}//main

}//class
