<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 pdsDelProc.jsp-->
<div class="container photo">

<h3>사진 삭제 결과</h3>

<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	String passwd=request.getParameter("passwd").trim();
	String saveDir=application.getRealPath("/storage");
	

	int cnt=dao.delete(pdsno, passwd, saveDir); 
	if(cnt==0){
		out.println("<p>사진 삭제가 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</p>");
		//>javascript:history.back() -> 뒤로 가겠다는 것.
	}else{
		out.println("<script>");
		out.println("	alert('사진이 삭제되었습니다.');"); 
		out.println("	location.href='pdsList.jsp';");
		out.println("</script>");
	}//if
	
%>
	

</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>