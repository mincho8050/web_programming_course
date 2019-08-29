<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="net.sungjuk.*" %>
<jsp:useBean id="dao" class="net.sungjuk.SungjukDAO" scope="page"></jsp:useBean>
<jsp:useBean id="dto" class="net.sungjuk.SungjukDTO" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukList.jsp</title>
<style>
	table{border-collapse: collapse;width: 55%;min-width:400px;max-width:700px; }
	th{width:100px;height: 30px;background-color: #d9f2e6;}
	td{width: 200px;text-align: center;height: 25px;}
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: blue; text-decoration: none;}
	.btn2{
	  text-decoration: none;
      display:inline-block;
      padding:1px 5px 1px 5px;
      border-radius: 8px;
      border:1px solid white;
	}
	.btn2:hover{
		color:black !important;
		background-color: #d9f2e6;
	}
	.btn3:hover{color:#349868;}
</style>
</head>
<body>
	<h1>* 성적 목록 *</h1>
	
	<p><a href="sungjukForm.jsp" class="btn2">성적쓰기</a></p>
	
	<table border="1">
	<tr>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>등록일</th>
	</tr>

	<%
	  //전체목록 
	  ArrayList<SungjukDTO> list = dao.list();
	  if(list==null){
	      out.println("<tr>");
	      out.println("  <td colspan='5'>글없음!!</td>");
	      out.println("</tr>");
	  }else{
	      for(int idx=0; idx<list.size(); idx++) {
	          dto=list.get(idx);   
	%>
			  <tr>
			    <td><a href="sungjukRead.jsp?sno=<%=dto.getSno()%>" class="btn3"><%=dto.getUname()%></a></td>
			    <td><%=dto.getKor()%></td>
			    <td><%=dto.getEng()%></td>
			    <td><%=dto.getMat()%></td>
			    <td><%=dto.getWdate().substring(0,10)%></td>
			  </tr>
	<%          
	      }//for end
	  }//if end
	%>  
	</table>
</body>
</html>