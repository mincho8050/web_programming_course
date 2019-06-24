package jdbc0621;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Test05_Delete {

	public static void main(String[] args) {
		/*
		 * 행삭제 연습
		 */
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try{
			//1)오라클DB 연결 관련 정보
			String url="jdbc:oracle:thin:@172.16.83.22:1521:xe";
			String user="java0514";
			String password="1234";
			String driver="oracle.jdbc.driver.OracleDriver";
			//2)드라이버 로딩 
			Class.forName(driver);
			//3)오라클 DB 서버 연결
			con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공!!");
//---------------------DB연결-------------------------------------------

			StringBuilder sql=new StringBuilder();
			sql.append(" DELETE FROM sungjuk ");
			sql.append(" WHERE uname ='박지성' ");
			//변환하기전까지 StringBuilder
			
			//sql문 변환
			PreparedStatement prtmt=con.prepareStatement(sql.toString());
														//StringBuilder니까 형변환
			int result=prtmt.executeUpdate();
							//insert문,update문,delete문 사용할 때 사용.
			if(result==0){
				System.out.println("행삭제 실패!!");
			}else{
				System.out.println("행삭제 성공!!");
			}

			
			
		}catch(Exception e){
			System.out.println("실패!"+e);
		}finally{
			//자원반납(순서주의!!!!!!)
			//맨 처음에 열었던걸 나중에 닫기
			try{
				if(pstmt!=null){pstmt.close();}
			}catch(Exception e){}
			
			try{
				if(con!=null){con.close();}
			}catch(Exception e){}
			
			
		}//try

		
		
		
	}//main

}//class
