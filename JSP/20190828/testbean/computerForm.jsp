<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>computerForm.jsp</title>
<style>
	h1{padding-left: 60px;}
	table{border: none; height: 130px;width: 240px;}
	tr,td,th{border:none;}
	.subbtn{text-align: center;}
	input[type=submit]{cursor: pointer;border: none;width: 50px;
						height: 30px; }
	input[type=number]:focus{outline: none;}
</style>
</head>
<body>
	<h1>* 계산기 *</h1>
	<!-- 1) JSP 메소드를 통한 계산기 실습
		<form action="computerok1.jsp">
	 -->
	 
	 <!-- 2) new 연산자
	<form action="computerok2.jsp">
	 -->
	 
	 <form action="computerok3.jsp">
	<table border="1">
		<tr>
			<th>숫자1</th>
			<td><input type="number" name="num1" size="5" autofocus></td>
		</tr>
		<tr>
			<th>숫자2</th>
			<td><input type="number" name="num2" size="5"></td>
		</tr>
		<tr>
			<td colspan="2" class="subbtn">
				<input type="submit" value="계산">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>