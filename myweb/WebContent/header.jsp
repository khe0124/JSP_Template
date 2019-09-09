<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>SpongeBob SquarePants</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/reset.css">  
  <link rel="stylesheet" href="../css/mystyle.css">  
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet" >
  <link href="https://fonts.googleapis.com/css?family=Sedgwick+Ave&display=swap" rel="stylesheet">
  <script src="../js/jquery-3.3.1.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/myscript.js"></script>
 
</head>

<style>
</style>
<body>

<!-- Navbar -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <h1 id="logo"><a class="navbar-brand hideTxt" href="<%=request.getContextPath()%>/index.jsp"><img src="../img/logo.png" alt="logo"></a></h1>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="../bbs/bbsList.jsp">BOARD</a></li>
        <li><a href="./notice/noticeList.jsp">NOTICE</a></li>
        <li><a href="./member/loginForm.jsp">LOGIN</a></li>
        <li><a href="./pds/pdsList.jsp">GALLERY</a></li>
        <li><a href="./mail/mailForm.jsp">CONTACT</a></li>
        <li><a href="./bbs2/bbslist.do">게시판(MVC)</a></li>
        <li><a href="./member2/loginForm.do">로그인(MVC)</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- Container 시작-->
<div class="bg-0 text-center">
	<div class ="row">
		<div class="col-sm-12">
