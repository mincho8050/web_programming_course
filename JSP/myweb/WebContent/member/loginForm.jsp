<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<%@ include file="auth.jsp"%>
<!-- 본문시작 loginForm.jsp -->
<div class="container">
	<%
	if(s_id.equals("guest") || s_passwd.equals("guest") || s_mlevel.equals("guest"))
	{
	%>
	<h3>로그인</h3>
	<form name="loginfrm"
		  method="post"
		  action="loginProc.jsp"
		  onsubmit="return loginCheck(this)">
	<table class="table">
	<tr>
		<td>
			<input type="text" name="id" placeholder="아이디를 입력하세요" required>
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" name="passwd" placeholder="비밀번호를 입력하세요" required>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		아이디 저장
		&nbsp;&nbsp;
		회원가입
		&nbsp;&nbsp;
		아이디/비번찾기
		</td>
	</tr>
	<tr>
		<td>
			<!-- <input type="image"> 기본속성은 submit -->
			<input type="image" src="../images/login.png">
		</td>	
	</tr>
	</table>
	</form>
	<%
	//로그인 안한 사람들한테 보여주는 폼
	}else{
		//로그인 성공했다면
		out.println("<strong style='color:#ff6666; cursor:default'>"+s_id+"</strong>님");
		out.println("<a href='logout.jsp'>로그아웃</a>");
		out.println("<br><br>");
		out.println("회원정보수정&nbsp;&nbsp;");
		out.println("&nbsp;&nbsp;회원탈퇴");
	}//if
	%>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>