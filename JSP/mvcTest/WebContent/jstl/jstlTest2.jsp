<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL를 사용하기 위해서 Derective를 지정한다 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest2.jsp</title>
</head>
<body>
	<h3>JSTL제어문 연습</h3>
	<!-- <form action="jstlTest2ok.jsp"> -->
	<form action="jstlTest2yes.jsp">
	이름:<input type="text" name="name"><br>
	나이:<input type="text" name="age"><br>
	<input type="submit" value="확인">
	</form>
	
	
</body>
</html>