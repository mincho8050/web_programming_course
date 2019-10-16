<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginResult</title>
</head>
<body>
	<h3>로그인 결과</h3>
	
	1)JSP<br>
	<%=request.getAttribute("msg") %><br>
	아이디(세션) : <%=session.getAttribute("s_id") %><br>
	비밀번호(세션) : <%=session.getAttribute("s_pw") %><br>
	<hr>
	
	2)EL<br>
	${msg }<br>
	아이디(세션) : ${s_id }<br>
	비밀번호(세션) : ${s_pw }<br>
	<hr>
	
	
</body>
</html>