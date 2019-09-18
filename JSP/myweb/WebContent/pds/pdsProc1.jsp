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
<title>pdsProc1.jsp</title>
</head>
<body>
	<h3>파일 첨부 테스트 결과</h3>
	<%
	/* 
	이렇게 하면 null이 나옴
	request.setCharacterEncoding("UTF-8");
	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("subject"));
	out.print("<hr>");
	out.print(request.getParameter("content"));
	out.print("<hr>");
	out.print(request.getParameter("filenm"));
	out.print("<hr>");
	//-----------------------------------------------
	- <form>에 enctype 속성이 추가되면 request객체가
	가지고 있는 값을 제대로 가져올 수 없다.
	request.getParameter() -> null이 반환된다.
	 */
	try{
		//실제 물리적 경로
		String saveDirectory=application.getRealPath("/storage");
		//저장 최대 용량 (10M)
		int maxPostSize=1024*1024*10;
		//한글 조합
		String encodeing="UTF-8";
		
		//사용자가 전송한 텍스트 정보 및 파일 저장
		MultipartRequest mr=new MultipartRequest(request
												 ,saveDirectory
												 ,maxPostSize
												 ,encodeing
												 ,new DefaultFileRenamePolicy());
		out.print("<p>파일 전송 저장 성공!!</p>");
		
		//1) mr참조변수가 가리키고 있는 텍스트 정보 가져오기
		//최종적인건 mr이 가지고 있음
		out.print(mr.getParameter("uname"));
		out.print("<hr>");
		out.print(mr.getParameter("subject"));
		out.print("<hr>");
		out.print(mr.getParameter("content"));
		out.print("<hr>");
		
		//전송시킨 파일 정보가 필요하면 이 아래의 작업들을 해야한다.
		
		//2) storage폴더에 저장된 파일 정보 확인하기
		//mr에서 <input type="file">을 전부 가져온다
		//Enumeration ->열거형(배열과 같음)
		//Enumeration num={1,2,3}; 가능 int[] num={1,2,3};과 같음
		//대신 Enumeration는 index로 읽는게 아니라 데이터 있으면 가져오는 식임(다음요소,다음요소 이렇게 가져옴)
		Enumeration files=mr.getFileNames();
		
		//3) 2)의 files가 가지고 있는 값에서 개별 접근
		//name="filenm"
		String item=(String)files.nextElement();
		out.print(item+"<hr>"); //출력값 filenm

		//4) 3)에서 item이름으로 전송된 실제파일을 mr객체에서 가져오기
		String ofileName=mr.getOriginalFileName(item);
		String fileName=mr.getFilesystemName(item);
		out.print("원본 파일명 : "+ofileName);
		out.print("<hr>");
		out.print("리네임 파일명 : "+fileName);
		out.print("<hr>");
		
		//5) 저장된 파일의 기타 세부 정보 확인하기
		File file=mr.getFile(item);
		if(file.exists()){//파일이 존재하는지?
			out.print("파일명 : "+file.getName());
			out.print("<hr>");
			out.print("파일크기 : "+file.length());
			out.print("<hr>");
		}else{
			out.print("해당 파일이 존재하지 않습니다.");
		}//if
		
		//6) 파일 다운로드
		//단, 웹브라우저에서 해석되는 페이지는 제외
		//>.html .jsp .asp .php .png .jpg .avi .mp3 등
		out.print("첨부파일 : ");
		out.print("<a href='../storage/"+file.getName()+"'>");
		out.print(file.getName());
		out.print("</a>");
		
	}catch(Exception e){
		out.print(e);
		out.print("<p>파일 업로드 실패!!</p>");
		out.print("<a href='javascript:history.back();'>다시 시도</a>");
	};
	
	
	%>
	
</body>
</html>