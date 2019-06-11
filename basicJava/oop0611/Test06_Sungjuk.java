package oop0611;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.List;
import java.util.Vector;




public class Test06_Sungjuk {

	public static void main(String[] args) {
		/*
		 * 성적 프로그램
		 * 성적 입력 자료를 가져와서  > sungjuk.txt
		 * 성적 결과 파일 완성하기.
		 */
		/*
		 * 입력
		 * 	무궁화,95,90,100
			홍길동,30,55,40
			라일락,60,95,75
			진달래,20,85,65
			봉선화,100,35,100
			
			입력값!
		 */
		/*
		 * 출력
		 *                    성 / 적 / 결 / 과
				--------------------------------------------------------
				이름   국어 영어 수학 평균 등수 결과
				--------------------------------------------------------
				무궁화  95   90  100  100  1    합격   ********** 장학생
				홍길동  30   55   40   33  5    불합격 ***
				개나리  90   95   90   91  2    합격   *********
				진달래  70   80   60   70  4    합격   *******
				라일락  35  100  100   78  3    재시험 *******
				--------------------------------------------------------
				>이건 파일과 점수가다름 형식만 참고
		 */
		
		try{
			
			String inName="D:/java0514/testFile/sungjuk.txt";
			String outName="D:/java0514/testFile/result.txt";
			
			FileReader in=new FileReader(inName);
			BufferedReader br=new BufferedReader(in);
			
			while(true){
				
				String line=br.readLine();
				if(line==null){
					break;
				}
				
				
				String[] lineStr=line.split(","); //1차원배열로 String값으로 저장.
//				for(int idx=0;idx<lineStr.length;idx++){
//					System.out.print(lineStr[idx]); 
//				}//테스트
				
				Vector<String> name=new Vector<String>();
				for(int a=0;a<lineStr.length;a++){
					System.out.println(lineStr[a]);
					if(a%4==0){
						name.add(lineStr[a]);
					
					}
					
				}//for
				
				String a=name.toString();
				System.out.println(a);
				
			}//while
				
			
			
			

			
			
			
			
			
		}catch(Exception e){
			System.out.println("실패"+e);
		}//try
		
		
		
		
		
	}//main

}//class
