<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>media/readMP4.jsp</title>
<style type="text/css">
	*{
		font-family: gulim;
		font-size: 20px;
	}
</style>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<div class="title">비디오 보기</div>
	
	<div class="content">
		${dto.title }<br>
		<img src="storage/${dto.poster }" width="400"><br>
		<video src="storage/${dto.filename }" controls autoplay></video>
	</div>
	
	<div class="bottom">
		<input type="text" value="음원목록" onclick="location.href='list.do'">
	</div>

</body>
</html>