<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.testbean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>computerok2.jsp</title>
</head>
<body>
	<h1>* 계산 결과 *</h1>
	<h2>2) new연산자를 이용해서 객체 생성 후 메소드 호출</h2>
	
	<%
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());
	
	/*
	객체 new Compute()
	->RAM의 heap영역에 메모리가 할당되고 주소값이 발생
	참조변수 comp
	*/
	
	Compute comp=new Compute();
	out.print(num1+"+"+num2+"="+comp.add(num1,num2));
	out.print("<hr>");
	out.print(num1+"-"+num2+"="+comp.sub(num1,num2));
	out.print("<hr>");
	out.print(num1+"*"+num2+"="+comp.mul(num1,num2));
	out.print("<hr>");
	out.print(num1+"/"+num2+"="+comp.div(num1,num2));
	out.print("<hr>");
	out.print(num1+"%"+num2+"="+comp.mod(num1,num2));
	out.print("<hr>");
	%>

</body>
</html>