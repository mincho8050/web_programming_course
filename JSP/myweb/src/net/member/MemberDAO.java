package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.bbs.BbsDTO;
import DBPKG.DBOpen;

public class MemberDAO {
	
	//로그인
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
	
	//회원가입 이메일 중복확인
	public int duplecateEmail(String email){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			//가상의 테이블명을 안 정해주면 오류
			sql.append(" SELECT COUNT(email) as cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE email=? ");
				
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt"); //여기서 사용해야 하니까
			}
				
			}catch(Exception e){
				System.out.println("Email 중복확인 실패 : "+e);
			}
		return cnt;
	}//duplecateEmail 
	
	
	//회원가입 등록
	public int insert(MemberDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate) ");
			sql.append(" VALUES(?,?,?,?,?,?,?,?,?,'D1',SYSDATE) ");
			
			//4)SQL문 변환
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getJob());
	
			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("행추가 실패"+e);
		}//try
		return cnt;
	}//insert
	
	
}//
