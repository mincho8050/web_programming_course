package jdbc0621;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test04_Update {

	public static void main(String[] args) {
		/*
		 * 행수정 연습
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

			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET aver=(kor+eng+mat)/3 ");
			sql.append(" WHERE uname IN ('박지성','김연아') ");
			//변환하기전까지 StringBuilder
			
			//sql문 변환
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
														//StringBuilder니까 형변환
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

