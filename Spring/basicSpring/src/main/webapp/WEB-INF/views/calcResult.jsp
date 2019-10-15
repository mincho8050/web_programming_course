<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calcResult</title>
</head>
<body>

<h1>1)JSP</h1>
<%=request.getAttribute("msg")%>
숫자 1 :<%=request.getAttribute("no1") %><br>
숫자 2 :<%=request.getAttribute("no2") %><br>
결과 :<%=request.getAttribute("result") %><br>
<%=request.getAttribute("img") %>
<hr>

<h1>2)EL</h1>
${requestScope.msg }
숫자 1 : ${requestScope.no1 }<br>
숫자 2 : ${requestScope.no2 }<br>
결과 : ${requestScope.result }<br>
${requestScope.img }
<hr>


<h1>3)EL</h1>
<!-- requestScope 생략가능 -->
${msg }
숫자 1 : ${no1 }<br>
숫자 2 : ${no2 }<br>
결과 : ${result }<br>
${img==null ? "" : img}
<hr>

</body>
</html>