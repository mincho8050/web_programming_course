package jdbc0625;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test03_SelectAvg {

	public static void main(String[] args) {
		/*
		 * sungjuk 테이블의 평균 구하기
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

			// 문) 주소가 서울인 행들의 국영수 평균
			String keyword="Seoul";
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT AVG(kor) AS avgkor "); //칼럼명을 넣어준다!!!!!
			sql.append(" ,AVG(eng) AS avgeng "); 
			sql.append(" ,AVG(mat) AS avgmat "); 
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE addr=? ");
			
			
			
			

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, keyword); //변수에 저장한 값을 첫번째 ?에 넣어준다.

			rs=pstmt.executeQuery();
			if(rs.next()){//cursor가 존재하는지?
				System.out.println("자료있음");
				do{
					System.out.println("국어평균:"+String.format("%.2f", rs.getDouble("avgkor")));
					System.out.println("영어평균:"+String.format("%.2f", rs.getDouble("avgeng")));
					System.out.println("수학평균:"+String.format("%.2f", rs.getDouble("avgmat")));
					
				}while(rs.next()); //while문 true면 do가 실행

			}else{
				System.out.println("자료없음");
			}//if
	
			/*
			 * 출력방법
			 	국어평균:86.67
				영어평균:78.33
				수학평균:65.00
			 */
			
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
