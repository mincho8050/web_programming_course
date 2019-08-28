package net.sungjuk;

import java.sql.Connection;
import java.sql.PreparedStatement;

import net.utility.*;

public class SungjukDAO {
	//Data Access Object 데이터베이스 관련 작업
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
	
	
	
	

}//
