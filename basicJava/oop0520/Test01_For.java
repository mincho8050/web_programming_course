package oop0520;

public class Test01_For {

	public static void main(String[] args) {
		// 반복문
		// for, while, do~while
		// 형식) for(시작값;종료값;증감){}
		// Scope : 유효범위
		// 무한LOOP
		// break : 반복문을 빠져나옴
		// continue : 반복문을 계속 수행
		
		
		//증가에 따른 반복
		for(int a=1;a<=3;a=a+1){
			System.out.println(a+"JAVA");
		}  //for end
		   //()안에 ;;두개오는게 기본. :이렇게 나오는건 버전에 따라 다름.
		
		/*
		 * a=1        1<=3        JAVA 
		 * a=1+1      2<=3        JAVA
		 * a=2+1      3<=3        JAVA
		 * a=3+1      4<=3      맞지 않으므로 반복되지 않음.
		 */
		
		/*
		 * 변수의 유효범위
		 * > local variable : 지역변수
		 * > global variable : 전역변수
		   > System.out.println(a); 에러	
		*/
		
		//위에 있는  for문 안에 선언되어있는 변수 a는 for end를 나가면서 사라지는 값이기 때문에
		//새롭게 선언되어도 괜찮다.
		//감소에 따른 반복
		for(int b=3;b>=1;b=b-1){
			System.out.println(b+"SEOUL");
		}//for end
		
		/*
		 * b=3     3>=1   SEOUL
		 * b=3-1   2>=1   SEOUL
		 * b=2-1   1>=1   SEOUL
		 * b=1-1   0>=1   맞지 않기 때문에 출력되지 않음.
		 */
		
//----------------------------------------------------------------------------------
		
		//구구단 4단 출력하기
		for(int c=1;c<=9;c=c+1){//c+=1
			                    //c++
			                    //++c
			System.out.println(4+"*"+c+"="+(c*4));
		}//for end
		
		
//-------------------------------------------------------------------------------
		
		//알파벳 출력하기
		for(char ch='A';ch<='Z';ch++){
			//아스키코드값이 있어서 맞다.
			System.out.println(ch);
		}
		
		
//--------------------------------------------------------------------------------
		
		
		//1~10중에서 3의 배수만 출력하기
		for(int d=1;d<=10;d++){
			if(d%3==0){
				System.out.println(d);
			}
		}//for end
		

//------------------------------------------------------------------------------------
		
		//서기 1년~ 서기 2019년 중에서 윤년만 출력하기.
		//산술적인 의미에서의 윤년. 정확하지 않음.
		for(int y=1;y<=2019;y++){
			if(y%4==0&&y%100!=0||y%400==0){
				System.out.println(y);
			}//
		}//
		

//-------------------------------------------------------------------------------------
		
		// 갯수
		// 누적 
		
		// 1~10사이 중에서 3의 배수의 갯수 구하기.(3 출력) , 갯수
		int count=0;
				//갯수파악의 변수는 0부터 시작. 등수구할때는 1이 초기값으로 설정하자.
		for(int e=3;e<=10;e++){
			if(e%3==0){
				count=count+1; //count+=1 , count++, ++count 다 같은 의미
            //		System.out.println(count+"개"); 
				//if 안에 입력하게 되면 1개,2개,3개 로 출력된다.
			}
		}//
		System.out.println(count+"개");
		
		/* 분석
		 * if(1%3==0)
		 * if(2%3==0)
		 * if(3%3==0) > 맞음 > count=0+1 > count=1
		 * ...
		 * if(5%3==0)
		 * if(6%3==0) > 맞음 > count=1+1 > count=2
		 * ...
		 * if(8%3==0)
		 * if(9%3==0) > 맞음 > count=2+1 > count=3 
		 * if(10%3==0)
		 */
		
		
//---------------------------------------------------------------------------------
		
		
		// 1~10사이 중에서 3의 배수의 갯수의 합구하기.(18 출력) , 누적
		
		int hap=0;   //합 누적은 초기값이 0, 곱하기 누적은 초기값 1
		for(int f=1;f<=10;f++){
			if(f%3==0){
				hap=hap+f;//hap+=f
			}
		}
		System.out.println(hap);
		
		/* 분석
		 * if(1%3==0)
		 * if(2%3==0)
		 * if(3%3==0) > 맞음 > hap=0+3 > hap=3
		 * ...
		 * if(5%3==0)
		 * if(6%3==0) > 맞음 > hap=3+6 > hap=9
		 * ...
		 * if(8%3==0)
		 * if(9%3==0) > 맞음 > hap=9+9 > hap=18 
		 * if(10%3==0)
		 */
		
//----------------------------------------------------------------------------------
		
		// 문1) 서기1년~서기2019년 중에서 윤년의 갯수 구하기.
		
		int ycount=0;
		
		for(int year=1;year<=2019;year++){
			if(year%4==0&&year%100!=0||year%400==0){
				ycount=ycount+1;
			}
		}
		
		System.out.println("윤년의 갯수 : "+ycount+"개");
		
		
		
		
		
		
//----------------------------------------------------------------------------------
		
		
		
		// 문2) 4팩토리얼값을 구하시오.
		// > 4*3*2*1 이 팩토리얼 값.
		
		int fac=1;
		
		for(int t=4;t>=1;t=t-1){
			fac=fac*t;
		}
		
         System.out.println(fac);
		
		//선생님이 하신 것
         long gop=1; // 곱하기는 int 보다는 long을 사용(값이 크니까)
         for(int u=4;u>=1;u--){
        	 gop=gop*u;
         }
		System.out.println("4팩토리얼 : "+gop);
		
		
		
		
		
	}//

}//
