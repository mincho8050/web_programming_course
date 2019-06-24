package jdbc0621;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test07_SelectAll {

	public static void main(String[] args) {
		/*
		 * 행 읽기 연습(전체목록)
		 */

		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="java0514";
		String password="1234";
		String driver="oracle.jdbc.driver.OracleDriver";
		
		//자원반납해야하는것.
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			//2)드라이버 로딩 
			Class.forName(driver);
			//3)오라클 DB 서버 연결
			con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공!!");
//---------------------DB연결-------------------------------------------

			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT uname,kor,eng,mat,aver");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY uname ");	//오름차순으로 정렬해서 보기
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()){//cursor가 존재하는지?
				System.out.println("자료있음");
				do{
					System.out.print(rs.getString("uname")+" ");//uname
					System.out.print(rs.getInt("kor")+" ");//kor
					System.out.print(rs.getInt("eng")+" ");//eng
					System.out.print(rs.getInt("mat")+" ");//mat
					System.out.print(rs.getInt("aver")+" ");//aver
					System.out.println();
				}while(rs.next()); //while문 true면 do가 실행
			}else{
				System.out.println("자료없음");
			}//if

			
		}catch(Exception e){
			System.out.println("실패!"+e);
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
