package oop0612;

import java.io.FileInputStream;
import java.util.Iterator;
import java.util.Properties;

public class Test01_Properties {

	public static void main(String[] args) {
		/*
		 * Properties 클래스
		 * > Key 와 Value 를 구분해서 저장할 수 있다.
		 * > Key 와 Value의 구분기호는 = 또는 : 를 추천
		 * HashMap이랑 비슷하게 쓰임. > 토크나이저보다 좀 더 쓰기 편함
		 * 데이터를 저장할 때 확장명을 .properties로 저장한다!
		 * > 온전한 데이터만 저장한다.
		 */

		try{
			
			String fileName="D:/java0514/workspace/basicJava/src/oop0612/command.properties";
			FileInputStream fis=new FileInputStream(fileName);//한글이 없어 1바이트 단위로 읽어와도 될 것 같다.
															  //FileReader 가 2바이트 단위로 읽음.
			Properties pr=new Properties();
			pr.load(fis); //command.properties 파일 가져오기
			
			Iterator iter=pr.keySet().iterator(); //pr이 가지고 있는것을 set으로 형변환시킴.
												  //set이 가지고 있는 값을 iterator로 변환
			while(iter.hasNext()){//커서가 없을떄 까지 돌림
				//어디에도 =이란 말이 없지만 명령어를 쓰면 자동인식
				//그래서 전제조건을 완벽하게 해서 데이터저장을 해야한다.
				String key=(String) iter.next(); //= 앞의 문자열을 가지고 오면 key값으로 인식
				String value=pr.getProperty(key);//= 뒤의 문자열을 value값으로 인식
				System.out.println(value);
			}//while
			
			/*
			 * 출력값
			 * 	1234
				java0514
				jdbc:oracle:thin:@localhost:1521:xe
				Oracle.jdbc.driver.OracleDriver
			 */
			
			
		}catch(Exception e){
			System.out.println("실패"+e);
		}
		
		
		
		
		
		
		
		
	}//main

}//class
