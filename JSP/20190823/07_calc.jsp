<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07_calc.jsp</title>
</head>
<body>
	<h1>* 계산 연습 *</h1>
	<form 
		name="calcfrm"
		method="get"
		action="07_calcok.jsp">
	첫 번째 수 : <input type="number" 
					  name="num1" 
					  min="0"
					  max="100"
					  required>
	<hr>
	연산자 : <input type="text"
				   name="op"
				   size="3"
				   required>
	<hr>
	두 번째 수 : <input type="number" 
					  name="num2" 
					  min="0"
					  max="100"
					  required>
	<hr>
	<input type="submit" value="계산">				  
	<input type="reset" value="취소">				  
	</form>
	
</body>
</html>