<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<%@ include file="ssi.jsp"%>
<!-- 본문시작 bbsList.jsp -->

<div class="container">
<h3>게시판</h3>
<p class="link">
	<a href="bbsForm.jsp">Write</a>&nbsp;&nbsp;
	<a href="bbsList.jsp">List</a>
</p>
	
	<table class="table">
	<tr>
		<th>제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
	</tr>

	<%
	  //전체목록은  ArrayList<BbsDTO> list = dao.list();
	  //검색목록(col 칼럼명, word 검색어)
	  ArrayList<BbsDTO> list = dao.list(col,word); 
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
					<!-- 
					검색 후 상세보기 한 다음 목록을 누르면 검색했던 창 그대로 보여주기 위함.
					그대로 남겨지게 보이려면 리스트에서 상세보기로 보낼때 bbsno, col, word를 보내고
					다시 상세보기에서 목록으로 보낼때 똑같이 보낸다.
					페이지는 연결이 끊기기 때문에 줬던 값을 다시 줘야 페이지가 유지된다.
					그냥 단순하게 뒤로 가기 누르기는 서버에 요청하는게 아니라 브라우저에 남는 정보를 보여주기때문에 다르다.
					 -->
			    	<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>"><%=dto.getSubject()%></a>
	<%
					//조회수가 10 이상이면 hot이미지 출력
					if(dto.getReadcnt()>=10){
						out.println("<img src='../images/star.png'>");
					}//if
					
					//오늘 작성한 글제목 뒤에 new이미지 출력
					//redgt에서 "년월일"만 자르기 -> 예)2019-09-04
					String regdt=dto.getRegdt().substring(0,10);
					if(regdt.equals(today)){
						out.println("<img src='../images/new2.png'>");
					}//if
	%>
			    </td>
			    <td><%=dto.getWname()%></td>
			    <td><%=dto.getReadcnt()%></td>	  
			    <td><%=regdt%></td>
			  </tr>
	<%          
	      }//for end

		  //글 갯수
		  int totalRecord=dao.count(col, word);
	      out.println("<tr>");
	      out.println("  <td colspan='4'>");
	      out.println("  글갯수 : <strong>");
	      out.println(totalRecord);
	      out.println("  </strong>");
	      out.println("  </td>");
	      out.println("</tr>");
	      
	%>      
	<!-- 검색시작 -->    
      <tr>
      	<td colspan="4" style="text-align: center; height: 50px">
		<form action="bbsList.jsp"
		      onsubmit="return searchCheck(this)">
		  <select name="col">
		    <option value="wname">작성자
		    <option value="subject">제목
		    <option value="content">내용
		    <option value="subject_content">제목+내용		    
		  </select>
		  <input type="text"   name="word">
		  <input type="submit" value="검색">
		</form>      	
      	</td>
      </tr>
  	  <!-- 검색끝 -->
	<%  
	  }//if end
	%>  
	</table>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp"%>