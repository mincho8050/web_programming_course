package oop0521;

public class Test04_Array {

	public static void main(String[] args) {
		// Array 배열
		// > 동일한 자료형의 집합
		// > 순서, 색인, index
		// > 순서값 index는 0부터 시작.
		// > 요소 element
		// > 1차원 : 열 구성
		// > 2차원 : 행과열구성 > 대부분 2차원을 사용하려면 클래스를 사용.
		// > 3차원 : 자바에는 없는 개념.
		// > 열, 칸, column
		// > 행, 줄, row
		// > new 연산자로 메모리를 할당한 후 사용한다.
		
		/*
		String name1="사과",name2="수박",name3="딸기";
		int kor1=60,kor2=100,kor3=85;
		배열로 표현해보기.
		*/
		
		int[]kor=new int[3];
		/*
		 * int는 4byte인데 3개 선언.
		 * 4byte*3개 => 12byte메모리 할당 
		 * 정수값 세개표현가능. 
		 * int[] kor 의미는 int형태로 메모리 3칸을 확보하겠다. 라는 의미.
		 * 이럴때는 연산자 new를 사용한다.
		 */
		kor[0]=60;
		/*
		 * 배열의 index,순서값은 0부터 시작.
		 * 배열의 index는 1씩 증가한다.
		 */
	  
		kor[1]=100;
		kor[2]=85;
		
		System.out.println(kor[0]);
		System.out.println(kor[1]);
		System.out.println(kor[2]);
		//배열과 반복문은 같이 잘 쓰인다.
		
		/*
		 * int a=3;
		 * a. 에러
		 * 일반변수에 .을 하면 에러.
		 */
		 
		
		System.out.println(kor.length);  //결과값 3이 나옴.
		/*
		 * 결과값 3의 의미는 kor 배열 요소의 갯수
		 * new를 사용한 kor은 더이상 변수가 아니라 객체. 
		 */

		
//--------------------------------------------------------------------------------------------------------
		
		
		int[]eng={55,40,80};
		//{} 처리를 하면 알아서 메모리값을 3개 선언한다.
		//열거형
		int size=eng.length;
		//size 변수에는 eng배열 요소의 갯수인 3이 입력.
		for(int a=0;a<size;a++){
			System.out.println(eng[a]);
			//영어점수에 대한 index값이 필요하므로
			//eng[a]로 입력해 값을 출력한다.
			//그냥 a로 하면 출력값이 0,1,2
		}
		
		
//------------------------------------------------------------------------------------------------------------
		
		
		double[]aver={1.2,3.4,5.6};
		for(int b=0;b<aver.length;b++){
			System.out.println(aver[b]);
		}
		
		
		
//------------------------------------------------------------------------------------------------------------		
		
		char[] ch={'H','E','L','L','O'};
		for(int c=0;c<ch.length;c++){
			System.out.println(ch[c]);
		}
		
		
		
//------------------------------------------------------------------------------------------------------------		
		
		
		
		String[] name={"진달래","개나리","무궁화"};
		for(int d=0;d<name.length;d++){
			System.out.println(name[d]);
		}
		
		
		
		
		
		
	}//main

}//class
