package jdbc0627;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test04_SelectAll {

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
			sql.append(" SELECT sno,uname,kor,eng,mat,tot,aver,regdt ");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY sno DESC "); //내림차순
			
			pstmt=con.prepareStatement(sql.toString());
			
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("자료있음");
	
				do{

					System.out.print(rs.getInt("sno")+" ");
					System.out.print(rs.getString("uname")+" ");
					System.out.print(rs.getInt("kor")+" ");
					System.out.print(rs.getInt("eng")+" ");
					System.out.print(rs.getInt("mat")+" ");
					System.out.print(rs.getInt("tot")+" ");
					System.out.print(rs.getInt("aver")+" ");
					System.out.print(rs.getString("regdt").substring(0,10)+" ");
					System.out.println();
				}while(rs.next());
				
				
			}else{
				System.out.println("자료없음");
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
