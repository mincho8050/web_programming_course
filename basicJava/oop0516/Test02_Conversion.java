package oop0516; //한번만 선언. 또 선언해야하는경우 import를 사용한다. 1패키지 클래스

public class Test02_Conversion {

	public static void main(String[] args) {
		// 자료형 변환 Datatype Conversion
		// 자동형 변환, 강제형 변환(cast 연산)
		
		// 1) 자동형 변환
		// 정수 : byte < short < int < long
		// 실수 : float < double
		// 정수형이 실수형을 따라간다.
		byte a=3;
		int b=a; //a형이 b로 들어가면서 자연스럽게 int값이 된다. 그래서 3. 
		System.out.println(a);
		System.out.println(b);
		
		 /*long c=5;
		 int d=c; 큰 수가 작은수에 들어가면 오류.
		 */
		
		 float e=1.2f;
		 double f=e; //float가 적기 때문에 오류 아님. 거꾸로는 오류.
		 
		 double g=3;
		 System.out.println(g); //정수형이 실수값에 들어가면 자연스럽게 실수형으로 변환.
		 
		 
		 // 2) 강제형 변환(cast 연산자)
		 // > 필요한 곳에서 일시적으로 변환
		 // > (자료형)값
		 
		 System.out.println((int)3.5);
		 System.out.println((double)4);
		 System.out.println((int)2.6+(int)5.7);
		 System.out.println((int)(2.6+5.7));
	
		
//---------------------------------------------------------------------------------------------
		 
		 //int형과 char형과의 형변환
		 //ASCII코드, ASCII문자
		 System.out.println(65);
		 System.out.println((char)65); //대문자 A가 나온다. 'A' 라는것을 기억.
		 System.out.println((char)66); //'B' 라는것을 기억.
		 System.out.println((char)67); //'C' 라는것을 기억.
		 
		 System.out.println((char)97); //'a'
		 System.out.println((char)98); //'b'
		 
		 System.out.println((int)'A'); //65
		 System.out.println((int)'a'); //97
		
		 System.out.println((int)'+'); //43
		 System.out.println((int)' '); //32 . 이거는 기억할 필요가 있음
		 System.out.println((int)'\r'); //13 엔터키.  이거는 기억할 필요가 있댕..
		
		 System.out.println('A'-'a'); //-32
		 System.out.println("#"+(char)('b'-'B')+"#"); //'b'-'B'는 -32 그런데 이 값을 형변환했으니까 공백이 나옴.
		
//---------------------------------------------------------------------------------------------------
		
		int z=3, x=5;
		char op='+';
		
		//3+5=8 출력
		System.out.println(z+op+x+"="+(z+x)); //51=8 이 출력
		                 //3+'+'+5+"="+(8)
		                 //3+43+5  char형 +가 아스키코드값이 있음.43
		                 //51=8
		
		System.out.println(z+""+op+""+x+"="+(z+x)); // "" 공백도 안준 빈문자열. 공백은 문자.
		//스트링에 정수면 그냥 추가되는 느낌이어서. 따로나옴..?그렇댕..
		
		
		

	}

}
