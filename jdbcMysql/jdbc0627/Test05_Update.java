package jdbc0627;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test05_Update {

	public static void main(String[] args) {
		/*
		 * JDBC(Java Database Connection)
		 * 자바와 MySQL 데이터베이스를 연동
		 * mysql-connector-java-5.1.47.jar 라이브러리 필요
		 * DB명 -> java0514
		 */
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		try{

			String url="jdbc:mysql://localhost:3306/java0514?useUnicode=true&characterEncoding=euckr";
			String user="root";
			String password="1234";
			String driver="org.gjt.mm.mysql.Driver";
			

			Class.forName(driver);

			con=DriverManager.getConnection(url, user, password);
			System.out.println("MySQL DB 서버 연결 성공!!");
//----------MySQL DB연결-------------------------------------------------------------------------------------------
			
			
			
			
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET tot=(kor+eng+mat) ");
			sql.append(" ,aver=(kor+eng+mat)/3 ");
			
			pstmt=con.prepareStatement(sql.toString());
			
			int result=pstmt.executeUpdate();
			if(result==0){
				System.out.println("행수정 실패");
			}else{
				System.out.println("행수정 성공");
			}
			
			
			
		}catch(Exception e){
			System.out.println("MySQL DB 연결 실패!"+e);
		}finally{
			//자원반납(순서주의!!!!!!)
			//맨 처음에 열었던걸 나중에 닫기 > 역순
			
			try{
				if(rs!=null){rs.close();}
			}catch(Exception e){}
			
			try{
				if(pstmt!=null){pstmt.close();}
			}catch(Exception e){}
			
			try{
				if(con!=null){con.close();}
			}catch(Exception e){}
			

			
		}//try
		
		
		
		
	}//main

}//class
