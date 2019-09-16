<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 loginProc.jsp-->
<div class="container">
	<h3>로그인</h3>
	<%
	String id=request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	dto.setId(id);
	dto.setPasswd(passwd);
	String mlevel=dao.loginProc(dto);
	if(mlevel==null){
		out.println("<p>아이디/비번 다시 한번 확인해주세요</p>");
		out.println("<p><a href='javascript:history.back()'>다시 시도</p>");
	}else{
		/* out.println("<p>로그인 성공</p>");
		out.println(mlevel); */
		
		//다른 페이지에서 로그인상태를 공유할 수 있도록
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlevel", mlevel);
		
		//첫페이지로 이동
		String root=Utility.getRoot();
		response.sendRedirect(root+"/index.jsp");
	}//
	%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>