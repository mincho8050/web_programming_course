<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elTest3.jsp</title>
</head>
<body>
	<h3>EL의 Collection들</h3>
	
	<%
	//웹 SCOPE
	//프로젝트에서 페이지간에 서로 공유할 수 있는 영역
	//pageContext , request , session , application
	
	//웹 전역변수 선언 및 값 저장
	pageContext.setAttribute("kor",100);
	request.setAttribute("eng", 200);
	session.setAttribute("mat", 300);
	application.setAttribute("aver", 400);
	%>
	
	1)page영역<br>
	JSP:<%=pageContext.getAttribute("kor") %><br>
	EL:${pageScope.kor}<br>
	2)request영역<br>
	JSP:<%=request.getAttribute("eng") %><br>
	EL:${requestScope.eng}<br>
	3)session영역<br>
	JSP:<%=session.getAttribute("mat") %><br>
	EL:${sessionScope.mat }<br>
	4)application영역<br>
	JSP:<%=application.getAttribute("aver") %><br>
	EL:${applicationScope.aver }<br>
	
	<hr>
	<!-- 
	EL에서는 Scope이름을 생략할 수 있다.
	page -> request -> session -> application
	순으로 자동으로 검색
	 -->
	Scope를 생략해도 나온다. <br>
	kor: ${kor }<br>
	eng: ${eng }<br>
	mat: ${mat }<br>
	aver: ${aver }<br>
	
	<hr>
	
	<%
	pageContext.setAttribute("num",10);
	request.setAttribute("num", 20);
	session.setAttribute("num", 30);
	application.setAttribute("num", 40);
	%>
	num : ${num }<br>
	<!-- 
	변수를 동일하게 줬더니 맨 처음에 검색되는 값이 출력 -> 10
	그래서 scope를 생략할 때는 변수명을 다르게 줘야 한다!
	 -->
	uname : ${uname }<br>
	<!-- 해당변수가 없을 때 빈값출력  --> 
	<hr>
	

</body>
</html>