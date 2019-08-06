package oop0806;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test01_Insert {

	public static void main(String[] args) {
		/*
		 * sungjuk 테이블 행추가 연습
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
			String uname="박지성";
			int kor=50, eng=60, mat=65;
			int tot=kor+eng+mat;
			int aver=tot/3;
			String addr="Suwon";
			
			sql.append(" INSERT INTO sungjuk(sno,uname,kor,eng,mat,tot,aver,addr,wdate)");
			sql.append(" VALUES(sungjuk_seq.NEXTVAL,?,?,?,?,?,?,?,SYSDATE)");
			
			//4)SQL문 변환
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, uname);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, eng);
			pstmt.setInt(4, mat);
			pstmt.setInt(5, tot);
			pstmt.setInt(6, aver);
			pstmt.setString(7, addr);
			
			//5)SQL문 실행
			int count=pstmt.executeUpdate();
			if(count==0){
				System.out.println("행삽입 실패");
			}else{
				System.out.println("행삽입 성공");
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
				if(pstmt!=null){pstmt.close();}
			}catch(Exception e){}
			
			try{
				if(con!=null){con.close();}
			}catch(Exception e){}
			
		}//tyr
		
		
		
		
		
		
	}//main

}
