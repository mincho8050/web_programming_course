<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 bbsDel.jsp -->
<!-- 비밀번호가 일치되면 삭제하기 -> 비밀번호를 입력할 수 있는 폼 작성 -->
<div class="container">

<h3>게시글 삭제</h3>
<p class="link"><a href="bbsList.jsp">List</a></p>

<form method="post" 
	  action="bbsDelProc.jsp"
	  onsubmit="return pwCheck(this)">
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
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