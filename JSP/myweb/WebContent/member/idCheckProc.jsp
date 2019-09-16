<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<title>idCheckProc.jsp</title>
<link rel="stylesheet" href="../css/mystyle.css">
<script src="../js/myscript.js"></script>
</head>
<body>

<div class="container" style="text-align: center;color:black">
	<h3>아이디 중복 확인 결과</h3>
	<%
	String id=request.getParameter("id").trim();
	int cnt=dao.duplecateID(id);  
	out.println("입력 ID : <strong>"+id+"</strong>");
	if(cnt==0){
		out.println("<p>사용가능한 아이디입니다.</p>");
		out.println("<a href='javascript:applyId(\""+id+"\")'>적용</a>");
		
		
	}else{
		out.println("<p>이미 사용중인 아이디입니다.<br> 다시 입력해주세요.</p>"); 
	}
	%>
	<hr>
	<a href="javascript:history.back()">다시 검색</a>
	&nbsp;&nbsp;
	<a href="javascript:window.close()">창닫기</a>
</div>

</body>
</html>