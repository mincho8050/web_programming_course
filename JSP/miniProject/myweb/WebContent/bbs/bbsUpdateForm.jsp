<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 bbsUpdateForm.jsp 게시글 수정 폼-->

<div class="container">
	<h3>게시글 수정</h3>
	<p class="link"><a href="bbsList.jsp">List</a></p>
	
	<%
	String passwd=request.getParameter("passwd").trim();
	int bbsno=Integer.parseInt(request.getParameter("bbsno").trim());

	dto.setPasswd(passwd);
	dto.setBbsno(bbsno);
	
	dto=dao.read2(dto);
	if(dto==null){
		out.print("해당 게시글이 없습니다.");	
	}else{
	%>
	
	
	<form name="bbsfrm"
		  method="post"
		  action="bbsUpdateProc.jsp"
		  onsubmit="return bbsCheck(this)">
		
		<input type="hidden" name="bbsno" value="<%=bbsno%>">
		  
		<table class="table table-hover">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="wname" value="<%=dto.getWname()%>" size="10" maxlength="20" class="form_input" required></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" value="<%=dto.getSubject()%>" size="30" maxlength="100" class="form_input" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="5" cols="30" name="content" class="form_input"><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" value="<%=passwd%>" size="10" maxlength="10" class="form_input" required></td>
			</tr>
			
		</table>  
			<input type="submit" value="작성">
			<input type="reset" value="취소">
	</form>
</div>
	<%
	}//if
	%>

<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>