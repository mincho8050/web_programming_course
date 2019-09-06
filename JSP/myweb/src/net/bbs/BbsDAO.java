package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBOpen;

public class BbsDAO {
	//Data Access Object 데이터접근객체
	
	public int insert(BbsDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip) ");
			sql.append(" VALUES( ");
			sql.append(" (SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs),");
			sql.append(" ?,?,?,?, ");
			sql.append(" (SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs),? ) ");
			
			//4)SQL문 변환
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			
			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("행추가 실패"+e);
		}//try
		return cnt;
	}//insert
	
	
	
	 public ArrayList<BbsDTO> list(){
			//DB에서 가져온 데이터를 list에서 모아서
			//sungjukList.jsp에 전달한다.
			ArrayList<BbsDTO> list=null;
			try{
				Connection con=DBOpen.getConnection();
				StringBuilder sql=new StringBuilder();
				sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent");
				sql.append(" FROM tb_bbs ");
				sql.append(" ORDER BY grpno DESC, ansnum ASC ");
				//->가장 최신글이 맨 위로 댓글 내에서는 오름차순
				
				
				PreparedStatement pstmt=con.prepareStatement(sql.toString());
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()){
					list=new ArrayList<BbsDTO>(); //전체저장
					do{
						BbsDTO dto=new BbsDTO(); //한줄저장
						dto.setBbsno(rs.getInt("bbsno"));
						dto.setSubject(rs.getString("subject"));
						dto.setReadcnt(rs.getInt("readcnt"));
						dto.setWname(rs.getString("wname"));
						dto.setRegdt(rs.getString("regdt"));
						dto.setIndent(rs.getInt("indent"));
						list.add(dto);
					}while(rs.next());//do~while
					
				}else{
					//이걸 넣지 않아도 되지만, 그래도 넣어주는게 좋음.
					list=null;
				}//if
				
			}catch(Exception e){
				System.out.println("게시글 목록 읽어오기 실패 : "+e);
			}
			
			return list;
		}//list 
	 
	 
	
	 public BbsDTO read(int bbsno){
		 	BbsDTO dto=null;
			
			try{
				Connection con=DBOpen.getConnection();
				StringBuilder sql=new StringBuilder();
				sql.append(" SELECT bbsno, wname, subject, content, passwd, readcnt, regdt, grpno, indent, ansnum, ip ");
				sql.append(" FROM tb_bbs ");
				sql.append(" WHERE bbsno=? ");
				
				PreparedStatement pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, bbsno);
				
				ResultSet rs=pstmt.executeQuery();
				if(rs.next()){
					dto=new BbsDTO();
					dto.setBbsno(rs.getInt("bbsno"));
					dto.setWname(rs.getString("wname"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setReadcnt(rs.getInt("readcnt"));
					dto.setGrpno(rs.getInt("grpno"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setIp(rs.getString("ip"));
				}else{
					dto=null;
				}//if
				
			}catch(Exception e){
				System.out.println("게시글 상세 보기 실패 : "+e);
			}//try
			
			return dto;
		};//read
		
	 
	public void incrementCnt(int bbsno){
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET readcnt=readcnt+1 ");
			sql.append(" WHERE bbsno=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, bbsno);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("조회수 증가 실패 : "+e);
		}//try
	}//incrementCnt
	 
	 
	public int delete(BbsDTO dto){
        int cnt=0;
        try{
        	
            Connection con=DBOpen.getConnection();
            StringBuilder sql=new StringBuilder();
            sql.append(" DELETE FROM tb_bbs ");
            sql.append(" WHERE passwd=? AND bbsno=? ");

            PreparedStatement pstmt=con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getPasswd());
            pstmt.setInt(2, dto.getBbsno());
            
            cnt=pstmt.executeUpdate();


        }catch(Exception e){
            System.out.println("게시글 삭제 실패 : "+e);
        }//try 

        return cnt;
    }//delete
	

	
	public BbsDTO read2(BbsDTO dto){
	 	
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT bbsno, wname, subject, content, passwd, readcnt, regdt, grpno, indent, ansnum, ip ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE bbsno=? AND passwd=? ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			pstmt.setString(2, dto.getPasswd());
			
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new BbsDTO();
				dto.setBbsno(rs.getInt("bbsno"));
				dto.setWname(rs.getString("wname"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setReadcnt(rs.getInt("readcnt"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setIp(rs.getString("ip"));
			}else{
				dto=null;
			}//if
			
		}catch(Exception e){
			System.out.println("게시글 상세 보기 실패 : "+e);
		}//try
		
		return dto;
	};//read
	
	
	public int update(BbsDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" UPDATE tb_bbs");
			sql.append(" SET wname=?, subject=?, content=?, passwd=? ");
			sql.append(" WHERE bbsno=? ");
			
			//4)SQL문 변환
			PreparedStatement pstmt=null;
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getBbsno());

			//5)SQL문 실행
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("게시글 수정 실패"+e);
		}//try
		return cnt;
	}//update
	
	
	//답변등록
	public int reply(BbsDTO dto){
		int cnt=0;
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
		    
			//1)부모글 정보 가져오기(SELECT문)
			//(grpno, intent, ansnum 담기)
			int grpno=0, indent=0, ansnum=0;
			sql.append(" SELECT grpno, indent, ansnum ");
			sql.append(" FROM tb_bbs ");
			sql.append(" WHERE bbsno=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getBbsno());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				grpno=rs.getInt("grpno");
				indent=rs.getInt("indent");
				ansnum=rs.getInt("ansnum");
			}//if
			
			//2)글순서 재조정하기(UPDATE문)
			//SQL문을 작성할때 다시 변수를 만들거나 재활용하면 초기화해야함
			sql.delete(0, sql.length());//>1)에서 사용했던 sql참조변수값을 초기화 후 사용
			sql.append(" UPDATE tb_bbs ");
			sql.append(" SET ansnum=ansnum+1 ");
			sql.append(" WHERE grpno=? AND ansnum>? ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
			
			
			//3)답변글 추가하기(INSERT문)
			sql.delete(0, sql.length());
			sql.append(" INSERT INTO tb_bbs (bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum) ");
			sql.append(" VALUES( (SELECT NVL(MAX(bbsno),0)+1 FROM tb_bbs) ");
			sql.append(" ,?,?,?,?,?,?,?,?) ");
			
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getIp());
			pstmt.setInt(6, grpno);		//부모글 그룹번호
			pstmt.setInt(7, indent+1);	//부모글 들여쓰기+1
			pstmt.setInt(8, ansnum+1);	//부모글 글순서+1
			
			cnt=pstmt.executeUpdate();
			
			
		}catch(Exception e){
			System.out.println("답변 작성 실패"+e);
		}//try
		return cnt;
		
	}//reply
	
	
		
	
	
}//





















