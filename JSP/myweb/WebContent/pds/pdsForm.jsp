<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 pdsForm.jsp -->
<div class="container">

<h3>사진 올리기</h3>

<form name=""
	  method="post"
	  enctype="multipart/form-data"
	  action="pdsIns.jsp"
	  onsubmit="return pdsCheck(this)">
	  
	<table class="table table-hover">
	<tr>
		<th>이름</th>
		<td><input type="text" name="wname" size="20" maxlength="100" required autofocus class="form_input"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><textarea rows="5" cols="30" class="form_input" name="subject"></textarea></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd" required autofocus class="form_input"></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td><input type="file" name="filename" class="form_input"></td>
	</tr>
	</table>
	<input type="submit" value="전송">
	<input type="reset" value="취소">
</form>

</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>