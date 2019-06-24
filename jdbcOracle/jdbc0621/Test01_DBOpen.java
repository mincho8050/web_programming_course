package jdbc0621;

import java.sql.DriverManager;

public class Test01_DBOpen {

	public static void main(String[] args) {
		/*
		 * JDBC(Java Database Connection)
		 * 자바와 데이터베이스를 연동
		 */

		try{
			//자바와 오라클DB 연결하기 위한 클래스들이 필요.
			//>위의 클래스들을 압축해 놓은 라이브러리를 오라클 사에서 제공(.jar)
			//>오라클 로그인 후 다운로드를 하거나
			//>또는 오라클 설치 폴더에서 복사해서 사용(ojdbc6.jar)
			//>경로>C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
			
			//1)오라클DB 연결 관련 정보
			String url="jdbc:oracle:thin:@172.16.83.22:1521:xe";	//오라클 서버 어디에 있는지.
			//172.16.83.22 이 부분은 고정아이피니까 본인거 들어갈땐 loclahost라고 해도 됨.
			String user="java0514";
			String password="1234";	//이게 제일 많이 바뀜
			String driver="oracle.jdbc.driver.OracleDriver";
			//패키지와 패키지 사이는 . 으로 구분 , .class는 생략
			
			//2)드라이버 로딩 
			Class.forName(driver);
			
			//3)오라클 DB 서버 연결
			DriverManager.getConnection(url, user, password);
			System.out.println("오라클DB 서버 연결 성공!!");
			
		}catch(Exception e){
			System.out.println("오라클DB 연결 실패!"+e);
		}//try
		
		
		/*
		 * java.lang.ClassNotFoundException: oracle.jdbc.driver.OracleDriver
		 * >에러 메세지.
		 * >oracle.jdbc.driver.OracleDriver 이 클래스가 없다.
		 * >ojdbc6.jar를 연결해줘야한다. 
		 * 	>프로젝트 우클릭 >Build Path > Configure Build Path > Libraries에서 넣기
		 * 	>JSP에서는 넣는 폴더가 따로 있다고함.
		 */
		/*
		 * Oracle 서버가 꺼져있을때 뜨는 오류 메세지.
		 * java.sql.SQLException: Listener refused the connection with the following error:
ORA-12505, TNS:listener does not currently know of SID given in connect descriptor
		 */
		
		
	}//main

}//class
