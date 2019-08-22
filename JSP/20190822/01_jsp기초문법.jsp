<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%--
	1)
	JSP 코드 주석 : Ctrl+Shift+/ (\<%-- --\>) 코드 입력할 때는 이렇게 입력해야함
	JSP 페이지 디렉티브
		<%@ page	%>
		<%@ include	%>
		<%@ tagli	%>
	한글인코딩 : 완성형(MS949) : EUC-KR / 조합형 : UTF-8
	
	2) 
	<%@ page %> 	디렉티브
	contentType=""	필수요소
	import=""		자바패키지
	
	3) 
	스크립트릿(Scriptlet)
	JSP코드 작성영역
	<% %>
	
	4)
	.jsp 페이지에서 사용 가능한 문법
	- HTML tag
	- CSS
	- JavaScript(jQuery)
	- JSP
	
	- JSP하는 이유는 동적인 이미지.
		-> HTML 에서는 1+3을 계산할 수 없기 떄문이다.
	- 자바스크립트는 그대로 노출되기 때문이다. (스크립트 언어기 때문에)
 --%>
<!DOCTYPE html>
<html>
<head>
<!-- 웹브라우저 출력 시 한글 인코딩 -->
<meta charset="UTF-8">
<title>01_jsp기초문법.jsp</title>
</head>
<body>
	
	<h1>대한민국</h1>
	<hr>
	1+3=4 <br>
	솔데스크
	<hr>
	
<!-- JSP코드 영역  -->	
<%
	//<body>본문영역 출력 out.print();

	out.print("무궁화");
	out.print(123);
	out.print(5+7);
	out.print(8.9);
	out.print('X');

 /* 
 	기초문법 확인
 	http://localhost:8090/basicWeb/basic/01_jsp기초문법.jsp
 	http://127.0.0.1:8090/basicWeb/basic/01_jsp기초문법.jsp
 	http://고정아이피:8090/basicWeb/basic/01_jsp기초문법.jsp
 	
 	실제로는 
 	http://localhost:8090/WebContent/basic/01_jsp기초문법.jsp 에서 만들었는데
 	사람들이 볼 때는 basicWeb으로 보인다.
 	-> 이렇게 접근하면 에러	WebContent는 외부에서 접근 불가능.
 	
 */
 
 	//JSP에서 HTML 태그를 사용하는 경우
	out.print("<h1>토끼</h1>");
 	out.print("<img src='../images/t10.jpg'>");
 	out.print("<hr>");
 	
 	out.print("서울");
 	out.print("부산");
 	out.print("제주");
 	out.println("<br>");
 	out.println("개나리");
 	out.println("진달래");
 	out.println("라일락");
 	//out.println은 화면상의 줄바꿈이 아니라 페이지 소스보기의 줄바꿈
%>	
	
	<hr>
	<img src="../images/t08.jpg">
	
<%-- 	
 스크립스트릿 주석걸기
<%
	//스크립스트릿은 문서에 여러 번 가능하다.
	out.println("<style>.txt{color:red}</style>");
	out.println("<span class=txt>오필승코리아</span>");
%>
 --%>
 
</body>
</html>











