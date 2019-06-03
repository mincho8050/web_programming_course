package oop0603;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Test05_GregorianCalendar {

	public static void main(String[] args) {
		/*
		 * 날짜 관련 
		 * GregorianCalendar 클래스
		 */
		
		GregorianCalendar now=new GregorianCalendar();
		
    	System.out.println(now.get(Calendar.YEAR));		//2019
		System.out.println(now.get(Calendar.MONTH));	//5 >달은 0부터 시작. 6월로 읽어야함
		System.out.println(now.get(Calendar.DATE));		//3

		// 2020년이 윤년인지 확인하시오.
		// 윤년이면 true
		System.out.println(now.isLeapYear(2020));		
		
		
		System.out.println("---------------------------");
//-----------------------------------------------------------------------------------		
		
		
		// 날짜 데이터의 연산
		
		// now날짜에 3년 더하기.
		now.add(Calendar.YEAR, 3); //Calendar.YEAR라는 변수(올해). +3년을 더하라는 말.
		                          // > now 날짜는 2022-5-3 을 가지고 있음
		System.out.println(now.get(Calendar.YEAR)); // 2022
		
		// now 날짜에 2달 빼기
		now.add(Calendar.MONTH, -2); // 2022-3-3
		System.out.println(now.get(Calendar.MONTH)); // 3 >이지만 4월
		
		// now 날짜에 10일 더하기
		now.add(Calendar.DATE,10); // 2022-3-13 (최종적으로)
		System.out.println(now.get(Calendar.DATE)); // 13
		
		
		
		System.out.println("---------------------------");
//-----------------------------------------------------------------------------------	


		
		
	
		/*  문) 
		  2019년 5월 29일 ~ 2019년 6월 2일의
		  총 날수를 구하시오.
		  답 > 5일
		*/  
		
		// 현재 시스템의 날짜 가져오기
		Calendar start=Calendar.getInstance();
		
		// start의 날짜값을 변경. month는 n-1.
		//  > 2019-5-3
		start.set(2019, 4, 29);
		start.set(2019, Calendar.MAY, 29); //month 자리를 변수로 한다.
		
		// end의 날짜값을 변경
		// 2019-6-2
		Calendar end=Calendar.getInstance();
		end.set(2019, Calendar.JUNE, 2);
		
		// 1) 2019-6-2 - 2019-5-29 = 4 (날수빼는거)
		int cnt1=0;
		
		// 2) 2019-6-2 ~ 2019-5-29 총 날수 = 5 (날수구하는거)
		int cnt2=1;
		
		while(start.before(end)){
			cnt1++;
			cnt2++;
			System.out.print(start.get(Calendar.YEAR));
			System.out.print("-");
			System.out.print(start.get(Calendar.MONTH)+1);
			System.out.print("-");
			System.out.print(start.get(Calendar.DATE));
			System.out.println();
			start.add(Calendar.DATE, 1);
		}//while

		/*
		 * 
		 * while("2019-5-29".befor("2019-6-2"))
		 *  2019-5-30
		 *  start.add(29,1); > 일수 하루씩 증가
		 *  while("2019-5-30".befor("2019-6-2"))
			2019-5-31
			while("2019-5-31".befor("2019-6-2"))
			2019-6-1
			while("2019-6-1".befor("2019-6-2"))
			2019-6-2 > 여기까지 나옴.
			while("2019-6-2".befor("2019-6-2")) 
			> 전날이 아니라 같은 날이라 빠져나옴.
		 */
		
		System.out.println(cnt1);	//4
		System.out.println(cnt2);	//5
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
