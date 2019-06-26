package jdbc0625;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test04_SelectLike {

	public static void main(String[] args) {
		/*
		 * like 연산자 연습
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

			//문) 이름에 '나' 문자가 있는 행들을 조회하시오.
			//-> WHERE uname like '%나%'
			//테이블명,칼럼명도 ? 변수처리 할 수 있다.
			//주의사항은 ?를 써야할 위치를 조심해야한다. 자바에서 못 읽어올 수 있다. 
			//? 는 값이 들어가있는 부분에 사용. 물리적으로 만든 테이블과 칼럼은 직접적으로 ?가 먹히지 않음.
			//꼭 물음표 없이도 변수를 담을 수 있다. 
			
			String col="uname";
			String keyword="나";
			//String where="WHERE "+col+" LIKE "+"'%"+keyword+"%' ";
			//where 변수를 출력했을때 WHERE uname like '%나%' 출력되어야함.

			//StringBuilder 클래스를 이용한 where변수!!
			StringBuilder where=new StringBuilder(); 
			where.append("WHERE "+col+" LIKE "+"'%"+keyword+"%' ");
			
			//System.out.println(where.toString()); //테스트
			
			StringBuilder sql=new StringBuilder();
/*			sql.append(" SELECT uname,kor,eng,mat,aver,addr,wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE UNAME LIKE '%?%' ");
			-> 그냥 이렇게 하면 안됨.
			String where="WHERE "+col+" LIKE "+"'%"+keyword+"%'";
			이런식으로 where변수에 넣어주는 식으로 해야함
			*/
			sql.append(" SELECT sno,uname,kor,eng,mat,aver,addr,wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(where);
			sql.append(" ORDER BY uname ");
			
			
			/*
			 * 게시판 쿼리문은
			 * WHERE SUBJECT LIKE '%happy%'	
			 * WHERE UNAME LIKE '%happy%'	-제목
			 * WHERE CONTENT LIKE '%happy%'		-본문
			 */

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
					System.out.println();
				 

				}while(rs.next()); //while문 true면 do가 실행

			}else{
				System.out.println("자료없음");
			}//if
	
			/*
			 * 출력결과
				개나리 20 50 25 30 Jeju 2019-06-24 
				나팔꽃 50 50 90 63 Suwon 2019-06-24 
				소나무 90 60 90 80 Busan 2019-06-24 
				참나무 20 20 25 20 Jeju 2019-06-24 
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
