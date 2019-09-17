<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<%@ include file="auth.jsp"%>
<!-- 본문시작 memberUpdateProc.jsp-->
<div class="container">
	<h3>회원탈퇴 결과</h3>
	<%
	String id=request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	
	if(s_id.equals(id) && s_passwd.equals(passwd)){

		//2) 1)의 내용을 dto객체에 담기
		dto.setId(id);
		dto.setPasswd(passwd);
			
		int cnt=dao.delUpdate(dto);  
		
		if(cnt==0){
			out.println("<p style='font-size:14px'>회원탈퇴가 실패했습니다. \\n다시 한번 시도해주세요</p><br>");
			out.println("<p><a href='javascript:history.back()' style='font-size:14px'>다시 시도</p>");
			//>javascript:history.back() -> 뒤로 가겠다는 것.
		}else{
			out.println("<script>");
		  	out.println("	alert('회원탈퇴가 완료되었습니다.'); ");
		  	out.println("	location.href='logout.jsp'; ");
		  	out.println("</script>");
		 
		}//if 2
	
	}else{
		out.print("아이디/비밀번호를 확인해주세요 <br><br> ");
		out.println("<p><a href='javascript:history.back()' style='font-size:14px'>다시 시도</p> <br>");
	}//if 1
	
	%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>