package oop0806;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test02_Select {

	public static void main(String[] args) {
		/*
		 * sungjuk 목록연습
		 */
		
		//오라클DB서버 접근 기본 정보
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user ="java0514";
		String password ="1234";
		String driver ="oracle.jdbc.driver.OracleDriver";
		/*
		 * ojdbc6.jar를 setup폴더에 복사
		 * C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
		 */
		Connection con=null;			//DB연결
		PreparedStatement pstmt=null;	//SQL변환
		ResultSet rs=null;				//select문 조회
		
		
		try {
			
			//1)드라이버로딩
			Class.forName(driver);
			//2)DB연결
			con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공!!");
			//3)SQL문 작성
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno,uname,kor,eng,mat,tot,aver,addr,wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY sno DESC ");
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()){//cursor가 존재하는지?
				System.out.println("자료있음");
				do{
					System.out.print(rs.getInt("sno")+" ");
					System.out.print(rs.getString("uname")+" ");
					System.out.print(rs.getInt("kor")+" ");
					System.out.print(rs.getInt("eng")+" ");
					System.out.print(rs.getInt("mat")+" ");
					System.out.print(rs.getInt("aver")+" ");
					System.out.print(rs.getInt("aver")+" ");
					System.out.print(rs.getString("addr")+" ");
					System.out.print(rs.getString("wdate")+" ");
					System.out.println();
				}while(rs.next()); //while문 true면 do가 실행
			}else{
				System.out.println("자료없음");
			}//if
			
			
		} catch (Exception e) {
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
			
		}//tyr
		
		
		
		
		
		
	}//main

}
