package oop0521;

public class Test02_For {

	public static void main(String[] args) {
		// 이중 반복문
		
		for(int a=1;a<=2;a++){
			System.out.println("JAVA");
			
			for(int b=1;b<=3;b++){
				System.out.println("SEOUL");
				}
			
		}//for
		/*
		 * 결과값
		 * JAVA
           SEOUL
           SEOUL
           SEOUL
           JAVA
           SEOUL
           SEOUL
           SEOUL
		 */
		/*
		 * a=1  1<=2
		 *       JAVA
		 *       b=1    1<=3    SEOUL
		 *       b=2    2<=3    SEOUL
		 *       b=3    3<=3    SEOUL    
		 * a=2  2<=2 
		 * 	     JAVA
		 *       b=1    1<=3    SEOUL
		 *       b=2    2<=3    SEOUL
		 *       b=3    3<=3    SEOUL                  
		 */
		
		//2단~9단 출력하기.
		for(int c=2;c<=9;c++){
			System.out.println(c+"단");
			for(int d=1;d<=9;d++){
				System.out.println(c+"*"+d+"="+(c*d));
			}
		}
		
		
		// 사각형 만들기
		// > 등수 구할 때 회전수 참조!!
		
		for(int x=1;x<=4;x++){
			for(int y=1;y<=4;y++){
				System.out.print("#");
			}
			System.out.println();
		}//for
		
		/* 분석
		 * x=1
		 *     y=1   1<=4   #
		 *     y=2   2<=4   #
		 *     y=3   3<=4   #
		 *     y=4   4<=4   #    
		 *x=2
		 *     y=1   1<=4   #
		 *     y=2   2<=4   #
		 *     y=3   3<=4   #
		 *     y=4   4<=4   #             
		 */
		
		
		
		// 삼각형 만들기
		// 회전수 증가
		// 예) 로또번호
		
		for(int z=1;z<=4;z++){
			for(int q=1;q<=z;q++){
				System.out.print("@");
			}
			System.out.println();
		}
		
		
		/*
		 * 분석
		 * z=1
		 *       q=1    1<=z  1<=1  @
		 * z=2 
		 *       q=1    1<=2   @
 		 *              2<=2   @
 		 * z=3   q=1
 		 *              1<=3   @
 		 *              2<=3   @
 		 *              3<=3   @                       
		 */ 
		
		// 역삼각형 만들기
		// 회전수 감소
		// 예) 정렬
		
		for(int v=4;v>=1;v--){
			for(int k=1;k<=v;k++){
				System.out.print("$");
			}
			System.out.println();
		}//for
		
		/*
		 * 분석
		 * v=4
		 *      k=1    1<=v  1<=4  $
		 *             2<=4   $
		 *             3<=4   $
		 *             4<=4   $
		 *             
		 * v=3  
		 *      k=1    1<=3   $
		 *             2<=3   $
		 *             3<=3   $            
		 */     
		
		
		
		
		
		
		
		
		
		
		
		
		

	}//main

}//class
