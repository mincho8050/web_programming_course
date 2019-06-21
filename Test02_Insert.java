package jdbc0621;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

class Test02_Insert {

	public static void main(String[] args) {
		/*
		 * 행 추가 연습
		 */

		try{
			//1)오라클DB 연결 관련 정보
			String url="jdbc:oracle:thin:@172.16.83.22:1521:xe";
			String user="java0514";
			String password="1234";
			String driver="oracle.jdbc.driver.OracleDriver";
			//2)드라이버 로딩 
			Class.forName(driver);
			//3)오라클 DB 서버 연결
			Connection con=DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공!!");
//---------------------DB연결-------------------------------------------
			
			
			//4)SQL문 작성
			//여기가 중요.
			String sql="";
			sql+=" INSERT INTO sungjuk(uname,kor,eng,mat)"; 
			sql+=" VALUES('박지성',90,50,60) "; 
			/*
			 * 대소문자 구분은 없지만 대문자로 작성함.
			 * 
			 *	sql+=" INSERT INTO sungjuk ";
			 *	> 칼럼명 생략 가능하지만 자바에서 헷갈리고 기억이 안날 수 있어서 
			 *	>칼럼명을 적어준다!!!!
			 *
			 *	DB에서는 문자열 구분기호 '' 임!!!
			 *
			 *  sql+=" INSERT INTO sungjuk()";
				sql+="VALUES()"; 
				지금 뒤에 공백을 안주면 한줄로 이어져서 나오기 때문에
				> " INSERT INTO sungjuk()VALUES"; 이렇게 이어져 나오기 떄문에
				앞에 공백을 준다.
				> sql+=" VALUES() "; 이렇게!
				
				그리고 종결 세미콜론 찍지 않기
				>EX) sql+=" VALUES(); ";
			 */
			//System.out.println(sql);
			//출력값  > 에러는 이렇게 공백 확인하고 하면서 잡아야함.
			//INSERT INTO sungjuk(uname,kor,eng,mat) VALUES('박지성',90,50,60)
			
			
//------------여기까지는 String이기 때문에 그냥 String 값이다---------------------------
			
			
			
			
			//5)SQL형식 변환
			/*
			 * 오라클 DB연결 성공은 DriverManager.getConnection이게 성공했다는거.
			 * > 리턴값이 있음. 변수에 담아야함.
			 * DriverManager.getConnection(url, user, password); 적지말고
			 * Connection con=DriverManager.getConnection(url, user, password);
			 * > 변수에 저장하기
			 * > DB연결했다는 값을 con이 가지고 있음. 
			 */
			PreparedStatement pstmt=con.prepareStatement(sql);
			//sql문 변환한값을 가지고 있는 자료형
			//리턴형이 prepareStatement
			//pstmt 를 가지고 실행해야함.
			
			
			//6)SQL문 실행
			int result=pstmt.executeUpdate();
			//executeUpdate()의 리턴형 int
			System.out.println("실행결과:"+result);
			/*출력 > 실행결과1
			inset된 행의 갯수가 나옴.
			행 추가가 된건지 확인가능
			만약 0이 나오면 추가되지 않은거임
			*/
			
			
//----------------이게 JDBC 기본임---------------------------------------------			
			//String 클래스에 연산자로 계속 하면 속도가 현저히 느려지기 떄문에
			//StringBuilder 나 StringBuffer 클래스 사용

			
	
			
			
			
		}catch(Exception e){
			System.out.println("실패!"+e);
		}//try
		
		
		
		
		
		
		
	}//main

}//class
