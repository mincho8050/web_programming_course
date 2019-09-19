<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%@ page import="net.utility.*" %>
<%@ page import="net.pds.*" %>

<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<jsp:useBean id="dao" class="net.pds.PdsDAO"></jsp:useBean> 
<jsp:useBean id="dto" class="net.pds.PdsDTO"></jsp:useBean> 

<%request.setCharacterEncoding("UTF-8");%>
