<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdsProc2.jsp</title>
</head>
<body>
	<h3>파일 첨부 테스트 결과 (다중)</h3>
	<%

	try{
		String saveDirectory=application.getRealPath("/storage");
		int maxPostSize=1024*1024*10;
		String encodeing="UTF-8";
		
		MultipartRequest mr=new MultipartRequest(request
												 ,saveDirectory
												 ,maxPostSize
												 ,encodeing
												 ,new DefaultFileRenamePolicy());
		out.print("<p>파일 전송 저장 성공!!</p>");
		
		out.print(mr.getParameter("uname"));
		out.print("<hr>");
		out.print(mr.getParameter("subject"));
		out.print("<hr>");
		out.print(mr.getParameter("content"));
		out.print("<hr>");
		
		//파일 업로드(다중)
		String item="";
		String ofileName="";
		String fileName="";
		File file=null;
		
		//<input type="file" name="filenm1">
		//<input type="file" name="filenm2">
		//<input type="file" name="filenm3">
		//files -> 위의 3개 요소를 가져옴
		Enumeration files=mr.getFileNames();
		int idx=1;
		while(files.hasMoreElements()){//요소가 다 있을때 까지 반복
			item=(String)files.nextElement();
			ofileName=mr.getOriginalFileName(item);
			fileName=mr.getFilesystemName(item);
			if(fileName!=null){
				file=mr.getFile(item);//파일담기
				if(file.exists()){//파일이 존재하는지?
					long filesize=file.length();
					out.print(idx+") 원본파일명 : "+ofileName+"<hr>");
					out.print(idx+") 파일명 : "+file.getName()+"<hr>");
					out.print(idx+") 파일크기 : "+filesize+"<hr>");
				}else{
					out.print("해당 파일이 존재하지 않습니다.");
				}//if
			}//if
			idx++;
		}//while
		
		
	}catch(Exception e){
		out.print(e);
		out.print("<p>파일 업로드 실패!!</p>");
		out.print("<a href='javascript:history.back();'>다시 시도</a>");
	};
	
	
	%>
	
</body>
</html>