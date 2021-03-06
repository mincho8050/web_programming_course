<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 -->
<div class="container">
<h3>게시글</h3>
<p class="link"><a href="bbsForm.jsp">Write</a></p>
<p class="link"><a href="bbsList.jsp">List</a></p>

	<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	  dto=dao.read(bbsno);
	  if(dto==null){
	      out.print("해당 게시글이 없습니다.");
	  }else{
		  //조회수 증가
		  dao.incrementCnt(bbsno);
	%>
	<table class="table readTable">
	  <tr>
	    <th colspan="4"><%=dto.getSubject()%></th>
	  </tr>
	  <tr>
	    <td>번호 : <%=dto.getBbsno()%></td>
	    <td>조회수 : <%=dto.getReadcnt()%></td>
	    <td>작성자 : <%=dto.getWname()%></td>
	    <td>작성일 : <%=dto.getRegdt().substring(0,10)%></td>
	    <%-- <td>IP : <%=dto.getIp()%></td> --%>
	  </tr>
	  <tr>
	    <td colspan="4" rowspan="2"><%=dto.getContent()%></td>
	  </tr>
	  <tr>
	  </tr>
	</table>
    <br>
    <input type="button" value="답변" onclick="location.href='bbsReply.jsp?bbsno=<%=bbsno %>'">
    <input type="button" value="수정" onclick="location.href='bbsUpdate.jsp?bbsno=<%=bbsno %>'">
    <input type="button" value="삭제" onclick="location.href='bbsDel.jsp?bbsno=<%=bbsno %>'">
	<%
	}//if
	
	%>	
	
</div>	
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>