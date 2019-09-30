<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
</head>
<body>

	<h3>회원 로그인</h3>
	<!-- http://localhost:8090/mvcTest/login.do -->
	<form action="loginproc.do"
		  method="post">
	아이디  : <input type="text" name="uid"><br>
	비밀번호: <input type="password" name="upw"><br>
	<input type="submit" value="확인">	  
	</form>

</body>
</html>