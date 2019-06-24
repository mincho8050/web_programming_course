package jdbc0621;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test08_Insert {

	public static void main(String[] args) {
		/*
		 * 행 추가 연습(변수)
		 */

		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="java0514";
		String password="1234";
		String driver="oracle.jdbc.driver.OracleDriver";
		
		//자원반납해야하는것.
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null; //여기선 있어도 되고 없어도 되는거.
		
		try{
			//2)드라이버 로딩 
			Class.forName(driver);
			//3)오라클 DB 서버 연결
			con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공!!");
//---------------------DB연결-------------------------------------------
			//문) '이강인'의 국영수 점수와 평균 점수를 수정하시오
			String uname="이강인";
			int kor=95,eng=40,mat=60;
			int aver=(kor+eng+mat)/3;
			
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET kor=?,eng=?,mat=?,aver=? ");//?는 변수처리
			sql.append(" WHERE uname=? ");//'?'라고 하면 문자열?이기 떄문에 따옴표 삭제 후 ?

			pstmt=con.prepareStatement(sql.toString());
			// ? 순서와 ?에 들어갈 자료형 주의 -> ?의 갯수와 자료형이 일치되어야한다.
			pstmt.setInt(1, kor);//1-첫번째 ?, kor칼럼
			pstmt.setInt(2, eng);//2->두번째 ?, eng칼럼
			pstmt.setInt(3, mat);//3->세번째 ?, mat칼럼
			pstmt.setInt(4, aver);//4->네번째 ?, aver칼럼
			pstmt.setString(5, uname);//5 -> 다섯번째 ?, "" uname칼럼
			
			int count=pstmt.executeUpdate();
			if(count==0){
				System.out.println("행수정 실패");
			}else{
				System.out.println("행수정 성공");
			}
			

			
			
			
			
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
