<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>clacForm.jsp</title>
<style>
	
	table{border: none; height: 130px;width: 240px;}
	tr,td,th{border:none;}
	.subbtn{text-align: center;}
	input[type=submit]{cursor: pointer;border: none;width: 50px;
						height: 30px; }
	input[type=number]:focus{outline: none;}
</style>
</head>
<body>
	<h1>* 절대값/팩토리얼 *</h1>
	
	<form action="calcok.jsp">
	<table border="1">
		<tr>
			<th>숫자</th>
			<td><input type="number" name="num1" size="5" autofocus></td>
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