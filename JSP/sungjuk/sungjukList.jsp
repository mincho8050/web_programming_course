<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukList.jsp</title>
<style>
	table{border-collapse: collapse;}
	th{height: 30px;}
	td{text-align: center; width: 100px;height: 30px;}
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: blue; text-decoration: none;}

</style>
</head>
<body>
	<h1>*성적 목록*</h1>
	
	<p><a href="sungjukForm.jsp">[성적쓰기]</a></p>
	
	<table border="1">
		<tr>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>등록일</th>
		</tr>
		<%
		try{
			
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con=DriverManager.getConnection(
					"jdbc:oracle:thin:@//localhost:1521/xe"
					,"java0514"
					,"1234");
			
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT sno,uname,kor,eng,mat,wdate ");
			sql.append(" FROM sungjuk ");
			sql.append(" ORDER BY wdate DESC ");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()){ //cursor가 있는지?
				do{
		%>	<!-- 첫번째 스크립트릿끝.  -->		
					<tr>
						<!-- sno를 불러내는데 위에있는 select문에서 sno가 없으면 오류 -->
						<td><a href='sungjukRead.jsp?sno=<%=rs.getInt("sno")%>'><%=rs.getString("uname")%></a></td>
						<td><%=rs.getInt("kor")%></td>
						<td><%=rs.getInt("eng")%></td>
						<td><%=rs.getInt("mat")%></td>
						<td><%=rs.getString("wdate").substring(0,10)%></td>
					</tr>
		<!-- 두 번째 스크립트릿 시작 -->
		<%		
				}while(rs.next());
				
			}else{
				out.println("<tr>");
				out.println("	<td colspan='5'>글없음!</td>");
				out.println("</tr>");
			}//if
			
		}catch(Exception e){
			out.println("실패: "+e);
		}//try
		%>
		
	</table>

</body>
</html>