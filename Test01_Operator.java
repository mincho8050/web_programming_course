package oop0516;

public class Test01_Operator {

	public static void main(String[] args) {

		// 연산자 연습
		// > 이식성이 풍부하다
		// > 산술, 비교, 논리 
		// 연산자 우선순위
		// > 최우선 연산자 ()
		// > 후순위 연산자 =
		
		// 1) 산술연산자
		System.out.println(3+5-8); //0
		System.out.println(2/4*6); //0
		System.out.println(1+3/5); //1
		
		System.out.println(5%3); //나머지 2
		System.out.println(3%5); //나누는값이 뒤가 커버리면 나머지가 앞의 값이 나옴. 3  
		
//-----------------------------------------------------------------------------------
		
		// 2) 비교(관계)연산자 : boolean형태로 결과값이 반환된다.
		System.out.println(5<3);
		System.out.println(5>3);
		// >= , <= , ==(2개는 같다) , !=(같지않다)
		System.out.println(5<=3);
		System.out.println(5>=3);
		System.out.println(5==3);
		System.out.println(5!=3);
		
		
//----------------------------------------------------------------------------		
		
		// 문1) 임의의 정수가 짝수인지 확인하시오.
		// 2로 나눴을때 0이면 짝수(2의배수), 1이면 홀수
		// n으로 나눴을때 나머지는 n개(0~n-1).(ex. 4로 나눴을때 나머지는 4개- 0,1,2,3)
		
		int a=4;
		System.out.println(a%2==0);
		System.out.println(a%2!=1);
		
		// 문2) 해당연도가 윤년인지 확인하기.
		int y=2019;
		System.out.println(y%4==0);
		
		// 문3) 임의의 문자가 'R'인지 확인하시오.
		char ch='r';
		System.out.println(ch=='R'); //false
		
		// 문4) 지폐갯수를 구하시오
		int money=45630;
		/*출력결과
		 * 만원 4장
		 * 천원 5장
		 * 백원 6장
		 * 십원 3장
		 */
		System.out.println("만원 "+money/10000+"장");
		System.out.println("천원 "+(money%10000)/1000+"장");
		System.out.println("백원 "+(money%1000)/100+"장");
		System.out.println("십원 "+(money%100)/10+"장");
		
		
		
	
	}
}
