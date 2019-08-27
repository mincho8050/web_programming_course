<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukRead.jsp</title>
<style>
	table{border-collapse: collapse;}
	th{width:100px;height: 30px;}
	td{text-align: center; width: 200px;}
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: blue; text-decoration: none;}
</style>
</head>
<body>
	<h1>*성적 상세보기*</h1>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	<%
	/* sungjukList.jsp에서 넘긴 sno값 */
	int sno=Integer.parseInt(request.getParameter("sno"));
	//out.println(sno);
	try{
		//DB연결은 반복적인 작업은 클래스로 만들어 함수화 시킨다
		Class.forName("oracle.jdbc.OracleDriver"); 
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT sno,uname,kor,eng,mat,aver,addr,wdate ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		ResultSet rs=pstmt.executeQuery();
		//sungjukList.jsp와의 차이는 반복문의 차이. sungjukRead.jsp는 하나만 불러오기 때문에
		if(rs.next()){ //cursor가 있는지
		%>
		<!-- 테이블 만들기 위해 스크립트릿을 나눔/body 부분 활성화 -->
		<table border="1">
			<tr>
				<th>이름</th>
				<td><%=rs.getString("uname") %></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><%=rs.getInt("kor") %></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><%=rs.getInt("eng") %></td>
			</tr>
			<tr>
				<th>수학</th>
				<td><%=rs.getInt("mat") %></td>
			</tr>
			<tr>
				<th>평균</th>
				<td><%=rs.getInt("aver") %></td>
			</tr>
			<tr>
				<th>주소</th>
				<% 
				/* 주소를 한글로 출력 */
				String addr=rs.getString("addr");
				if(addr.equals("Seoul")){
					addr="서울";
				}else if(addr.equals("Busan")){
					addr="부산";
				}else if(addr.equals("Jeju")){
					addr="제주";
				}else{
					addr="수원";
				}//if
				%>
				<td><%=addr %></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=rs.getString("wdate").substring(0,10) %></td>
			</tr>
		</table>
		<!-- sno은 위에서 담은 변수! 페이지는 독립적이지만 변수로 연결된다 -->
		<a href="sungjukUpdate.jsp?sno=<%=sno%>">[수정]</a>
		&nbsp;&nbsp;
		<a href="sungjukDel.jsp?sno=<%=sno%>">[삭제]</a>	
		<%		
		}else{
			out.print("해당 글 없음!");
		}

		
	}catch(Exception e){
		out.println("실패: "+e);
	}//try
	
	%>
</body>
</html>