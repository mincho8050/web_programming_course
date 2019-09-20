<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 mailForm.jsp -->
<div class="container">

<h3>메일 보내기</h3>

<form method="post"
	  action="mailProc.jsp">
	
	<table class="table table-hover">
	<tr>
		<th>받는 사람</th>
		<td><input type="text" name="to" class="form_input"></td>
	</tr>
	<tr>
		<th>보내는 사람</th>
		<td><input type="text" name="from" class="form_input"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject" class="form_input"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="50" name="content" class="form_input"></textarea></td>
	</tr>
	</table>
	
	<input type="submit" value="전송">
	<input type="reset" value="취소">

</form>


</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>