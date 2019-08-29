<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sungjukUpdateProc.jsp</title>
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
	<h1>*성적 수정*</h1>
	<p>
		<a href="sungjukForm.jsp" class="btn2">성적쓰기</a>
		<a href="sungjukList.jsp" class="btn2">성적목록</a>
	</p>
	<%
	int sno=Integer.parseInt(request.getParameter("sno").trim());
	String uname=request.getParameter("uname").trim();
	int kor=Integer.parseInt(request.getParameter("kor").trim());
	int eng=Integer.parseInt(request.getParameter("eng").trim());
	int mat=Integer.parseInt(request.getParameter("mat").trim());
	String addr=request.getParameter("addr").trim();
	int aver=(kor+eng+mat)/3;
	
	//2)dto객체를 사용한 경우
	//->전달값을 모두 dto객체에 담기
	dto.setSno(sno);
	dto.setUname(uname);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setAver(aver);
	dto.setAddr(addr);
	
	int cnt=dao.update(dto);
	if(cnt==0){
		out.println("<p>성적 수정이 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>[다시 시도]</p>");
		//>javascript:history.back() -> 뒤로 가겠다는 것.
	}else{
		out.println("<script>");
		out.println("	alert('성적이 수정되었습니다.');");
		out.println("	location.href='sungjukList.jsp';");//목록페이지이동
		out.println("</script>");
	}//if
	
	%>
</body>
</html>