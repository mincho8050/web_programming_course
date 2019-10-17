package kr.co.form1.test01;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBPKG.DBOpen;

public class MemberDAO {
	//회원가입 아이디 중복확인
	public int duplecateID(String id){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			//가상의 테이블명을 안 정해주면 오류
			sql.append(" SELECT COUNT(id) as cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
					
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt"); //여기서 사용해야 하니까
			}
				
			}catch(Exception e){
				System.out.println("ID 중복확인 실패 : "+e);
			}
				
			return cnt;
		}//duplecateID
}//
