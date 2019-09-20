<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 pdsList.jsp -->
<div class="container photo">

	<h3>포토 갤러리</h3>
	<p class="link"><a href="pdsForm.jsp">Upload</a></p>
 <%-- 	<%
	ArrayList<PdsDTO> list=dao.list();
	if(list==null){
		out.println("관련 자료가 없습니다.");
	}else{
	%>
	전체 글 갯수 : <%=list.size() %> <br><br>
	<table class="table">
	<tr>
		<th>제목</th>
		<th>사진</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>
	
	<%	
	for(int idx=0;idx<list.size();idx++){
		dto=list.get(idx);
	%>
	<tr>
		<td class="list">
			<a href="pdsRead.jsp?pdsno=<%=dto.getPdsno()%>">
				<%=dto.getSubject() %>
			</a>
		</td>
		<td><img src="../storage/<%=dto.getFilename()%>" width="60" height="60"></td>
		<td><%=dto.getWname() %></td>
		<td><%=dto.getReadcnt() %></td>
		<td><%=dto.getRegdate().substring(0,10) %></td>
	</tr>
		
	<%
	}//for
	out.println("</table>");
	}//if
	%>

 --%>

	<%
	ArrayList<PdsDTO> list=dao.list();
	if(list==null){
		out.println("관련 자료가 없습니다.");
	}else{
	%>
	
	<p class="totalList"><span class="total">Total :</span> <%=list.size() %></p>
	 
 	
 	<%
	for(int idx=0;idx<list.size();idx++){
		dto=list.get(idx);
	%>
	<div class="photo1">
 		<a href="pdsRead.jsp?pdsno=<%=dto.getPdsno()%>">
			<img src="../storage/<%=dto.getFilename()%>" class="p_img">
		</a>	
		<div class="p_name">
			<p>
				<%=dto.getWname() %>
			</p>
		</div>
		<div class="p_sub">
			<p>
				<%=dto.getSubject() %>
			</p>
		</div>
		<div class="p_date">
			<p>
				<%=dto.getRegdate().substring(0,10) %>
			</p>
		</div>
	</div>
	<%
	}//for
		//out.print("</div>");
	}//if
	%>
	
	


<!--마지막  -->
</div>


<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>