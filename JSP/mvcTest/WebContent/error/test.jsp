<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test.jsp</title>
</head>
<body>
<%
int a=Integer.parseInt(request.getParameter("num"));
out.print("a:"+a);
%>
</body>
</html>



