package oop0529;

import java.lang.*; //java.lang(자바의 기본 패키지)안에 있는 모든 클래스에 접근한다는 것.
                    //생략가능

public class Test05_Class {

	public static void main(String[] args) {
		
		// 기본 클래스  : 주로 java.lang 패키지에 있음

//-----------------------------------------------------------------------------------------------------------------------------------------
		
		//Math 클래스
		System.out.println(Math.E);  //원주율
		System.out.println(Math.PI); //파이
		
//-----------------------------------------------------------------------------------------------------------------------------------------		
	
		//Integer 클래스
		Integer a=new Integer(5);
		Integer b=new Integer("7");
		
		System.out.println(a.toString());   //toString의 리턴값이 String이기 떄문에 > "5"
		System.out.println(b.intValue());   //intValue의 리턴값이 int기 떄문에 > 7
		                                    //결국 둘 다 형변환 시킨것.
		
		
		int c=3; //기본형
		//정수형이 3개 있지만 new로 잡은건 참조형, int로 잡은건 기본형. 
		
		/*
		 * 문자열 안에 있는 숫자기호를 정수형으로 변환
		 * Integer.parseInt();
		 * "4" > 4 (String 값을 정수형으로)
		 * 많이 쓰는 함수니까 암기.
		 * 
		 */
		System.out.println(Integer.parseInt("4")); //출력값은 정수형 4
		System.out.println("2"+"6"); //출력값은 String 이기 때문에 26
		System.out.println(Integer.parseInt("2")+Integer.parseInt("6")); //정수형으로 바뀌어서 2+6 > 8

//	    NumberFormatException 발생
//		System.out.println(Integer.parseInt("soldesk"));	//숫자형태의 글자가 아니라 오류 나옴.
//		System.out.println(Integer.parseInt(" 7 "));       // 공백도 글자로 취급해서 오류나옴
		
//-----------------------------------------------------------------------------------------------------------------------------------------		
		
		// String 클래스
		
		String name=new String("HAPPY"); //참조형
		String str="HAPPY"; //기본형

		if(name==str){
			System.out.println("같다");
		}else{
			System.out.println("다르다");
		}//출력값 : 다르다.
		
		/*
		 * 문자열의 내용을 비교하는 경우
		 * 같다 연산자(==)를 사용하지 말고
		 * equals()함수를 사용할 것.
		 */
		if(name.equals(str)){
			System.out.println("같다");
		}else{
			System.out.println("다르다");
		}//출력값 : 같다
		
		
		
		
		
		
		
		
		
	}//main

}//class
