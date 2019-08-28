<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="ssi.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukDel.jsp</title>
</head>
<body>
	<h1>*성적 삭제*</h1>
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
		
		StringBuilder sql=new StringBuilder();
		sql.append(" DELETE FROM sungjuk ");
		sql.append(" WHERE sno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setInt(1, sno);
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0){
			out.println("<p>성적 삭제이 실패했습니다.</p>");
			out.println("<p><a href='javascript:history.back()'>[다시 시도]</p>");
			//>javascript:history.back() -> 뒤로 가겠다는 것.
		}else{
			out.println("<script>");
			out.println("	alert('성적이 삭제되었습니다.');");
			out.println("	location.href='sungjukList.jsp';");//목록페이지이동
			out.println("</script>");
		}//if
		
	}catch(Exception e){
		out.println("실패: "+e);
	}
	%>

</body>
</html>