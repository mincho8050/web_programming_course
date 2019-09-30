<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginResult.jsp</title>
</head>
<body>
	<h3>로그인 결과</h3>
	<%=request.getAttribute("msg") %><br>
	<%=request.getAttribute("img") %><br>
	<hr>
	1)JSP<br>
	아이디 : <%=request.getAttribute("r_uid") %><br>
	비밀번호 : <%=request.getAttribute("r_upw") %><br>
	<hr>
	아이디 : <%=session.getAttribute("s_uid") %><br>
	비밀번호 : <%=session.getAttribute("s_upw") %><br>
	<hr>
	아이디 : <%=application.getAttribute("a_uid") %><br>
	비밀번호 : <%=application.getAttribute("a_upw") %><br>
	<hr>

</body>
</html>