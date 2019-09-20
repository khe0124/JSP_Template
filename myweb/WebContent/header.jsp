<%@ page contentType="text/html; charset=UTF-8"%>
<!-- Modal Container -->
<%@ include file="./Modal.jsp"%>
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
        <li><a href="../pds/pdsList.jsp">GALLERY</a></li>
        <li><a href="./mail/mailForm.jsp">CONTACT</a></li>
        <li><a href="./bbs2/bbslist.do">게시판(MVC)</a></li>
        			<%
						// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
						if (session.getAttribute("s_id") == null) {
					%>
					<li><button type="button" id="loginBtn" class="navbarBtn btn btn-primary">로그인</button></li>
					<li><button id="joinBtn" class="navbarBtn btn btn-default"
						onclick="location.href='../member/agreement.jsp'">회원가입</button></li>
					<%
						// 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
						} else {
					%>
					<li><button id="logoutBtn" class="navbarBtn btn btn-default"
						onclick="location.href='../member/logout.jsp'">로그아웃</button></li>
					<li><button id="myInfoBtn" class="navbarBtn btn btn-default"
						onclick="location.href='../member/myInfo.jsp?id=<%=(String)session.getAttribute("s_id")%>'">내정보</button></li>
					<% } %>
				</ul>
			</div>
		</div>
	</nav>
	<script>
	/* 모달창 제어: 로그인 */
	$("#loginBtn").on("click", function() {
		$("#login_modal").modal();
	});
	
	</script>
		
<!-- Container 시작-->
<div class="bg-0 text-center">
	<div class ="row">
		<div class="col-sm-12">
