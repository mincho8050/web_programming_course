<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>media/list.jsp</title>

<style type="text/css">
	*{
		font-family: gulim;
		font-size: 20px;
	}
</style>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<div class="title">음원목록</div>
	
	<table>
	
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>등록일</th>
		<th>음원파일명</th>
		<th>수정/삭제</th>
	</tr>
	
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.mediano }</td>
			<td>
				<a href="read.do?mediano=${dto.mediano }">
				${dto.title }
				</a>
			</td>
			<td>${dto.rdate }</td>
			<td>
				${dto.filename }
				<c:set var="filesize" value="${dto.filesize/1024 }"></c:set>
				<c:set var="filesize" value="${fn:substringBefore(filesize,'.')}"></c:set>
				${filesize} KB
			</td>
			<td>
				<input type="button" value="수정" onclick="location.href='update.do?mediano=${dto.mediano}'">
				<input type="button" value="삭제" onclick="location.href='delete.do?mediano=${dto.mediano}'">
			</td>
		</tr>
	</c:forEach>
	
	</table>
	
	<div class="bottom">
		<input type="button" value="음원등록" onclick="location.href='create.do'">
	</div>

</body>
</html>