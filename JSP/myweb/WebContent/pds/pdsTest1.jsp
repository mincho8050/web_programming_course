<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pdsTest1.jsp</title>
</head>
<body>
	<h3>파일 첨부 테스트</h3>
	<!-- 
	파일첨부 시 필수!! 
	enctype="multipart/form-data"
	-->
	<form method="post"
		  action="pdsProc1.jsp"
		  enctype="multipart/form-data">
	이름 : <input type="text" name="uname"><br>
	제목 : <input type="text" name="subject"><br>
	내용 : <textarea rows="5" cols="20" name="content"></textarea><br>
	첨부 : <input type="file" name="filenm"><br>
	<input type="submit" value="전송">
	</form>
</body>
</html>