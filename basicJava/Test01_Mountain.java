package kr.co.singleton1;	


class Mountain{
	String name;	//산이름
	int height;		//산높이
	public Mountain(){}
}//mountain class

public class Test01_Mountain {

	public static void main(String[] args) {
		/*
		 * 일반 클래스
		 * 객체지향프로그램 Object Oriented Pro (OOP)
		 */
		
		//자료형 레퍼런스변수=객체
		//일반적인 클래스 형태
		Mountain one=new Mountain();	//객체 Object 를 one이라는 변수에 할당, 자료형은 Mountain
		Mountain two=new Mountain();
		
		//주소값이 서로 다름.
		System.out.println(one.hashCode());	//one이 가지고 있는 hashcode를 찍는거
		System.out.println(two.hashCode());	//two이 가지고 있는 hashcode를 찍는거
											//두개의 값은 새로운 곳에 할당했기 때문에 주소가 다르게 나와야 한다. 
											//근데 singleton은 같은 곳에 할당된다. 
		
		//서로 다른 객체이다!!!
		System.out.println(one);	
		System.out.println(two);	
		//이렇게 둘 다 찍어보면 서로 다른 객체이기때문에 값이 다르다.
		//new를 해서 둘다 새로 만들었기 때문이다.
		
		/*
		 * 출력값
		 *	366712642 -one
			1829164700 -two
			kr.co.singleton1.Mountain@15db9742	-one
			kr.co.singleton1.Mountain@6d06d69c	-two
		 */
		
		
		
		Mountain three=two;	//two가 가지고 있던 값을 three에 전달
		System.out.println(three.hashCode());	//two가 가지고 있는 값과 동일해야함
		System.out.println(three);	//two가 가지고 있는 값과 동일해야함
		
		/*
		 * 출력값(three)
		 * 	1829164700
			kr.co.singleton1.Mountain@6d06d69c
			two와 결과값이 같다.
		 */
		
		/*
		 * 싱글톤(singleton) 클래스
		 * > 클래스 객체 하나만 존재, 여러번 new해서 객체가 만들어지면 안된다.
		 * > 프로그램에서 단 하나의 객체만 만들게 해야 하는 경우 싱글톤
		 * > 자바는 생성자로 객체를 계속 만들 수 있으므로, 
		 * > 접근제한 private를 걸어주면 외부 클래스에서 접근 불가
		 * 
		 */
		
		
		
		
		
	}//main

}//class
