<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 memberProc.jsp -->
<div class="container">
	<h3>회원가입 결과</h3>
	<%
	//1) 사용자가 입력 요청한 정보 가져오기
	String id=request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	String mname=request.getParameter("mname").trim();
	String tel=request.getParameter("tel").trim();
	String email=request.getParameter("email").trim();
	String zipcode=request.getParameter("zipcode").trim();
	String address1=request.getParameter("address1").trim();
	String address2=request.getParameter("address2").trim();
	String job=request.getParameter("job").trim();
	
	//2) 1)의 내용을 dto객체에 담기
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	
	int cnt=dao.insert(dto); 
	
	if(cnt==0){
		out.println("<p style='font-size:14px'>회원가입이 실패했습니다. \\n 다시 한번 시도해주세요</p>");
		out.println("<p><a href='javascript:history.back()' style='font-size:14px'>다시 시도</p>");
		//>javascript:history.back() -> 뒤로 가겠다는 것.
	}else{
		out.println("<script>");
	  	out.println("	alert('회원 가입 되었습니다!!\\n로그인 페이지로 이동합니다'); ");
	  	out.println("	location.href='loginForm.jsp'; ");
	  	out.println("</script>");
	}//if
	
	%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>