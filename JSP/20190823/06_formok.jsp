<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06_formok.jsp</title>
</head>
<body>
	<h1>* 성적 결과 *</h1>
	<%
	/*
	request 내부 객체 : 사용자가 요청한 정보를 관리하는 객체
	request.getParameter("")
	-> 요청한 정보를 개별적으로 가져올 때
	-> 예) <input type="number" name="kor">
		   request.getParameter("kor") -> id가 아니라 name값
		   -> 리턴형은 String
	*/
/* 	out.print(request.getParameter("uname"));
	out.print("<hr>");
	out.print(request.getParameter("kor"));
	out.print("<hr>");
	out.print(request.getParameter("eng"));
	out.print("<hr>");
	out.print(request.getParameter("mat"));
	out.print("<hr>");
	 */
	 //-> method="post" 방식이면 한글이 깨짐
	 //1) 한글 UTF-8 인코딩
	 request.setCharacterEncoding("UTF-8");
	 
	 //2)사용자가 입력 요청한 정보를 개별적으로 가져오기
	 //-> <input type="text" name="uname"> 가져오기
	 String uname=request.getParameter("uname"); //리턴형이 String이라서
	 int kor=Integer.parseInt(request.getParameter("kor"));
	 int eng=Integer.parseInt(request.getParameter("eng"));
	 int mat=Integer.parseInt(request.getParameter("mat"));
	 
	 //3) 평균 구하기
	 int aver=(kor+eng+mat)/3;
	 
	 //4) 출력
	 out.println("이름"+uname+"<hr>");
	 out.println("국어"+kor+"<hr>");
	 out.println("영어"+eng+"<hr>");
	 out.println("수학"+mat+"<hr>");
	 out.println("평균"+aver+"<hr>");
	%>
	
	<!-- //5) 성적결과 테이블에 출력 -->
	<table border="1">
	<tr>
		<th>이름</th>
		<td><%=uname%></td>
	</tr>
	<tr>
		<th>국어</th>
		<td><%=kor%></td>
	</tr>
	<tr>
		<th>영어</th>
		<td><%=eng%></td>
	</tr>
	<tr>
		<th>수학</th>
		<td><%=mat%></td>
	</tr>
	<tr>
		<th>평균</th>
		<td><%=aver%></td>
	</tr>
	</table>

</body>
</html>