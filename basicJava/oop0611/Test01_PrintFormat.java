package oop0611;

public class Test01_PrintFormat {

	public static void main(String[] args) {
		/*
		 * 출력서식
		 * >콘솔창위주. 
		 */

		System.out.println("JAVA");
		System.out.println("SOLDESK");
		System.out.print("손흥민");
		System.out.print("박지성");
		System.out.println();
		
		//큰따옴표(") 출력
		System.out.println("\""); //기호로 나타내려면 \ 역슬래쉬붙이기.
		
		// \(역슬래쉬,경로구분기호) 출력 시 2번씩
		System.out.println("\\");
		System.out.println("d:\\java0514\\workspace");
		System.out.println("d:/java0514/workspace");//웹은 경로구분 /, 자바는 /도 허용.
		
		
		
		/*출력값
		 *  JAVA
			SOLDESK
			손흥민박지성
			"
			\
			d:\java0514\workspace
			d:/java0514/workspace
		 */
		
		
		System.out.println("------------------------------");
//--------------------------------------------------------------------------------------
		
		
		
		
		/*
		 * \n : 줄바꿈
		 * \t : tap키
		 * \r 
		 * \b
		 * 나머지는 잘 안씀.. 저 두개정도? 기억하자..?
		 */
		
		
		System.out.print("사과\n");
		System.out.print("딸기\n참외");
		System.out.print("수박\n\n\n바나나");
		System.out.println();
	
		
		/*
		 * 출력값
		 *  사과
			딸기
			참외수박
			
			
			바나나
		 */
		
		
		
		System.out.println("------------------------------------");
//-------------------------------------------------------------------------------------
		
		
		/*
		 *  %d : 10진 정수형
		 *  %f : 실수형
		 *  %c : 문자형
		 *  %s : 문자열형
		 *  
		 *  >콘솔과 메모장 기준
		 */
		
//		System.out.printf("출력포맷",값);
		System.out.printf("%d %d %d\n",1,3,5);
		System.out.printf("%d, %d, %d\n",1,3,5);
		System.out.printf("%d \t %d \t %d\n",1,3,5);
		
		System.out.printf("나이:%d\n",20);
		
		//#은 칸수확인용
		System.out.printf("#%5d#\n",2);
		System.out.printf("#%-5d#\n",2);
		
		
		/*
		 * 출력값
		 *  1 3 5
			1, 3, 5
			1 	 3 	 5
			나이:20
			#    2#
			#2    #
		 */
		
		
		System.out.println("-------------------------");
//-----------------------------------------------------------------------------		
		
		System.out.printf("%f %f %f \n",1.2,3.4,5.6);
		System.out.printf("#%6.2f# \n",7.8); 
		System.out.printf("#%-6.2f# \n",7.8);
		System.out.printf("#%.2f# \n",7.8); //소수점을 두개로 잡는거 .2

		/*
		 * 출력값
		 *  1.200000 3.400000 5.600000 
			#  7.80# 
			#7.80  # 
			#7.80# 
		 */
		
		
		System.out.println("-------------------------");
//-----------------------------------------------------------------------------	
		
		
		
		System.out.printf("%c %c %c \n",'S','K','Y');
		System.out.printf("#%5c# \n",'R');
		System.out.printf("#%-5c# \n",'r');
		
		
		/*
		 * 출력값
		 * 	S K Y 
			#    R# 
			#r    # 
		 */
		
		
		
		System.out.println("-------------------------");
//-----------------------------------------------------------------------------	
		
		System.out.printf("%s %s %s \n","Year","Month","Data");
		System.out.printf("#%8s# \n","HAPPY");
		System.out.printf("#%-8s# \n","HAPPY");
		
		/*
		 * 출력값
		 *  Year Month Data 
			#   HAPPY# 
			#HAPPY   # 
		 */
		
		
		
		
		
	}//main

}//class
