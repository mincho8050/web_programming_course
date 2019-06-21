package jdbc0621;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test03_Insert {

	public static void main(String[] args) {
		/*
		 * StringBuilder를 이용해 행추가하기.
		 */

		try{
			//1)오라클DB 연결 관련 정보
			String url="jdbc:oracle:thin:@172.16.83.22:1521:xe";
			String user="java0514";
			String password="1234";
			String driver="oracle.jdbc.driver.OracleDriver";
			//2)드라이버 로딩 
			Class.forName(driver);
			//3)오라클 DB 서버 연결
			Connection con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공!!");
//---------------------DB연결-------------------------------------------

			//4)SQL문 작성시 문자열 연산 속도를 고려하여
			//StringBuilder 클래스 추천
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(uname,kor,eng,mat)");
			sql.append(" VALUES('김연아',95,90,100) ");
			
			//5)SQL 형식 변환
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			//String 값이 들어가야하니 형변환
			int result=pstmt.executeUpdate();
			if(result==0){
				System.out.println("행추가실패!!");
			}else{
				System.out.println("행추가 성공!!");
			}
			
			
			
		}catch(Exception e){
			System.out.println("실패!"+e);
		}//try
		

		
	}//main

}//class
