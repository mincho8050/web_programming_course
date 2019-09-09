<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 -->
<div class="container">
	<h3>게시글 작성</h3>
	<p class="link"><a href="bbsList.jsp">List</a></p>
	<form name="bbsfrm"
		  method="post"
		  action="bbsIns.jsp"
		  onsubmit="return bbsCheck(this)">
		<table class="table table-hover">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="wname" size="10" maxlength="20" class="form_input" required></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" size="30" maxlength="100" class="form_input" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="30" name="content" class="form_input"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" size="10" maxlength="10" class="form_input" required></td>
			</tr>
			
		</table>  
			<input type="submit" value="작성">
			<input type="reset" value="취소">
	</form>
</div>
	
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>