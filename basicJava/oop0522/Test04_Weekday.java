package oop0522;

public class Test04_Weekday {

	public static void main(String[] args) {
		// 요일 구하는 프로그램
		
		int cyear=2019,cmonth=5,cdate=22;
		
		/*
		 * 서기 1년~서기 2019년=총날수 > 365*2019=736935
		 * 총날수%7 > 나머지가 0이 나오면 일요일 1은 월, 2는 화, 3수, 4목, 5금, 6토
		 * 
		 * 1) 서기 1년 ~ 서기 2018년(2019년도 까지하면 2019.12.31일까지 계산되기 때문이다.)
		 *    그러니까 구하려는 년도보다 하나 낮아야 한다.
		 *    윤년 +=366
		 *    평년 +=365
		 *    
		 *    
		 * 2)month는 4가지 형태
		 *   31,30,29,28일
		 *   1월~4월(5월로 하면 5월말일까지 계산되기 떄문에 구하려는 월보다 전 월로 구해야 한다.)
		 * 
		 *   1, 3, 5, 7, 8, 10, 12월 +=31
		 *   4, 6, 9, 11월 +=30
		 *   윤년 2월 +=29
		 *   평년 2월 +=28
		 *   
		 *  3) +=22일(구하려는 일수)
		 *   
		 */
		
		int hap=0;
		
		// 1) 총 날수 구하기.
		// > 평년과 윤년 구별하기.
		
		for(int y=1;y<cyear;y++){
			if(y%4==0&&y%100!=0||y%400==0){//윤년공식. 물론 정확한건 아니다.
				hap=hap+366; //윤년일 때 366일로 계산.
			}else{
				hap=hap+365; //평년일 때 365일로 계산
			}
		}//for
		//hap 결과값 737059

		
		
		// 2) month 구하기.
		// > 배열 사용
		
		 int[] mon={0,31,28,31,30,31,30,31,31,30,31,30,31}; 
		 /*평년 기준으로 일단 1~12월까지 배열로 정해놓기.
		   구하려는 달수가 5월이면 1~4월까지의 수를 더해주면 됨.
		  hap변수에 mon[0]~mon[3] 더해주면 된다.
		  5월 > hap+=mon[0]~mon[3]
		  앞에 0이란 값을 추가해서 1~4로 해서 값을 구한다. 알아보기 쉬우니까.
		  5월 > hap+=mon[1]~mon[4]
		 */
		
		if(cyear%4==0&&cyear%100!=0||cyear%400==0){//여기서는 y가 아니라
			                                       //윤년 물어보는 연도는 cyear로 물어봐야 한다.
			mon[2]=29;
		}//
		
		for(int m=1;m<cmonth;m++){
			hap=hap+mon[m];
		}//for
		
		
		// 3)일수 더하기
		
		hap=hap+cdate;  //결과값 737201
		
		
		// 4) 요일 구하기
		//7로 나눠서 나머지로 구하기.
		
		switch(hap%7){
		case 0:System.out.println(cyear+"년 "+cmonth+"월 "+cdate+"일은 "+"일요일");break;
		case 1:System.out.println(cyear+"년 "+cmonth+"월 "+cdate+"일은 "+"월요일");break;
		case 2:System.out.println(cyear+"년 "+cmonth+"월 "+cdate+"일은 "+"화요일");break;
		case 3:System.out.println(cyear+"년 "+cmonth+"월 "+cdate+"일은 "+"수요일");break;
		case 4:System.out.println(cyear+"년 "+cmonth+"월 "+cdate+"일은 "+"목요일");break;
		case 5:System.out.println(cyear+"년 "+cmonth+"월 "+cdate+"일은 "+"금요일");break;
		case 6:System.out.println(cyear+"년 "+cmonth+"월 "+cdate+"일은 "+"토요일");break;
		}
		
		
		
		
		
		
		
		
	}//main

}//class
