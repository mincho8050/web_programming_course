package jdbc0625;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test05_SelectTest01 {

	public static void main(String[] args) {


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

			//문) 제주에 살면서 이름에 '나'문자가 있는 행들의 국영수 평균을 반올림해서
			//소수점 둘째짜리까지 구한 후 국영수 평균값 출력하시오
			
			String col1="uname";
			String col2="addr";
			String keyword1="나";
			String keyword2="Jeju";
			StringBuilder where=new StringBuilder(); 
			where.append("WHERE "+col1+" LIKE "+"'%"+keyword1+"%' "+"AND "+col2+"="+"'"+
			keyword2+"'");
			//WHERE uname LIKE '%나%' AND addr='Jeju'; 이렇게 작성
			//System.out.println(where.toString()); //테스트
			
			StringBuilder sql=new StringBuilder();

			sql.append(" SELECT ROUND(AVG(kor),2) AS avg_kor ");
			sql.append(" ,ROUND(AVG(eng),2) AS avg_eng ");
			sql.append(" ,ROUND(AVG(mat),2) AS avg_mat ");
			sql.append(" FROM sungjuk ");
			sql.append(where);


			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()){//cursor가 존재하는지?
				System.out.println("자료있음");
				do{
					System.out.print("국어평균:"+rs.getString("avg_kor")+"점"+" ");
					System.out.print("영어평균:"+rs.getString("avg_eng")+"점"+" ");
					System.out.print("수학평균:"+rs.getString("avg_mat")+"점"+" ");
					System.out.println();
				}while(rs.next()); //while문 true면 do가 실행

			}else{
				System.out.println("자료없음");
			}//if
	
			/*
			 * 출력결과
				국어평균:20점 영어평균:35점 수학평균:25점
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
