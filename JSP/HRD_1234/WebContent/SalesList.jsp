
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.sale.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="dto" class="net.sale.SalesDTO"></jsp:useBean>
<jsp:useBean id="dao" class="net.sale.SalesDAO"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SalesList.jsp</title>

<style>
	header{background:darkblue; color:white;}
  nav   {background:lightblue; color:white;}
  footer{background:blue; color:white;}
</style>

</head>
<body>
	<header>쇼핑몰 회원관리 ver 1.0</header>	
	<nav>
		<jsp:include page="mainmenu.jsp"></jsp:include>
	</nav>
		<section>
		<!-- 본문 시작 -->
		<h2>회원매출조회</h2>
		
		<%
		ArrayList<SalesDTO> list=dao.list();
		if(list==null){ 
			out.print("자료없음");
		}else{
		%>
		
		<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		<%
		for(int idx=0; idx<list.size(); idx++){
			dto=list.get(idx);
		%>
			<tr>
				<td><%=dto.getCustno() %></td>
				<td><%=dto.getCustname() %></td>
				<td>
				<%
				String grade=dto.getGrade();
				if(grade.equals("A")){
					out.print("VIP");
				}if(grade.equals("B")){
					out.print("VIP");
				}if(grade.equals("C")){
					out.print("직원");
				}
				%>
				</td>
				<td><%=dto.getHap()%></td>
			</tr>
			<%		
		}//for end    
   		out.print("</table>");
	}//if end
	%>
		
		<!-- 본문 끝 -->
		</section>
	<footer>
	HRDKOREA Copyright&copy;2016 All rights reserved.
	Human Resource Development Service of Korea 
	</footer>
</body>
</html>