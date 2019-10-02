<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- JSTL를 사용하기 위해서 Derective를 지정한다 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest3.jsp</title>
</head>
<body>
	<h3>JSTL함수</h3>

	<c:set var="txt" value="  white space  "></c:set>
	글자갯수 : ${fn:length(txt) } <!-- 15  -->
	<hr>
	<c:set var="txt" value="${fn:trim(txt) }"></c:set>
	글자갯수 : ${fn:length(txt) }	<!-- 11 -->
	<hr>
	<c:set var="txt" value="Hi My name if waldo"></c:set>
	${fn:substring(txt, 3,9) } <!-- My nam -->
	<hr>
	
	<%
	//엔터를 <br>로 바꾸기
	//1) JSP
	String content="";
	content.replace("\n", "<br>");
	
	//2)EL+JSTL
	pageContext.setAttribute("cn","\n");
	%>
	<c:set var="content"
		   value="Hi
		   		  My name is 
		   		  waldo"></c:set>
	${content}<br> <!-- 그냥 출력 -->
	${fn:replace(content,cn,"<br>") }<br>
	
	
	
</body>
</html>