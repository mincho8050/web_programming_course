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
      <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">HOME</a>
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
<!-- 메인 카테고리끝 -->


<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <img src="images/t03.jpg" class="img-responsive img-circle margin" style="display:inline" alt="Bird" width="350" height="350">
</div>

<!-- Container 시작 -->
	<div class="container-fluid bg-3 text-center">
		<div id="masterhead">
		<div class="container">
		<div class="slideshow">
		<div id="slideshow" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
		<div class="item active">
			<img class="img-responsive" src="images/t01.jpg">
		<div class="container">
		<div class="carousel-caption">
		</div>
		</div>
		</div><!-- /. Item Active -->
		<div class="item">
			<img class="img-responsive" src="images/t10.jpg" alt="Second Slide">
		<div class="container">
		<div class="carousel-caption">
		</div>
		</div>
		</div><!-- /. Item -->
	<div class="item">
		<img class="img-responsive" src="images/t07.jpg" alt="Third slide">
	<div class="container">
	<div class="carousel-caption">
	</div>
	</div>
	</div><!-- /. Item -->
	</div><!-- /. Carousel-Inner -->
	<div class="controlsBlock">
	<div class="controls">
		<a class="left carousel-control" href="#slideshow" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
	 	<a class="right carousel-control" href="#slideshow" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	<!--<a class="left carousel-control" href="#slideshow" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
	 <a class="right carousel-control" href="#slideshow" data-slide="next"><i class="fa fa-chevron-right"></i></a>-->
	<div class="carousel-indicators">
		<li data-target="#slideshow" data-slide-to="0" class="active"></li>
		<li data-target="#slideshow" data-slide-to="1"></li>
		<li data-target="#slideshow" data-slide-to="2"></li>
	</div>
	</div>
	</div>
	</div><!-- /# Slideshow .Carousel -->
	</div><!-- /. Slideshow -->
	</div><!-- /. Container -->
	</div><!-- /# Mastehead -->
	</div>
<!-- Container 끝 -->

<!-- Footer -->
<footer class="container-fluid bg-4 text-center">
  <p>Bootstrap Theme Made By <a href="https://www.w3schools.com">www.w3schools.com</a></p> 
</footer>

</body>
</html>
