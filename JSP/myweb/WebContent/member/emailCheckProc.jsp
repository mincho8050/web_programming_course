<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<title>emailCheckProc.jsp</title>
<link rel="stylesheet" href="../css/mystyle.css">
<script src="../js/myscript.js"></script>
</head>
<body>

<div class="container" style="text-align: center;color:black">
	<h3>이메일 중복 확인 결과</h3>
	<%
	String email=request.getParameter("email").trim();
	int cnt=dao.duplecateEmail(email);   
	out.println("입력 Email : <strong>"+email+"</strong>");
	if(cnt==0){
		out.println("<p style='font-size:14px'>사용가능한 이메일입니다.</p>");
		out.println("<a href='javascript:applyEmail(\""+email+"\")' style='font-size:14px'>적용</a>");
	}else{
		out.println("<p style='font-size:14px'>이미 사용중인 이메일입니다.<br> 다시 입력해주세요.</p>"); 
	}
	%>
	<hr>
	<a href="javascript:history.back()">다시 검색</a>
	&nbsp;&nbsp;
	<a href="javascript:window.close()">창닫기</a>
</div>

</body>
</html>