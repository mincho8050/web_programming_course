<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="UTF-8">
<title>emailCheckForm.jsp</title>
<link rel="stylesheet" href="../css/mystyle.css">
<script src="../js/myscript.js"></script>
</head>
<body>

<div class="container" style="text-align: center;color:black">
	<h3>이메일 중복확인</h3>
	<form method="post"
		  action="emailCheckProc.jsp"
		  onsubmit="return blankCheckEmail(this)"> 
	이메일:<input type="text" name="email" maxlength="50" autofocus>
	<input type="submit" value="중복확인" style="cursor: pointer;">
	</form>
</div>

</body>
</html>