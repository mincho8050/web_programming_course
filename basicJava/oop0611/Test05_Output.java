package oop0611;

import java.io.FileWriter;
import java.io.PrintWriter;

public class Test05_Output {

	public static void main(String[] args) {
		/*
		 * 파일출력
		 * 
		 * 입출력
		 * > 표준입출력 : 모니터(console), 키보드
		 * > 파일입출력 : 
		 */

		try{
			
			String filenName="D:/java0514/testFile/sungjuk.txt"; 
			//출력파일(sungjuk.txt)
			// > 없으면 생성된다(create)
			// > 있으면 추가(append) 또는 덮어쓰기(overwrite)
			// > 추가할려면 true , 덮어쓰기는 false
			
			FileWriter fw=new FileWriter(filenName,false);	//false파일이 있으면 덮어쓰기. 
			   												//true로 있으면 추가하기.
			//autoFlush : true 버퍼 클리어.
			PrintWriter out=new PrintWriter(fw,true);
			out.println("무궁화,95,90,100");
			out.println("홍길동,30,55,40");
			out.println("라일락,60,95,75");
			out.println("진달래,20,85,65");
			out.println("봉선화,100,35,100");

			
			out.close();
			fw.close();
			
			System.out.println("sungjuk.txt 데이터 파일 완성!");
			
		}catch(Exception e){
			System.out.println("실패"+e);
		}//try
		
		
		
		
		
		
	}//main

}//class
