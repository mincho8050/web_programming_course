<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 bbsReplyProc.jsp-->
<!-- 새글과의 차이는 bbsno(부모번호)를 가져오는 유무 bbsIns.jsp를 복사해서 편집함 -->

<%
	String wname=request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String passwd=request.getParameter("passwd").trim();
	String ip=request.getRemoteAddr();
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));

	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	dto.setBbsno(bbsno);

	int cnt=dao.reply(dto);   

	if(cnt==0){
		out.println("<p>답변 작성이 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시 시도]</p>");
	}else{
		out.println("<script>");
		out.println("	alert('답변이 입력되었습니다.');");
		out.println("	location.href='bbsList.jsp?col="+col+"&word="+word+"';");
		out.println("</script>");
	}//if
	
	
%>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>