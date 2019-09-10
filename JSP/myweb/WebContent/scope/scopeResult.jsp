<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<title>scopeResult.jsp</title>
</head>
<body>

	<h3>웹페이지의 SCOPE(유효범위) 결과</h3>
	
	<%
	out.print("1) pageContext 영역 : "+pageContext.getAttribute("kor")+"<hr>");
	//null -> 현재페이지에서만 사용가능
	out.print("2) request 영역 : "+request.getAttribute("eng")+"<hr>");
	//null -> 부모자식이지만 null이나옴.	 선택적으로 null인상태가 있고 아닌 상태가 있다. 아무리 부모자식이라도
	//링크태그,action,자바스크립트로 보내면 null값 / request는 고민을 좀 해야함. 전역변수긴함
	out.print("3) session 영역 : "+session.getAttribute("mat")+"<hr>");
	//값이 나옴 -> 전역변수 -> 나만
	out.print("4) application 영역 : "+application.getAttribute("uname")+"<hr>");
	//값이 나옴 -> 전역변수 -> 모든 사용자 가능
	%>

</body>
</html>