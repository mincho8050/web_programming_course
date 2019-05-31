package oop0531;

import java.lang.invoke.SwitchPoint;
import java.util.*;

public class Test04_Calendar {

	public static void main(String[] args) {
		/*
		 * 날짜 관련 클래스
		 * Date
		 * Calendar > java.util 불러와야함.
		 * GregorianCalendar
		 */
		
		// 현재 시스템의 날짜정보 가져오기
		Calendar now=Calendar.getInstance();
		//get이 붙는 함수는 어디에서 가져오는거임.
		//get으로 존재하는 함수는 리턴값이 있음.
		//반댓말은 set
		System.out.println(now.get(1)); //출력값 2019 > 현재 연도
		System.out.println(now.get(2)); //출력값 4 > 현재 달.
		                                //근데 0부터 카운트가 되어서 +1해줘야 됨.
		System.out.println(now.get(2)+1);//출력값 5 > +1해줘야 현재 달이 나옴.
		System.out.println(now.get(5)); //출력값 31 > 현재 날짜
		
		System.out.println(now.get(Calendar.YEAR));
		System.out.println(now.get(Calendar.MONTH)+1);
		System.out.println(now.get(Calendar.DATE));
		
		System.out.println(now.get(Calendar.HOUR));  //현재 시 , 
		System.out.println(now.get(Calendar.MINUTE)); //현재 분 
		System.out.println(now.get(Calendar.SECOND));//현재 초
		
		System.out.println("-------------------");
//----------------------------------------------------------------
		
		
		//24시간을 기준으로 
		System.out.println(now.get(Calendar.HOUR_OF_DAY)); // 출력값 15
	
		//요일
		System.out.println(now.get(Calendar.DAY_OF_WEEK)); //출력값 6
		// > 1-일,2-월,3-화,4-수,5-목,6-금,7-토
		// > 요일은 정수형으로 나옴.
		switch(now.get(Calendar.DAY_OF_WEEK)){
		case 1 :System.out.println("일"); break;
		case 2 :System.out.println("월"); break;
		case 3 :System.out.println("화"); break;
		case 4 :System.out.println("수"); break;
		case 5 :System.out.println("목"); break;
		case 6 :System.out.println("금"); break;
		case 7 :System.out.println("토"); break;
		}//switch
		

	}//main

}//class
