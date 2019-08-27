<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table{border-collapse: collapse;}
	th{width:100px;height: 30px;}
	td{width: 200px;}
	a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: blue; text-decoration: none;}
</style>
<title>sungjukUpdate.jsp</title>
</head>
<body>
	<h1>*성적 수정*</h1>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	
	try{
		Class.forName("oracle.jdbc.OracleDriver"); 
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		
		//수정은 SELECT 명령어가 사전에 실행되어야 한다.
		//수정하고자 하는 행을 가져와서 폼에 출력하고 해당 데이터를 수정한다.
		StringBuilder sql=new StringBuilder();
		sql.append(" SELECT sno,uname,kor,eng,mat,addr ");
		sql.append(" FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
	 %>
	 <!-- 
	 action으로 자료가 넘어갈 때는 form이 넘어감. sno이 있긴 하지만
	 form요소 안에는 sno이 없음. 이때 form형식 중에 hidden이 있다. 
	 이걸로 보이지는 않지만 자료를 넘길 때 사용한다
	  -->
	 <form method="post" action="sungjukUpdateProc.jsp">
	 	<input type="hidden" name="sno" value="<%=sno%>">
		<table border="1">
			<tr>
				<th>이름</th>
				<td>
				<!-- value값은 가지고있는 값을 화면상에 표시 / 원래 저장된 값이 보이기 위해 -->
					<input type="text" name="uname" value="<%=rs.getString("uname") %>" maxlength="20" required autofocus>
				</td>
			</tr>
			<tr>
				<th>국어</th>
				<td>
					<input type="number" name="kor" value="<%=rs.getInt("kor") %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>영어</th>
				<td>
					<input type="number" name="eng" value="<%=rs.getInt("eng") %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>수학</th>
				<td>
					<input type="number" name="mat" value="<%=rs.getInt("mat") %>" size="5" min="0" max="100" placeholder="숫자입력">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
			<%
			//저장된 주소가 selected 하도록 일단 이름이 기니까 변수에 저장
			String addr=rs.getString("addr");
			%>
					<select name="addr">
						<option value="Seoul" <%if(addr.equals("Seoul")){out.println("selected");} %>>서울</option>
						<option value="Jeju" <%if(addr.equals("Jeju")){out.println("selected");} %>>제주</option>
						<option value="Busan" <%if(addr.equals("Busan")){out.println("selected");} %>>부산</option>
						<option value="Suwon" <%if(addr.equals("Suwon")){out.println("selected");} %>>수원</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	 <%	
		}else{
			out.print("해당 글 없음!");
		}
		
		
	}catch(Exception e){
		out.println("실패: "+e);
	}
	%>

</body>
</html>