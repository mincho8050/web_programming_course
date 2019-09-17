<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<%@ include file="auth.jsp"%>
<!-- 본문시작 memberDelUpdate.jsp 아이디/비번-->
<div class="container">

<h3>회원탈퇴</h3>

<form method="post" 
	  action="memberDelUpdateProc.jsp"
	  onsubmit="return loginCheck(this)">
	  
	 

	<table class="table">
		<tr>
			<td><input type="text" name="id" required placeholder="아이디를 입력하세요"></td>
		</tr> 
		<tr>
			<td><input type="password" name="passwd" required placeholder="비밀번호를 입력하세요"></td>
		</tr>  
	</table>
	<input type="submit" value="확인">
</form>

</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>