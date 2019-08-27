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
<title>sungjukProc.jsp</title>
</head>
<body>
	<h1>*성적 수정*</h1>
	<p>
		<a href="sungjukForm.jsp">[성적쓰기]</a>
		<a href="sungjukList.jsp">[성적목록]</a>
	</p>
	
	<% 
	int sno=Integer.parseInt(request.getParameter("sno"));
	String uname=request.getParameter("uname").trim();
	int kor=Integer.parseInt(request.getParameter("kor").trim());
	int eng=Integer.parseInt(request.getParameter("eng").trim());
	int mat=Integer.parseInt(request.getParameter("mat").trim());
	String addr=request.getParameter("addr").trim();
	int aver=(kor+eng+mat)/3;
	
	try{
		Class.forName("oracle.jdbc.OracleDriver"); 
		Connection con=DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe"
				,"java0514"
				,"1234");
		
		
		StringBuilder sql=new StringBuilder();
		sql.append(" UPDATE sungjuk ");
		sql.append(" SET uname=?,kor=?,eng=?,mat=?,aver=?,addr=? ");
		sql.append(" WHERE sno=? ");
		
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, uname);
		pstmt.setInt(2, kor);
		pstmt.setInt(3, eng);
		pstmt.setInt(4, mat);
		pstmt.setInt(5, aver);
		pstmt.setString(6, addr);
		pstmt.setInt(7, sno);
		
		int cnt=pstmt.executeUpdate();
		if(cnt==0){
			out.println("<p>성적 수정이 실패했습니다.</p>");
			out.println("<p><a href='javascript:history.back()'>[다시 시도]</p>");
			//>javascript:history.back() -> 뒤로 가겠다는 것.
		}else{
			out.println("<script>");
			out.println("	alert('성적이 수정이 완료되었습니다.');");
			out.println("	location.href='sungjukList.jsp';");//목록페이지이동
			out.println("</script>");
		}//if
		
	}catch(Exception e){
		out.println("실패: "+e);
	}
	%>
		

</body>
</html>