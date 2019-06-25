package jdbc0625;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test01_SelectAll {

	public static void main(String[] args) {
		/*
		 * sungjuk 테이블 전체 목록을 sno 칼럼순으로 정렬해서 출력하시오
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
			sql.append(" SELECT sno,uname,kor,eng,mat,aver,addr,wdate");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY sno ");	//오름차순으로 정렬해서 보기
			
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()){//cursor가 존재하는지?
				System.out.println("자료있음");
				do{
					System.out.print(rs.getInt("sno")+" ");//sno
					System.out.print(rs.getString("uname")+" ");//uname
					System.out.print(rs.getInt("kor")+" ");//kor
					System.out.print(rs.getInt("eng")+" ");//eng
					System.out.print(rs.getInt("mat")+" ");//mat
					System.out.print(rs.getInt("aver")+" ");//aver
					System.out.print(rs.getString("addr")+" ");//addr
					System.out.print(rs.getString("wdate").substring(0,10)+" ");//wdate
									//String값으로 받는게 편함. 그냥 String 값으로 받으면
									//시분초 까지 나오니까 원하는 자릿수까지 잘라서 사용하기.
									//substring 사용하기!
					System.out.println();
				}while(rs.next()); //while문 true면 do가 실행
			}else{
				System.out.println("자료없음");
			}//if
			/*
			 * 출력값
			 	1 무궁화 100 95 80 91 Seoul 2019-06-24 
				2 진달래 90 50 90 76 Jeju 2019-06-24 
				3 개나리 20 50 25 30 Jeju 2019-06-24 
				4 봉선화 90 90 90 90 Seoul 2019-06-24 
				5 나팔꽃 50 50 90 63 Suwon 2019-06-24 
				6 선인장 70 50 25 46 Seoul 2019-06-24 
				7 소나무 90 60 90 80 Busan 2019-06-24 
				8 참나무 20 20 25 20 Jeju 2019-06-24 
				9 홍길동 90 90 90 90 Suwon 2019-06-24 
				10 무궁화 80 80 90 83 Suwon 2019-06-24 
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
