<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/mystyle.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="../js/myscript.js"></script>
  
  <!-- 글씨체 -->
  <link href="https://fonts.googleapis.com/css?family=Bad+Script|Chewy|Pacifico&display=swap" rel="stylesheet">
  
</head>
<body>

<!-- 메인 카테고리 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">
      	ReVeluv
      </a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../bbs/bbsList.jsp">게시판</a></li>
        <li><a href="../notice/noticeList.jsp">공지사항</a></li>
        <li><a href="../member/loginForm.jsp">로그인</a></li>
        <li><a href="../pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="../mail/mailForm.jsp">메일보내기</a></li>
        <li><a href="../bbs2/bbslist.do">게시판(MVC)</a></li>
        <li><a href="../member2/loginform.do">로그인(MVC)</a></li>

      </ul>
    </div>
  </div>
</nav>
<!-- 메인 카테고리끝 -->




<!-- Container 시작 -->
<div class="container-fluid bg-3 text-center">
	<div class="row">
		<div class="col-sm-12">

