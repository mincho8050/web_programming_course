<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest1.jsp</title>
</head>
<body>
	<h3>EL (Expression Language) 표현언어</h3>
	
	<!-- EL, JSTL은 JSP에서만 허용(PHP, ASP에서는 안됨) -->
	
	123+456<hr>
	표현식 : <%=123 %> <hr>
	표현식 : <%=123+456 %> <hr>
	표현언어 : ${123}<hr>
	표현언어 : ${123+456}<hr>
	
	<h3>EL에서 사용되는 연산자</h3>
	더하기 : ${123+456}<hr>
	빼기 : ${123-456}<hr>
	곱하기 : ${123*456}<hr>
	나누기 : ${123/456}<hr>
	
	2가 3보다 작다 : ${2<3}<hr>
	2가 3보다 크다 : ${2>3}<hr>
	
</body>
</html>