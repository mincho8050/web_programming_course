package oop0806;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import oracle.jdbc.internal.OracleTypes;

public class Test09_sungjukCount {

	public static void main(String[] args) {
		/*
		 * 프로시저를 이용한
		 * sungjuk 테이블 카운트연습
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
			sql.append(" {call sungjukCount(?)} ");
			cstmt=con.prepareCall(sql.toString());
			//1 -> 첫번째 ? 인덱스
			//OracleTypes.CURSOR 조회하고자 하는 DB서버 커서
			cstmt.registerOutParameter(1, OracleTypes.CURSOR);
			cstmt.execute();


			
			//1이 의미하는 것 -> (1, OracleTypes.CURSOR)
			rs=(ResultSet) cstmt.getObject(1);
			if(rs.next()){
				System.out.println("자료있음");
				System.out.print(rs.getFloat("cnt")+"개");
			}else{
				System.out.println("자료없음");
			}
			
			
			
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
			
		}//try
		
		
		
		
		
		
	}//main

}
