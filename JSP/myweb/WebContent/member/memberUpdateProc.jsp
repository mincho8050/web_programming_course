<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<%@ include file="auth.jsp"%>
<!-- 본문시작 memberUpdateProc.jsp-->
<div class="container">
	<h3>회원정보 수정 결과</h3>
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
	
	int cnt=dao.update(dto);  
	
	if(cnt==0){
		out.println("<p style='font-size:14px'>회원정보 수정이 실패했습니다. \\n다시 한번 시도해주세요</p><br>");
		out.println("<p><a href='javascript:history.back()' style='font-size:14px'>다시 시도</p>");
		//>javascript:history.back() -> 뒤로 가겠다는 것.
	}else{
		//그냥 그대로 로그인 상태로 가면 바뀐 비밀번호가 적용되지 않아 한번 더 로그아웃 후에 
		//로그인 할 수 있도록 한다.
		out.println("<script>");
	  	out.println("	alert('회원정보 수정이 완료되었습니다. \\n다시 한번 로그인해주세요'); ");
	  	out.println("	location.href='logout.jsp'; ");
	  	out.println("</script>");
	}//if
	
	%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>