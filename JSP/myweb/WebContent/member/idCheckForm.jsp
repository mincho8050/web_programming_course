<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<title>idCheckForm.jsp</title>
<link rel="stylesheet" href="../css/mystyle.css">
<script src="../js/myscript.js"></script>
</head>
<body>

<div class="container" style="text-align: center;color:black">
	<h3>아이디 중복확인</h3>
	<form method="post"
		  action="idCheckProc.jsp"
		  onsubmit="return blankCheckId(this)"> 
	아이디:<input type="text" name="id" maxlength="10" autofocus>
	<input type="submit" value="중복확인" style="cursor: pointer;">
	</form>
</div>

</body>
</html>