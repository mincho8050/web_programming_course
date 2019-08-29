package net.sungjuk;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.*;

public class SungjukDAO {
	
	//Data Access Object 데이터베이스 관련 작업
	//dto객체를 사용하기 전 insert함수
	public int insert(String uname, int kor, int eng, int mat, int aver, String addr){
		
		int cnt=0;
		
		try{
			//DB연결
			Connection con=DBOpen.getConnection();
			
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno,uname,kor,eng,mat,aver,addr,wdate) ");
			sql.append(" VALUES((SELECT NVL(MAX(sno),0)+1 FROM sungjuk) ");
			sql.append(" ,?,?,?,?,?,?,SYSDATE)");
			
			//4)SQL문 변환
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, uname);
			pstmt.setInt(2, kor);
			pstmt.setInt(3, eng);
			pstmt.setInt(4, mat);
			pstmt.setInt(5, aver);
			pstmt.setString(6, addr);
			
			
			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
		
		}catch(Exception e){
			System.out.println("행추가 실패"+e);
		}//try
		
		return cnt;
		
	}//insert
	
	//dto객체를 사용한 insert함수
	public int insert(SungjukDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO sungjuk(sno,uname,kor,eng,mat,aver,addr,wdate) ");
			sql.append(" VALUES((SELECT NVL(MAX(sno),0)+1 FROM sungjuk) ");
			sql.append(" ,?,?,?,?,?,?,SYSDATE)");
			
			//4)SQL문 변환
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());
			
			
			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("행추가 실패"+e);
		}//try
		return cnt;
	}//insert
	
	public ArrayList<SungjukDTO> list(){
		//DB에서 가져온 데이터를 list에서 모아서
		//sungjukList.jsp에 전달한다.
		ArrayList<SungjukDTO> list=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno,uname,kor,eng,mat,wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY wdate DESC ");
			
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<SungjukDTO>(); //전체저장
				do{
					SungjukDTO dto=new SungjukDTO(); //한줄저장
					dto.setSno(rs.getInt("sno"));
					dto.setUname(rs.getString("uname"));
					dto.setKor(rs.getInt("kor"));
					dto.setEng(rs.getInt("eng"));
					dto.setMat(rs.getInt("mat"));
					dto.setWdate(rs.getString("wdate"));
					list.add(dto);
				}while(rs.next());//do~while
				
			}else{
				//이걸 넣지 않아도 되지만, 그래도 넣어주는게 좋음.
				list=null;
			}//if
			
			
			
		}catch(Exception e){
			System.out.println("목록실패 : "+e);
		}
		
		return list;
	}//list 
	
	
	//상세보기페이지
	public SungjukDTO read(int sno){
		SungjukDTO dto=null;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno, uname, kor, eng, mat, aver, addr, wdate");
			sql.append(" FROM sungjuk ");
			sql.append(" WHERE sno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new SungjukDTO();
				dto.setSno(rs.getInt("sno"));
				dto.setUname(rs.getString("uname"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setAver(rs.getInt("aver"));
				dto.setAddr(rs.getString("addr"));
				dto.setWdate(rs.getString("wdate"));
			}else{
				dto=null;
			}//if
			
		}catch(Exception e){
			System.out.println("상세보기실패 : "+e);
		}//try
		
		return dto;
	};//read

	
	public int delete(int sno){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" DELETE FROM sungjuk ");
			sql.append(" WHERE sno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, sno);
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("삭제실패 : "+e);
		}//try
		
		return cnt;
	}//delete
	
	
	public int update(SungjukDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE sungjuk ");
			sql.append(" SET uname=?,kor=?,eng=?,mat=?,aver=?,addr=? ");
			sql.append(" WHERE sno=? ");
			
			//4)SQL문 변환
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUname());
			pstmt.setInt(2, dto.getKor());
			pstmt.setInt(3, dto.getEng());
			pstmt.setInt(4, dto.getMat());
			pstmt.setInt(5, dto.getAver());
			pstmt.setString(6, dto.getAddr());
			pstmt.setInt(7, dto.getSno());
			
			
			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("행추가 실패"+e);
		}//try
		return cnt;
	}//update
	
	
	

}//
