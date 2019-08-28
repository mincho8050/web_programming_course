<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.testbean.*"%>
<jsp:useBean id="comp" class="net.testbean.Compute" scope="page"></jsp:useBean>
<%--
    Java Bean(객체) 생성
    <jsp:useBean id="객체명"
                 class="팩키지명.클래스명"
                 scope="page">    
    
    Java Bean(id)의 유효범위
    scope="page" 현재페이지에서만 유효, 생략시 기본값
    scope="request"	다른페이지에서 공유
    scope="session"	다른페이지에서 공유
    scope="application" 다른페이지에서 공유
    
    [주의사항]
    Java Bean(id)가 제대로 생성안될 수도 있다.
    ->해당프로젝트를 Refresh , Validate, Project -> Clean 해주기
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>computerok3.jsp</title>
</head>
<body>	
	<h1>* 계산 결과 *</h1>
	<h2>3) Java Bean을 이용해서 객체 생성 후 메소드 호출</h2>

	
	<%
	int num1=Integer.parseInt(request.getParameter("num1").trim());
	int num2=Integer.parseInt(request.getParameter("num2").trim());

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