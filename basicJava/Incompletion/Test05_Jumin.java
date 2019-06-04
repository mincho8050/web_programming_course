package oop0531;

import java.util.*;



public class Test05_Jumin {

	public static void main(String[] args) {
		/*
		 * 문제)
		 * 주민번호 유효성 검사 후 
		 * 생년월일, 성별, 나이, 띠 출력하기.
		 * 
		 * 띠는 12개 연도를 12로 나눠서 0이면 원숭이.
		 * 원숭이,닭,개,돼지,쥐,소,범,토끼,용,뱀,말,양
		 * 
		 * 살아온 날 수 구하기.
		 *  > +) 몇년 몇개월 며칠 살았는지 구하기
		 */
		Scanner sc=new Scanner(System.in);
		
    	System.out.println("주민번호를 입력하시오");
		Jumin id=new Jumin(sc.next());
		id.disp();
		
		id.getDay();
	
	

		
	


		
		
	}//main

}//class