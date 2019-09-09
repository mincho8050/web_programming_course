<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/mystyle.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="js/myscript.js"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
  
  <!-- 글씨체 -->
 <link href="https://fonts.googleapis.com/css?family=Bad+Script|Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>

<!-- 메인카테고리 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">ReVeluv</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
        <li><a href="./bbs2/bbslist.do">게시판(MVC)</a></li>
        <li><a href="./member2/loginform.do">로그인(MVC)</a></li>

      </ul>
    </div>
  </div>
</nav>
<!-- 메인카테고리끝 -->

<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <img src="images/rv_logo.png" class="img-responsive margin" style="display:inline" alt="Bird" width="350" height="350">
</div>


<!-- Third Container (Grid) -->
<!-- <div class="container-fluid bg-3 text-center"> -->
<div class="container-fluid bg-3 text-center">
	<h2 class="title_video">Red Velvet Music Video</h2>
	
	<a href="https://www.youtube.com/watch?v=JFgv8bKfxEs" data-toggle="lightbox" data-gallery="youtubevideos" class="col-sm-4">
	    <div class="overlay"></div>
	    <img src="images/a_rv01.jpg" class="img-fluid img-thumbnail">
	</a>
	
	 <a href="https://www.youtube.com/watch?v=XGdbaEDVWp0" data-toggle="lightbox" data-gallery="youtubevideos" class="col-sm-4">
	    <div class="overlay"></div>
	    <img src="images/a_rv02.jpg" class="img-fluid img-thumbnail">
	</a>

	<a href="https://www.youtube.com/watch?v=J0h8-OTC38I" data-toggle="lightbox" data-gallery="youtubevideos" class="col-sm-4">
	    <div class="overlay"></div>
	    <img src="images/a_rv03.jpg" class="img-fluid img-thumbnail">
	</a>
	
	<a href="https://www.youtube.com/watch?v=QslJYDX3o8s" data-toggle="lightbox" data-gallery="youtubevideos" class="col-sm-4">
	    <div class="overlay"></div>
	    <img src="images/a_rv04.jpg" class="img-fluid img-thumbnail">
	</a>
	
	<a href="https://www.youtube.com/watch?v=WyiIGEHQP8o" data-toggle="lightbox" data-gallery="youtubevideos" class="col-sm-4">
	    <div class="overlay"></div>
	    <img src="images/a_rv05.jpg" class="img-fluid img-thumbnail">
	</a>
	
	<a href="https://www.youtube.com/watch?v=aiHSVQy9xN8" data-toggle="lightbox" data-gallery="youtubevideos" class="col-sm-4">
	    <div class="overlay"></div>
	    <img src="images/a_rv06.jpg" class="img-fluid img-thumbnail">
	</a>
	
	

</div>


<!-- 캐러셀 -->

<!-- 끝 -->


<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p>Red Velvet</p> 
</footer>

</body>
</html>

