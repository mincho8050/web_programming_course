package oop0516;

public class Test04_Quiz {

	public static void main(String[] args) {
		// 연습문제
		// 1년 : 365일 ?시간 ?분 ?초
		/*
		 1분 : 60초
		 1시간: 60분*60초 = 3600초
		 1일 : 24시간*3600초 =86400초
		 1년 : 365.2425*86400 = 31556952초
		 */
		
		
		double year=365.2425;
		int total=(int)(year*86400);
		
		int day,hour,min,sec; //미리 값안하고 먼저 선언 후에 
		
		//이렇게 선언한 변수 대입하면댄다 이마리야
		day=total/86400;
		total=total%86400;//total를 계속 새로 선언해서 다음 식에 쓴다.
		//System.out.println(total); //20952 > 첫번째 토탈 변경 후 값
		
		hour=total/3600;
		total=total%3600;
		//System.out.println(total); //2952 > 두번째 토탈 변경 후 값
		//
		
		min=total/60; //2952를 60으로 나눈 값.
		sec=total%60; //2952를 60으로 나눈 뒤 나머지값.
		
		System.out.println(day+"일 "+hour+"시 "+min+"분 "+sec+"초");
		
		
 //---------------------------------------------------------------------------
		
		// 문) 국어점수가 80~89점 사이인지 확인하시오.
		
		int kor=86;
		System.out.println((kor>=80)&&(kor<=89));
		
		
		// 문) 임의의 문자가 알파벳 대문자인지 확인하시오.
		char ch='t';
		System.out.println(ch>='A'&&ch<='Z'); //대문자확인법. 소문자대문자는+-32차이.
		                 //'t'>='A'  't'<='Z'
		                 // true      false
		                 //false
		
		// 문) 해당년도가 윤년인지 확인하시오.
		// 윤년 구하는 공식 > 산술적인 의미라 쓰면 안됨.
		int y=2019;
		System.out.println(y%4==0&&y%100!=0||y%400==0);
		
		

		
		
		
		
		
		
		
		
		
	}

}
