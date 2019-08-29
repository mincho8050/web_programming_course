<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukDel.jsp</title>
<style>
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
</style>
</head>
<body>
	<h1>* 성적 삭제 *</h1>
	
	<p>
		<a href="sungjukList.jsp" class="btn2">[성적목록]</a>
		<a href="sungjukForm.jsp" class="btn2">[성적쓰기]</a>
	</p>
	
	<%
	int sno=Integer.parseInt(request.getParameter("sno"));
	int cnt=dao.delete(sno); 
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
	%>

</body>
</html>