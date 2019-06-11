package oop0611;

import java.io.BufferedReader;
import java.io.FileReader;

public class Test03_Input {

	public static void main(String[] args) {
		/*
		 * 파일 내용 읽기
		 */

		try{
			
			String fileName="D:/java0514/workspace/basicJava/src/oop0610/Test04_BuyerTest.java";
			
			//1) 파일 가져오기
			//내용을 가져오는 것은 File클래스 사용해도 되지만 내용을 보려면 FileReader클래스 이용
			FileReader in=new FileReader(fileName);
			
			//2) 파일 내용 읽기
			//reader계열이니까 BufferReader클래스 이용.
			BufferedReader br=new BufferedReader(in);
			int num=0;
			while(true){ //무한루프
				
				// 3)엔터(\n), 줄의 끝(\r) 기준으로 한줄씩 가져오기
				String line=br.readLine();
				if(line==null){ //줄의 마지막은 null값이 나옴
					break;
				}//if
				
//				System.out.println(line); //이렇게 출력해도 되고
				System.out.printf("%3d %s\n",++num,line); 
				//위에 int num=0;을 설정하고 
				//옆에 숫자들 보이게 표시.
				//%3d > 10진 정수형을 3칸 오른쪽 정렬
				//%s\n > 문자열형과 엔터.
				//++num > 1씩 증가
				//line > 후에 마지막에 파일내용 불러오기.
				
				if(num%20==0){
					System.out.println("-----------------------");
				}//if
				//20줄마다 선표시
				
				
			}//while
			
			// 4) 자원 반납(순서주의!!)
			br.close();	//나중에 연거
			in.close(); //맨처음 연겨
			
			
		}catch(Exception e){
			System.out.println("실패"+e);
		}//try
		
		

		
		
	}//main

}//class
