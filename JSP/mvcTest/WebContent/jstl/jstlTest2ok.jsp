<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlTest2ok.jsp</title>
</head>
<body>
	<h3>결과 페이지 (JSP)</h3>
	
	<%
	//1)이름, 나이를 변수에 대입 후 출력
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	out.print("이름 : "+name+"<br>");
	out.print("나이 : "+age+"<br>");
	
	//2) 나이가 10미만 어린이, 20미만 청소년, 나머지 성인 출력
	if(age<10){
		out.print("어린이");
	}else if(age<20){
		out.print("청소년");
	}else{
		out.print("성인");
	}
	out.print("<br>");
	
	//3) 1~나이까지 홀수는 빨강색, 짝수는 파랑색으로 출력
	for(int a=1;a<=age;a++){
		if(a%2==1){
			out.print("<span style='color:red'>"+a+"</span>");
		}else{
			out.print("<span style='color:blue'>"+a+"</span>");
		}
	}//for
	
	%>
</body>
</html>