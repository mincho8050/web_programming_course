<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 bbsUpdate.jsp 비밀번호입력-->
<div class="container">

<h3>게시글 수정</h3>
<p class="link"><a href="bbsList.jsp">List</a></p>

<form method="post" 
	  action="bbsUpdateForm.jsp"
	  onsubmit="return pwCheck(this)">
	<input type="hidden" name="bbsno" value="<%=request.getParameter("bbsno")%>">
	<table class="table">
		<tr>
			<th>비밀번호</th>
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