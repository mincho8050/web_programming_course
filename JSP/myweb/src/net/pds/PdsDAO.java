package net.pds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.Utility;
import DBPKG.DBOpen;

public class PdsDAO {
	
	
	//사진추가
	public boolean insert(PdsDTO dto){
		boolean flag=false;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO tb_pds(pdsno, wname, subject, passwd, filename, filesize, regdate) ");
			sql.append(" VALUES ( ");
			sql.append(" (SELECT NVL(MAX(pdsno),0)+1 FROM tb_pds) ");
			sql.append(" ,?,?,?,?,?,SYSDATE) ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getFilename());
			pstmt.setLong(5, dto.getFilesize());
			
			int cnt=pstmt.executeUpdate();
			
			if(cnt!=0){
				flag=true;
			}
			
		}catch(Exception e){
			System.out.println("사진 업로드 실패 : "+e);
		}//try
		
		
		return flag;
	}//insert
	
	//사진 리스트 불러오기
	//synchronized 라고 하면 문제가 생기면 os의 도움을 받을 수 있음.
	//많은 사람들이 공유하는 DAO을 이용할때는 synchronized를 붙여주는게 좋다
	public synchronized ArrayList<PdsDTO> list(){
		ArrayList<PdsDTO> list=null;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT pdsno, wname, subject, regdate, passwd, readcnt, filename ");
			sql.append(" FROM tb_pds ");
			sql.append(" ORDER BY regdate DESC ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<PdsDTO>();
				do{
					PdsDTO dto=new PdsDTO();
					dto.setPdsno(rs.getInt("pdsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setRegdate(rs.getString("regdate"));
					dto.setPasswd(rs.getString("passwd"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setFilename(rs.getString("filename"));
					list.add(dto);
				}while(rs.next());//do~while
				
			}else{
				list=null;
			}//if
			
		}catch(Exception e){
			System.out.println("목록 읽어오기 실패 : "+e);
		}//try
		
		return list;
	}//list
	
	
	//사진 상세보기
	public PdsDTO read(int pdsno) {
		PdsDTO dto=null; 
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT pdsno, wname, subject, regdate, passwd, readcnt, filename, filesize ");
			sql.append(" FROM tb_pds ");
			sql.append(" WHERE pdsno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new PdsDTO();
				dto.setPdsno(rs.getInt("pdsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getLong("filesize"));
			}else{
				dto=null;
			}//if
			
			
		}catch(Exception e){
			System.out.println("사진 상세보기 실패 : "+e);
		}//try
		
		return dto;
	}//read
	
	
	//조회수 증가
	public void incrementCnt(int pdsno){
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE tb_pds ");
			sql.append(" SET readcnt=readcnt+1 ");
			sql.append(" WHERE pdsno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, pdsno);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("조회수 증가 실패 : "+e);
		}//try
	}//incrementCnt
	
	
	//사진 삭제
	public int delete(int pdsno, String passwd, String saveDir){
		int cnt=0;
		
		try{
			//삭제하고자 하는 파일명을 가져온다
			String filename="";
			PdsDTO oldDTO=read(pdsno); //상세보기함수
			if(oldDTO!=null){
				filename=oldDTO.getFilename();
			}//if
			
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" DELETE FROM tb_pds ");
			sql.append(" WHERE passwd=? AND pdsno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, passwd);
            pstmt.setInt(2, pdsno);
                        
            cnt=pstmt.executeUpdate();
            if(cnt==1){//테이블에서 행삭제가 성공했으므로 
            		   //첨부된 파일도 삭제 (경로와 파일명을 알아야함)
            		   //경로는 saveDir
            	Utility.deleteFile(saveDir,filename);           	
            }
			
		}catch(Exception e){
			System.out.println("사진 삭제 실패 : "+e);
		}
		
		return cnt;
	}//delete
	
}//class
