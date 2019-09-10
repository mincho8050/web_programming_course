<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ssi.jsp 공통페이지  -->
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%@ page import="net.bbs.*"%>
<%@ page import="net.utility.*"%>

<jsp:useBean id="dto" class="net.bbs.BbsDTO"></jsp:useBean>
<jsp:useBean id="dao" class="net.bbs.BbsDAO"></jsp:useBean>

<%request.setCharacterEncoding("UTF-8");%>

<%
	//검색
	String col=request.getParameter("col");	 //검색칼럼
	String word=request.getParameter("word");//검색어
	
	//String값이 null이면 공백 문자열 반환
	col=Utility.checkNull(col);
	word=Utility.checkNull(word);
%>