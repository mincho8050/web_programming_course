package oop0806;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class Test03_ProcedureInsert {

	public static void main(String[] args) {
		/*
		 * 프로시저를 이용한
		 * sungjuk 테이블 행추가
		 */
		
		//오라클DB서버 접근 기본 정보
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String user ="java0514";
		String password ="1234";
		String driver ="oracle.jdbc.driver.OracleDriver";
		
		Connection con=null;			//DB연결
		//프로시저 호출관련 인터페이스
		CallableStatement cstmt=null;
		ResultSet rs=null;				//select문 조회
		
		
		try {
			
			//1)드라이버로딩
			Class.forName(driver);
			//2)DB연결
			con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공!!");
			
			
			StringBuilder sql=new StringBuilder();
			//sungjukInsert 프로시저 호출하기
			//프로시저 호출형식
			//con.prepareCall("{call 프로시저이름(?,?,?)}")
			sql.append(" {call sungjukInsert(?,?,?,?,?)} ");
			
			cstmt=con.prepareCall(sql.toString());
			cstmt.setString(1, "호날두");
			cstmt.setInt(2, 90);
			cstmt.setInt(3, 95);
			cstmt.setInt(4, 20);
			cstmt.setString(5, "Seoul");
			
			int cnt=cstmt.executeUpdate();
			System.out.println(cnt); //1 나오면 성공
			
			
			
		} catch (Exception e) {
			System.out.println("실패!"+e);
		}finally{
			
			//자원반납(순서주의!!!!!!)
			//맨 처음에 열었던걸 나중에 닫기 > 역순
			
			try{
				if(rs!=null){rs.close();}
			}catch(Exception e){}
			
			try{
				if(cstmt!=null){cstmt.close();}
			}catch(Exception e){}
			
			try{
				if(con!=null){con.close();}
			}catch(Exception e){}
			
		}//tyr
		
		
		
		
		
		
	}//main

}
