<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 pdsIns.jsp-->
<div class="container">

<h3>사진 올리기 결과</h3>

<%
try{
	//1) 첨부된 파일 저장하기-------------------------------
		String saveDirectory=application.getRealPath("/storage");
		int maxPostSize=1024*1024*10;
		String encodeing="UTF-8";
		
		MultipartRequest mr=new MultipartRequest(request
												 ,saveDirectory
												 ,maxPostSize
												 ,encodeing
												 ,new DefaultFileRenamePolicy());
		
	//2) 저장된 파일명, 파일크기 가져오기---------------------
		String item="";
		String fileName=""; //파일명
		long filesize=0;	//파일크기
		File file=null;

		Enumeration files=mr.getFileNames();
		while(files.hasMoreElements()){//요소가 다 있을때 까지 반복
			item=(String)files.nextElement();
			fileName=mr.getFilesystemName(item);
			if(fileName!=null){
				file=mr.getFile(item);//파일담기
				if(file.exists()){//파일이 존재하는지?
					filesize=file.length();
				}//if
			}//if
		}//while
			
	//3) tb_pds테이블에 행추가하기--------------------------
	String wname=mr.getParameter("wname").trim();
	String subject=mr.getParameter("subject").trim();
	String passwd=mr.getParameter("passwd").trim();
	
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setPasswd(passwd);
	dto.setFilename(fileName);
	dto.setFilesize(filesize);
	
	boolean flag=dao.insert(dto); 
	if(flag){
		out.println("<script>");
		out.println(" 	alert('사진을 추가했습니다.');");
		out.println(" 	location.href='pdsList.jsp';");
		out.println("</script>");
	}else{
		out.println("<p>사진을 추가했습니다.</p>");
		out.println("<p><a href='javascript:history.back()' style='font-size:14px'>다시 시도</p>");
	}//if
	
	
}catch(Exception e){
	out.println(e);
	out.println("<p>사진 올리기를 실패했습니다.</p>");
	out.println("<a href='javascript:history.back()'>다시 하기</a>");
}//try
%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>