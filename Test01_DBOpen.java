package jdbc0627;

import java.sql.DriverManager;

public class Test01_DBOpen {

	public static void main(String[] args) {
		/*
		 * JDBC(Java Database Connection)
		 * 자바와 MySQL 데이터베이스를 연동
		 * mysql-connector-java-5.1.47.jar 라이브러리 필요
		 * DB명 -> java0514
		 */

		try{

			String url="jdbc:mysql://localhost:3306/java0514?useUnicode=true&characterEncoding=euckr";
			String user="root";
			String password="1234";
			String driver="org.gjt.mm.mysql.Driver";
			

			Class.forName(driver);

			DriverManager.getConnection(url, user, password);
			System.out.println("MySQL DB 서버 연결 성공!!");
			
			
			
			
			
			
			
			
			
			
		}catch(Exception e){
			System.out.println("MySQL DB 연결 실패!"+e);
		}//try
		
		
		
		
	}//main

}//class
