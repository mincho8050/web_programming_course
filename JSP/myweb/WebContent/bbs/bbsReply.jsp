<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작 bbsReply.jsp -->

<!-- 

행추가 : 새글쓰기, 답변

새글쓰기 : grpno -> 최댓값(bbsno)+1
		 indent -> 0
		 ansnum -> 0

[답변(댓글)]
grpno : 그룹번호 -> 부모글번호
indent: 들여쓰기 -> 부모그룹번호+1
ansnum: 글순서   -> 부모글순서+1하고 나머지 글순서 재조정
->bbsno subject grpno indent ansnum
->답변댓글은 부모와 같은 grpno(그룹번호)를 가져야 한다.
예시)
bbsno subject   grpno  indent  snanum
1	  대한민국      1      0		0
	  >종로구	 	 1		1       1
	  >>인사동     1      2       2
	  (답변의답변은 요새 잘 안한다고함 ->부모는 종로구)
	  >>>탑골공원  1      3       3
	  >>>솔데스크  1      3       4
	  >>>>803호	 1		4		5
	  (부모는 인사동)  
	  >>관철동     1      2       4 -> 5 -> 6
	  >강남구		 1		1       5 -> 6 -> 7
	  >마포구		 1		1       6 -> 7 -> 8
2	  일본          2		0		0
 	  >도쿄		 2
 	  >오사카		 2
 	  >후쿠시마	 2
3     중국		 3
4	   미국  		 4	

 -->

<div class="container">
	<h3>답변 작성</h3>
	<%
	//부모글 가져오기
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	%>
	<form name="bbsfrm"
		  method="post"
		  action="bbsReplyProc.jsp"
		  onsubmit="return bbsCheck(this)">
		<!-- 새글과 답변의 차이. 답변은 부모bbsno번호를 보내야한다. -->
		<input type="hidden" name="bbsno" value="<%=bbsno%>">
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