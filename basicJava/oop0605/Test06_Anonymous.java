package oop0605;

interface Imessage{
	public void msgPrint();
}//imessage

class Message implements Imessage{
	//인터페이스는 new 할 수 없어서.
	//자손을 만들고 써야 실행이 됨.
	//왜? {}가 없는 불완전상태니까!
	@Override
	public void msgPrint() {
		System.out.println("Message class");	
	}
}//class

public class Test06_Anonymous {

	public static void main(String[] args) {
		/*
		 * 익명 내부 클래스 Anonymous class 
		 * 				> 클래스 이름이 Anonymous class 가 아니라, 이름없는 것을 통칭해서 하는 말.
		 */

		
		//인터페이스는 객채생성 할 수 없다.
//		Imessage msg=new Imessage(); > 에러, 함수가 불완전하기때문이다.
		
		// 1) 구현클래스
		Message msg=new Message();
		msg.msgPrint();
		
		// 2) 다형성
		Imessage msg2=new Message();
		msg2.msgPrint();
		
		
		// 3) 익명클래스
		//		> 필요한 곳에서 일시적으로 실행
		//		> 이벤트가 발생할 때만 실행
		// 		> 안드로이드 자바, JavaScript, jQuery 에서 많이 활용
		
		Imessage mess=new Imessage(){
			@Override
			public void msgPrint() {
			System.out.println("Anonymous 익명 내부 클래스");	
			}
		};
		//클래스가 아닌데 new가 됨.
		
		
		mess.msgPrint();
		
		
		
		
		
		
	}//main

}//class
