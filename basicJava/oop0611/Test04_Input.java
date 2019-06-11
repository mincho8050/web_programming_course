package oop0611;

import java.io.FileInputStream;
import java.io.FileReader;

public class Test04_Input {

	public static void main(String[] args) {
		/*
		 * InputStream기반과 Reader기반 비교
		 */

		try{
			String fileName="D:/java0514/workspace/basicJava/src/oop0610/Test04_BuyerTest.java";
			
			
			
/*			
  			// 1) FileInputStream : 1바이트 기반
			// > 한글깨짐
 			FileInputStream fis=new FileInputStream(fileName);
			int data=0;
			
			while(true){//무한루프
				data=fis.read(); //1바이트씩 읽기.
				if(data==-1){ //파일의 끝(End Of File)인지?
					break;
				}//if
				System.out.print((char)data);
				//그냥 data를 하면 int값이 나오니까 형변환
				//근데 1바이트씩 읽는거라 한글은 깨짐
			
			
				
			}//while
			
			fis.close();//자원반납!
			
			
*/
//--------------------------------------------------------------------------------
			
			// 2) FileReader
			// > char (2바이트)기반
			// > 한글 안깨짐
			FileReader fr=new FileReader(fileName);
			int data=0;
			while(true){
				data=fr.read();
				if(data==-1){
					break;
				}//if
				System.out.print((char)data);
				
			}//while
			
			fr.close();
			
			
			
		}catch(Exception e){
			System.out.println("실패"+e);
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}//main

}//class
