package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBPKG.DBOpen;

public class MemberDAO {
	
	public String loginProc(MemberDTO dto){
		String mlevel=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT mlevel ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? AND passwd=? ");
			sql.append(" AND mlevel in ('A1', 'B1', 'C1', 'D1') ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				mlevel=rs.getString("mlevel");
			}else{
				mlevel=null;
			}
			
		}catch(Exception e){
			System.out.println("로그인 실패 : "+e);
		}
		return mlevel;
	}//loginProc
	
	
	
	
}//
