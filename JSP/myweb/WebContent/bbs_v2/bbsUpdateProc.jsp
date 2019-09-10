<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 수정결과 bbsUpdateProc.jsp-->

<div class="container">

<h3>게시글 수정 결과</h3>
<p class="link"><a href="bbsForm.jsp">Write</a></p>
<p class="link"><a href="bbsList.jsp">List</a></p>


	<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());
	String wname=request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String passwd=request.getParameter("passwd").trim();
	
	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	
	int cnt=dao.update(dto);
	if(cnt==0){
		out.println("<p>게시글 수정이 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</p>");
		//>javascript:history.back() -> 뒤로 가겠다는 것.
	}else{
		out.println("<script>");
		out.println("	alert('게시글이 수정되었습니다.');");
		out.println("	location.href='bbsList.jsp?col="+col+"&word="+word+"';");//목록페이지이동
		out.println("</script>");
	}//if
	
	%>

</div>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>