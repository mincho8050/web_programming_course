<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05_내부객체.jsp</title>
</head>
<body>

	<h1>JSP 내부객체</h1>
	<%
	//out.print("대한민국");
	//test.jsp -> text_jsp.java -> test_jsp.class
	/*
	text_jsp.java 소스 경로
	D:\java0514\workspace\.metadata\.plugins
	\org.eclipse.wst.server.core\tmp1\work\Catalina\localhost
	*/
	/*
	JSP 내부객체
	톰캣 서버에 의해 자동으로 생성된 객체
	개발자는 별도의 객체를 선언하지 않고 가져다 사용만 한다.
	1) out : 본문(<body>)를 가리키는 출력객체
					JspWriter out
	2) request : 사용자가 요청한 정보를 관리
				 HttpServletRequest request (차지하는 비율이 큼)
	3) response : 요청한 사용자에게 응답
				  HttpServletResponse response
	4) session : 요청한 사용자를 개발적으로 구분하기 위한 객체
				 HttpSession session	
	5) application : 서버에 대한 정보를 관리하는 객체
		  			 ServletContext application
	6) pageContext : JSP, JSTL, EL등 동일한 페이지 내에서 서로 다른 문법과 데이터를 교류할 수 있다.
					 PageContext pageContext
	*/
	%>
	

</body>
</html>