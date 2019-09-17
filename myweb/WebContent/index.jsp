<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="member/auth.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>SpongeBob SquarePants</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/mystyle.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet">
<link href="http://fonts.googleapis.com/earlyaccess/notosanskr.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Sedgwick+Ave&display=swap"
	rel="stylesheet">
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/myscript.js"></script>

</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1 id="logo">
					<a class="navbar-brand hideTxt"
						href="<%=request.getContextPath()%>/index.jsp"><img
						src="img/logo.png" alt="logo"></a>
				</h1>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="./bbs/bbsList.jsp">BOARD</a></li>
					<li><a href="./notice/noticeList.jsp">NOTICE</a></li>
					<li><a href="./pds/pdsList.jsp">GALLERY</a></li>
					<li><a href="./mail/mailForm.jsp">CONTACT</a></li>
					<li><a href="./bbs2/bbslist.do">게시판(MVC)</a></li>
					<li><a href="./member2/loginForm.do">로그인(MVC)</a></li>					
					<%
						// 로그인 안되었을 경우 - 로그인, 회원가입 버튼을 보여준다.
						if (session.getAttribute("s_id") == null) {
					%>
					<li><button type="button" id="loginBtn" class="btn btn-primary">로그인</button></li>
					<li><button id="joinBtn" class="btn btn-default"
						onclick="location.href='member/agreement.jsp'">회원가입</button></li>
					<%
						// 로그인 되었을 경우 - 로그아웃, 내정보 버튼을 보여준다.
						} else {
					%>
					<li><button id="logoutBtn" class="btn btn-default"
						onclick="location.href='member/logout.jsp'">로그아웃</button></li>
					<li><button id="myInfoBtn" class="btn btn-default" onclick ="location.href='./member/myInfo.jsp?id=<%=(String)session.getAttribute("s_id")%>'">내정보</button></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- Modal Container -->
	<!-- Login Modal -->
	<div class="modal fade" id="login_modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
					<h2 class="modal-title" id="myModalLabel" style="text-align:center;">Login</h2>
				</div>
				<div class="modal-body">
					
				<%if(s_id.equals("guest") || s_passwd.equals("guest")|| s_mlevel.equals("guest"))
					{ //로그인을 하지 않은 경우
					  //쿠키값을 가져오기
					  Cookie[] cookies = request.getCookies();
					  String c_id = "";
					  if(cookies != null) { //쿠키가 존재하는지?
						  for (int i = 0; i<cookies.length; i++) {
							  Cookie cookie = cookies[i];
							  //쿠키변수 c_id
							  if(cookie.getName().equals("c_id")==true){
								  c_id = cookie.getValue();
							  }
						  }
					  }
				 %>
				<form name="loginfrm" 
					  method="post" 
					  action="member/loginProc.jsp"
					  onsubmit="return loginCheck(this)">
				
					<table class="table" style="width:500px;">
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" value="<%=c_id%>" size="10" placeholder="아이디를 입력하세요."
								required class="form-control" ></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="passwd" size="30" placeholder="비밀번호를 입력하세요."
								required class="form-control"></td>
						</tr>
						<tr>			
							<td colspan="2">
								<input type="checkbox" name="c_id" value="SAVE" 
								<%if(!(c_id.isEmpty())){out.print("checked");} %>				
								> 아이디 저장 
								<span><a href="./member/agreement.jsp">회원가입</a></span>
								<span><a href="agreement.jsp">아이디/비밀번호 찾기</a></span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="submit" value="로그인" class="btn btn-primary">
							<input type="reset"  value="취소" data-dismiss="modal" class="btn btn-outline-secondary">			
							</td>
						</tr>
					</table>
				</form>
				<%
				} else { //로그인 성공했다면.
					out.println("<strong>" + s_id + "</strong>님");
				 	out.println("<a href='logout.jsp'>[로그아웃]</a>");
					out.println("<br><br>");
					out.println("[회원정보수정]");
					out.println("[회원탈퇴]");
				}
				%>
				</div>
			</div>
		</div>
	</div>
	

	<!-- First Container -->
	<div class="container-fluid bg-1 text-center">
		<h2 class="margin Sedgwick">Who Am I?</h2>
		<img src="img/square.png" class="img-responsive profile"
			style="display: inline" alt="SquarePants" width="350" height="350">
		<h4 class="Sedgwick">"I'm ready, I'm ready, I'm ready..."</h4>
	</div>

	<!-- Container 시작-->
	<div class="container-fluid bg-2 text-center">
		<h2>Who Are We?</h2>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<div class="imgBox">
					<img src="img/spongebob.png" class="img-responsive character"
						id="spongebob" alt="Image">
				</div>
				<input type="button" class="Sedgwick btn btn-default"
					onclick="change1()" value="Spongebob">
			</div>
			<div class="col-sm-4">
				<div class="imgBox">
					<img src="img/squidward.png" class="img-responsive character"
						id="squidward" alt="Image">
				</div>
				<input type="button" class="Sedgwick btn btn-default"
					onclick="change2()" value="Squidward">
			</div>
			<div class="col-sm-4">
				<div class="imgBox">
					<img src="img/patrick.png" class="img-responsive character"
						id="patrick" alt="Image">
				</div>
				<input type="button" class="Sedgwick btn btn-default"
					onclick="change3()" value="Patrick">
			</div>
		</div>
	</div>

	<div class="container-fluid bg-3 text-center">
		<h2>About Us!!</h2>
		<br>
		<div class="row">
			<ul class="ip_list">
				<li>
					<div class="thumb_box">
						<img src="img/spongebob03.jpg" alt="spongebob"
							style="width: 380px;">
					</div>
					<div class="info_desc">
						<strong>네모바지 스폰지밥</strong>
						<p>한국에서는 EBS판 한정으로 스펀지송이라고도 불렸으며 니켈로디언 더빙 초기(시즌4~시즌5) 때는 재능TV
							방영판 제목이였던 보글보글 스폰지밥으로 개명당했다가 시즌6 이후론 다시 네모바지 스폰지밥으로 돌아왔다.</p>
					</div>
				</li>
				<li>
					<div class="thumb_box">
						<img src="img/squidward03.jpg" alt="squidward"
							style="width: 380px;">
					</div>
					<div class="info_desc">
						<strong>징징이</strong>
						<p>뚱이와 함께 네모바지 스폰지밥의 양대 서브 주인공 중 한 명. 그리고 이 작품을 대표하는 불행한 캐릭터.
							또한, 모든 캐릭터들이 하나같이 정신줄을 놓은 듯한 스폰지밥 세계관에서 그나마 정상적인 캐릭터다.</p>
					</div>
				</li>
				<li>
					<div class="thumb_box">
						<img src="img/patrick03.jpg" alt="patrick" style="width: 380px;">
					</div>
					<div class="info_desc">
						<strong>뚱이</strong>
						<p>애니메이션 네모바지 스폰지밥의 서브 주인공. 집게리아에서 일하는 스폰지밥이나 징징이와는 달리 직업이 없기
							때문에 집이 앞의 두 등장인물과는 반대로 매우 초라하다. 그냥 스폰지밥의 집이나 징징이의 집의 절반도 안되는 크기의
							반구형 바위며, 그 밑에 붙어서 잔다.</p>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div class="container-fluid bg-4 text-center">
		<div class="row">
			<div class="col-sm-12">
				<div id="background-video" class="background-video">
					<iframe width="100%" height="720"
						src="https://www.youtube.com/embed/PI4T5EcJ1U4" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
			</div>
		</div>
	</div>

	<!-- Container 끝-->


	<!-- Footer -->
	<footer class="container-fluid bg-5 text-center">
		<p>Visit Our Youtube Channel!</p>
		<p>
			<a href="https://www.youtube.com/channel/UCx27Pkk8plpiosF14qXq-VA"
				style="color: yellow">SpongeBob's House</a>
		</p>
		<address>NewYork, United States of America</address>
	</footer>
	<script>
	/* 모달창 제어: 로그인 */
	$("#loginBtn").on("click", function() {
		$("#login_modal").modal();
	});
	
		var flag = true;
		function change1() {
			if (flag) {
				document.getElementById("spongebob").src = "img/spongebob2.png";
				flag = false;
			} else {
				document.getElementById("spongebob").src = "img/spongebob.png";
				flag = true;
			}

		}

		function change2() {
			if (flag) {
				document.getElementById("squidward").src = "img/squidward2.png";
				flag = false;
			} else {
				document.getElementById("squidward").src = "img/squidward.png";
				flag = true;
			}
		}

		function change3() {
			if (flag) {
				document.getElementById("patrick").src = "img/patrick2.png";
				flag = false;
			} else {
				document.getElementById("patrick").src = "img/patrick.png";
				flag = true;
			}
		}
	</script>
</body>
</html>