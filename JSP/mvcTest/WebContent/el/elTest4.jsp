<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest4.jsp</title>
</head>
<body>
	<h3>JSP와 EL의 값 공유</h3>
	
	<%String uname="솔데스크"; %>
	이름(JSP):<%=uname %><br>
	이름(EL):${uname }<br>
	
	<hr>
	
	<!-- 
	동일한 페이지내에서 JSP와 EL이
	서로 값을 공유하기 위해서는
	pageContext Scope를 활용한다.
	단순히 변수에 담아서는 EL에서는 표현이 안된다.
	이때 pageContext에 담는다.
	 -->
	<%pageContext.setAttribute("uid","user"); %>
	이름(JSP):<%=pageContext.getAttribute("uid") %><br>
	이름(EL):${pageScope.uid }<br>
	이름(EL):${uid }<br>

	
	
	
	
	
	
	
</body>
</html>