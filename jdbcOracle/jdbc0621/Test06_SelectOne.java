package jdbc0621;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test06_SelectOne {

	public static void main(String[] args) {
		/*
		 * 행 읽기 연습
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
			sql.append("WHERE uname='라일락' ");
			
			pstmt=con.prepareStatement(sql.toString());
			//int result=pstmt.executeUpdate(); 
			//executeUpdate()는 insert문,update문,delete문 사용할 때 사용.
			rs=pstmt.executeQuery();	//select문에서 사용
			//리턴값이 ResultSet 
			//cursor : 가리키는 값. 이동할 수 있다.
			if(rs.next()){//cursor가 존재하는지?
				System.out.println("자료있음");
				//1) 칼럼순서로 출력 > 순서중요
				//sql.append(" SELECT uname,kor,eng,mat,aver");
				// > 여기에 쓴 순서대로 출력하기 때문에 자료형 맞춰주기.
				System.out.print(rs.getString(1)+" ");//uname
				System.out.print(rs.getInt(2)+" ");//kor
				System.out.print(rs.getInt(3)+" ");//eng
				System.out.print(rs.getInt(4)+" ");//mat
				System.out.print(rs.getInt(5)+" ");//aver
				System.out.println();
				//출력값 라일락 30 80 40 50 
				
				//2) 칼럼명으로 접근
				// > 자바니까 ""안에 적어야한다.
				System.out.print(rs.getString("uname")+" ");//uname
				System.out.print(rs.getInt("kor")+" ");//kor
				System.out.print(rs.getInt("eng")+" ");//eng
				System.out.print(rs.getInt("mat")+" ");//mat
				System.out.print(rs.getInt("aver")+" ");//aver
				System.out.println();
				//출력값 라일락 30 80 40 50
			}else{
				System.out.println("자료없음");
				//sql.append("WHERE uname='라일' "); 없는 데이터 입력시
				//자료없음 출력됨.
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
