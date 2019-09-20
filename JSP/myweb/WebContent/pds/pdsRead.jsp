<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 pdsRead.jsp-->
<div class="container photo">

<h3>상세보기</h3>
<p class="link">
	<a href="pdsForm.jsp">Upload</a>&nbsp;&nbsp;
	<a href="pdsList.jsp">List</a>
</p>
<%
int pdsno=Integer.parseInt(request.getParameter("pdsno"));
dto=dao.read(pdsno);
if(dto==null){
	out.print("관련 자료가 없습니다.");
}else{
	//조회수 증가
	  dao.incrementCnt(pdsno); 
}//if
%>

<table class="table">
<tr>
	<th colspan="4"><%=dto.getSubject()%></th>
</tr>
<tr>
	<td>작성자 : <%=dto.getWname()%></td>
	<td>파일크기 : <%=Utility.toUnitStr(dto.getFilesize()) %></td>
	<td>조회수 : <%=dto.getReadcnt() %></td>
	<td>작성일 : <%=dto.getRegdate().substring(0,10) %></td>
</tr>
<tr>
	<td colspan="4" rowspan="2">
	<img src="../storage/<%=dto.getFilename()%>">
	</td>
</tr>
</table>
<br>

<input type="button" value="수정" onclick="location.href='pdsUpdate.jsp?pdsno=<%=pdsno%>'">
<input type="button" value="삭제" onclick="location.href='pdsDel.jsp?pdsno=<%=pdsno%>'">

	
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>