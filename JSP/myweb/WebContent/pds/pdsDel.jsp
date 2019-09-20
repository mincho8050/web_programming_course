<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 pdsDel.jsp-->
<div class="container photo">

<h3>사진 삭제</h3>

<form method="post"
	  action="pdsDelProc.jsp"
	  onsubmit="return pwCheck(this)">

<input type="hidden" name="pdsno" value="<%=request.getParameter("pdsno")%>">

<table class="table">
		<tr>
			<th>비밀번호</th>
		</tr>
		<tr>
			<td class="pass_input"><input type="password" name="passwd" required placeholder="비밀번호를 입력하세요"></td>
		</tr>  
	</table>
	<input type="submit" value="확인">
	
</form>


</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>