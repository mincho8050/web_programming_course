package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBOpen;

public class BbsDAO {
	//Data Access Object 데이터접근객체
	
	//글추가
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
	
	
	//전체리스트-리스트1
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
					
				}
				
			}catch(Exception e){
				System.out.println("게시글 목록 읽어오기 실패 : "+e);
			}
			
			return list;
		}//list 1
	

	//상세보기1
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
		
	//글조회수
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
	 
	//글삭제
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
	

	//상세보기2-DTO이용
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
	
	//글수정
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
	
	//검색리스트-리스트2
	public ArrayList<BbsDTO> list(String col, String word){
			
			ArrayList<BbsDTO> list=null;
			try{
	            Connection con=DBOpen.getConnection();
	            StringBuilder sql=new StringBuilder();
	            sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent");
				sql.append(" FROM tb_bbs ");
	            
	            if(word.trim().length()>=1){ //검색어 있다면?
	                String search="";
	                if(col.equals("wname")){
	                    search+=" WHERE wname LIKE '%" + word + "%' ";
	                }else if(col.equals("subject")){
	                    search+=" WHERE subject LIKE '%" + word + "%' ";
	                }else if(col.equals("content")){
	                    search+=" WHERE content LIKE '%" + word + "%' ";
	                }else if(col.equals("subject_content")){
	                    search+=" WHERE subject LIKE '%" + word + "%' ";
	                    search+=" OR content LIKE '%" + word + "%' ";
	                }//if end
	                sql.append(search);
	            }//if end            
	            
	            sql.append(" ORDER BY grpno DESC, ansnum ASC");
				
				
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
					
				}
				
			}catch(Exception e){
				System.out.println("검색 실패 : "+e);
			}
			
			return list;
		}//list 2
	
	//글 갯수
	public int count(String col, String word){
		
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) AS cnt ");
			sql.append(" FROM tb_bbs ");
			
			if(word.trim().length()>=1){ //검색어 있다면?
                String search="";
                if(col.equals("wname")){
                    search+=" WHERE wname LIKE '%" + word + "%' ";
                }else if(col.equals("subject")){
                    search+=" WHERE subject LIKE '%" + word + "%' ";
                }else if(col.equals("content")){
                    search+=" WHERE content LIKE '%" + word + "%' ";
                }else if(col.equals("subject_content")){
                    search+=" WHERE subject LIKE '%" + word + "%' ";
                    search+=" OR content LIKE '%" + word + "%' ";
                }//if end
                sql.append(search);
            }//if end
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
			}
			
			
		}catch(Exception e){
			System.out.println("글 갯수 실패 : "+e);
		}
		
		
		return cnt;

	}//totalRecord
	
	//페이지리스트-리스트3
	public ArrayList<BbsDTO> list(String col, String word, int nowPage, int recordPerPage){
        ArrayList<BbsDTO> list=null;
        
        // 페이지당 출력할 레코드 갯수 (10개를 기준)
        // 1 page : WHERE r>=1 AND r<=10
        // 2 page : WHERE r>=11 AND r<=20
        // 3 page : WHERE r>=21 AND r<=30
        int startRow = ((nowPage-1) * recordPerPage) + 1 ;
        int endRow   = nowPage * recordPerPage;
        
        try{
            Connection con=DBOpen.getConnection();
            StringBuilder sql=new StringBuilder();
          
          word = word.trim(); //검색어의 좌우 공백 제거
          
          if(word.length()==0) { //검색을 하지 않는 경우
            sql.append(" SELECT bbsno,subject,wname,readcnt,indent,regdt, r");
            sql.append(" FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r");
            sql.append("       FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt");
            sql.append("              FROM tb_bbs");
            sql.append("              ORDER BY grpno DESC, ansnum ASC");
            sql.append("           )");
            sql.append("     )");
            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
          } else {
            //검색을 하는 경우
            sql.append(" SELECT bbsno,subject,wname,readcnt,indent,regdt, r");
            sql.append(" FROM( SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r");
            sql.append("       FROM ( SELECT bbsno,subject,wname,readcnt,indent,regdt");
            sql.append("              FROM tb_bbs");
            
            String search="";
            if(col.equals("wname")) {
              search += " WHERE wname LIKE '%" + word + "%'";
            } else if(col.equals("subject")) {
              search += " WHERE subject LIKE '%" + word + "%'";
            } else if(col.equals("content")) {
              search += " WHERE content LIKE '%" + word + "%'";
            } else if(col.equals("subject_content")) {
              search += " WHERE subject LIKE '%" + word + "%'";
              search += " OR content LIKE '%" + word + "%'";
            }
            
            sql.append(search);        
            
            sql.append("              ORDER BY grpno DESC, ansnum ASC");
            sql.append("           )");
            sql.append("     )");
            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
          }//if end
          
          PreparedStatement pstmt=con.prepareStatement(sql.toString());
          ResultSet rs=pstmt.executeQuery();
          if(rs.next()){
            list=new ArrayList<>();
            do{
              BbsDTO dto=new BbsDTO();
              dto.setBbsno(rs.getInt("bbsno"));
              dto.setSubject(rs.getString("subject"));
              dto.setWname(rs.getString("wname"));
              dto.setReadcnt(rs.getInt("readcnt"));
              dto.setRegdt(rs.getString("regdt"));
              dto.setIndent(rs.getInt("indent"));
              list.add(dto);
            }while(rs.next());
          }//if end
          
        }catch(Exception e) {
          System.out.println("목록 페이징 실패: "+e);
        }   
        return list;
      }//list() end
	

	
	
}//





















