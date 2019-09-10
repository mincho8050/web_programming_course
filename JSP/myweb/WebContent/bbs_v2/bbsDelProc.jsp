<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 bbsDelProc.jsp-->
<div class="container">

<h3>게시글 결과</h3>
<p class="link"><a href="bbsForm.jsp">Write</a></p>
<p class="link"><a href="bbsList.jsp">List</a></p>
<% 

String passwd=request.getParameter("passwd").trim();
int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());

dto.setPasswd(passwd);
dto.setBbsno(bbsno);

int cnt=dao.delete(dto); 
if(cnt==0){
	out.println("<p>게시글 삭제가 실패했습니다.</p>");
	out.println("<p><a href='javascript:history.back()'>다시 시도</p>");
	//>javascript:history.back() -> 뒤로 가겠다는 것.
}else{
	out.println("<script>");
	out.println("	alert('게시글이 삭제되었습니다.');");
	out.println("	location.href='bbsList.jsp?col="+col+"&word="+word+"';");//목록페이지이동
	out.println("</script>");
}//if

%>

</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>