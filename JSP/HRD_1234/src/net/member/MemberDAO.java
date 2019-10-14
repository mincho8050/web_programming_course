package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBOpen;

public class MemberDAO {
	
	public int insert(MemberDTO dto) {
		int cnt=0;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO member_tbl_02 (custno, custname, phone, address, grade, city, joindate) ");
			sql.append(" VALUES((select nvl(max(custno),0)+1 from member_tbl_02),?,?,?,?,?,?)");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getGrade());
			pstmt.setString(5, dto.getCity());
			pstmt.setString(6, dto.getJoindate());
		
			cnt=pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("회원등록 실패:"+e);
		}
		
		return cnt;
	}//insert
	
	public ArrayList<MemberDTO> list() {
		ArrayList<MemberDTO> list=null;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT custno, custname, phone, address, joindate, grade, city ");
			sql.append(" FROM member_tbl_02 ");
			sql.append(" ORDER BY custno ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<MemberDTO>();
				do{
					MemberDTO dto=new MemberDTO();
					dto.setCustno(rs.getInt("custno"));
					dto.setCustname(rs.getString("custname"));
					dto.setPhone(rs.getString("phone"));
					dto.setAddress(rs.getString("address"));
					dto.setJoindate(rs.getString("joindate").substring(0,10));
					dto.setGrade(rs.getString("grade"));
					dto.setCity(rs.getString("city"));
					list.add(dto);
				}while(rs.next());
			}else{
				list=null;
			}
		}catch(Exception e){
			System.out.println("회원목록조회수정실패 : "+e);
		}//try
		return list;
	}//list
	
	
	//목록 상세보기
	public MemberDTO read(int custno) {
		MemberDTO dto=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT custno, custname, phone, address, joindate, grade, city ");
			sql.append(" FROM member_tbl_02 ");
			sql.append(" WHERE custno=? ");

			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, custno);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getString("joindate").substring(0,10));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
			}else{
				dto=null;
			}

		}catch(Exception e){
			System.out.println("회원목록조회수정실패 : "+e);
		}//try
		return dto;
	}//list
	
	//목록 업데이트
	public int update(MemberDTO dto) {
		int cnt=0;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE member_tbl_02 ");
			sql.append(" SET custname=?, phone=?, address=?, joindate=?, grade=?, city=? ");
			sql.append(" WHERE custno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getCustname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getAddress());
			pstmt.setString(4, dto.getJoindate());
			pstmt.setString(5, dto.getGrade());
			pstmt.setString(6, dto.getCity());
			pstmt.setInt(7, dto.getCustno());
		
			cnt=pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("회원수정 실패:"+e);
		}
		
		return cnt;
	}//insert
	
}//
