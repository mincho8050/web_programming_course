<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 bbsForm.jsp -->

<div class="container">
<h3>게시판</h3>
<p class="link"><a href="bbsForm.jsp">Write</a></p>
	
	<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>

	<%
	  //전체목록 
	  ArrayList<BbsDTO> list = dao.list();
	  if(list==null){
	      out.println("<tr>");
	      out.println("  <td colspan='5'>게시글이 없습니다.</td>");
	      out.println("</tr>");
	  }else{
	      for(int idx=0; idx<list.size(); idx++) {
	          dto=list.get(idx);   
	%>
			  <tr>
			  	<td><%=dto.getBbsno()%></td>
			    <td><a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a></td>
			    <td><%=dto.getWname()%></td>
			    <td><%=dto.getReadcnt()%></td>	  
			    <td><%=dto.getRegdt().substring(0,10)%></td>
			  </tr>
	<%          
	      }//for end
	  }//if end
	%>  
	</table>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>