package kr.co.mymelon.media;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBOpen;

public class MediaDAO {
	
	//파일 저장
	public int create(MediaDTO dto) {
		int cnt=0;
		
		try {
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO media(mediano, title, poster, filename, filesize, rdate) ");
			sql.append(" VALUES((SELECT NVL(MAX(mediano),0)+1 AS mediano FROM media),?,?,?,?,SYSDATE) ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getPoster());
			pstmt.setString(3, dto.getFilename());
			pstmt.setLong(4, dto.getFilesize());
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("행추가실패:"+e);
		}//try
		
		return cnt;
	}//create
	
	public ArrayList<MediaDTO> list() {
		ArrayList<MediaDTO> list=null;
		try {
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT mediano, title, poster, filename, filesize, rdate, mview ");
			sql.append(" FROM media ");
			sql.append(" WHERE mview='Y' ");
			sql.append(" ORDER BY mediano DESC ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				list=new ArrayList<MediaDTO>();
				do {
					MediaDTO dto=new MediaDTO();
					dto.setMediano(rs.getInt("mediano"));
					dto.setTitle(rs.getString("title"));
					dto.setPoster(rs.getString("poster"));
					dto.setFilename(rs.getString("filename"));
					dto.setFilesize(rs.getLong("filesize"));
					dto.setRdate(rs.getString("rdate"));
					dto.setMview(rs.getString("mview"));
					list.add(dto);
				}while(rs.next());
			}else {
				list=null;
			}//if
			
		}catch (Exception e) {
			System.out.println("읽기실패:"+e);
		}//try
		
		return list;
	}//list
	
	public MediaDTO read(int mediano) {
		MediaDTO dto=null;
		
		try {
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT mediano, title, poster, filename, filesize, rdate, mview ");
			sql.append(" FROM media ");
			sql.append(" WHERE mediano=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, mediano);
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				dto=new MediaDTO();
				dto.setMediano(rs.getInt("mediano"));
				dto.setTitle(rs.getString("title"));
				dto.setPoster(rs.getString("poster"));
				dto.setFilename(rs.getString("filename"));
				dto.setFilesize(rs.getLong("filesize"));
				dto.setRdate(rs.getString("rdate"));
				dto.setMview(rs.getString("mview"));
			}else {
				dto=null;
			}//if
			
		}catch (Exception e) {
			System.out.println("상세보기 실패:"+e);
		}//
		
		return dto;
	}//read
	
	public int update(MediaDTO dto) {
		int cnt=0;
		
		try {
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE media ");
			sql.append(" SET title=?, poster=?, filename=?, filesize=? ");
			sql.append(" WHERE mediano=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getPoster());
			pstmt.setString(3, dto.getFilename());
			pstmt.setLong(4, dto.getFilesize());
			pstmt.setInt(5, dto.getMediano());
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("업데이트 실패:"+e);
		}//try
		
		return cnt;
	}//update
	
	
}//
