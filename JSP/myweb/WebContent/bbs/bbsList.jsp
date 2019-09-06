<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 bbsList.jsp -->

<div class="container">
<h3>게시판</h3>
<p class="link"><a href="bbsForm.jsp">Write</a></p>
	
	<table class="table">
	<tr>
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
		  
		  //오늘 날짜를 "2019-09-06" 문자열
		  String today=Utility.getDate();
		  
	      for(int idx=0; idx<list.size(); idx++) {
	          dto=list.get(idx);   
	%>
			  <tr>
			    <td class="list">
	<% 
					//답변이미지 출력
					for(int n=1; n<=dto.getIndent();n++){
						out.println("<img src='../images/reply.gif'>");
					}//for
	%>
			    	<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%></a>
	<%
					//조회수가 10 이상이면 hot이미지 출력
					if(dto.getReadcnt()>=10){
						out.println("<img src='../images/best.png'>");
					}//if
					
					//오늘 작성한 글제목 뒤에 new이미지 출력
					//redgt에서 "년월일"만 자르기 -> 예)2019-09-04
					String regdt=dto.getRegdt().substring(0,10);
					if(regdt.equals(today)){
						out.println("<img src='../images/new.png'>");
					}//if
	%>
			    </td>
			    <td><%=dto.getWname()%></td>
			    <td><%=dto.getReadcnt()%></td>	  
			    <td><%=regdt%></td>
			  </tr>
	<%          
	      }//for end
	  }//if end
	%>  
	</table>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>