<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table{border-collapse: collapse;}
	td:nth-child(5){background-color: #e5ccff;}
</style>
<title>07_calcok.jsp</title>
</head>
<body>
	<h1>* 계산 완료 *</h1>
	<!-- 사칙연산+나머지연산자 -->
	<%
	request.setCharacterEncoding("UTF-8");
	
	//사용자가 입력 요청한 정보 가져오기.
	int num1=Integer.parseInt(request.getParameter("num1"));
	String op=request.getParameter("op");
	int num2=Integer.parseInt(request.getParameter("num2"));
	
	int result1=0;
	double result2=0.0;
	
	
	/* //if문
	if(op.equals("+")){
		out.print("두 수의 합 : "+(num1+num2));
	}else if(op.equals("-")){
		out.print("두 수의 차 : "+(num1-num2));
	}else if(op.equals("*")){
		out.print("두 수의 곱 : "+(num1*num2));
	}else if(op.equals("/")){
		out.print("두 수의 몫 : "+((double)num1/(double)num2));
	}else{
		out.print("두 수의 나머지 : "+(num1%num2));
	} */
	
	/* 
	switch~case문
	switch(op){
	case "+":out.print("두 수의 합 : "+(num1+num2)); break;
	case "-":out.print("두 수의 차 : "+(num1-num2)); break;
	case "*":out.print("두 수의 곱 : "+(num1*num2)); break;
	case "/":out.print("두 수의 몫 : "+((double)num1/(double)num2)); break;
	case "%":out.print("두 수의 나머지 : "+(num1%num2)); break;
	} */
	
	//테이블 출력 -> 다른방식
	if(op.equals("+")){
		result1=num1+num2;
	}else if(op.equals("-")){
		result1=num1-num2;
	}else if(op.equals("*")){
		result1=num1*num2;
	}else if(op.equals("/")){
		result2=(double)num1/num2;
	}else{
		result1=num1%num2;
	}
	%>
	<!-- 테이블 출력 -->
	<table border="1">
	<tr>
		<td><%=num1%></td>
		<td><%=op%></td>
		<td><%=num2%></td>
		<td>=</td>
		<td>
		<%
		if(op.equals("/")){
			out.print(result2);
		}else{
			out.print(result1);
		}
		%>
		</td>
	</tr>
	</table>
	
	
	

</body>
</html>