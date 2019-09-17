<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./member/auth.jsp"%>
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
				<h2 class="modal-title" id="myModalLabel"
					style="text-align: center;">Login</h2>
			</div>
			<div class="modal-body">

				<%
					if (s_id.equals("guest") || s_passwd.equals("guest")
							|| s_mlevel.equals("guest")) { //로그인을 하지 않은 경우
															//쿠키값을 가져오기
						Cookie[] cookies = request.getCookies();
						String c_id = "";
						if (cookies != null) { //쿠키가 존재하는지?
							for (int i = 0; i < cookies.length; i++) {
								Cookie cookie = cookies[i];
								//쿠키변수 c_id
								if (cookie.getName().equals("c_id") == true) {
									c_id = cookie.getValue();
								}
							}
						}
				%>
				<form name="loginfrm" method="post" action="../member/loginProc.jsp"
					onsubmit="return loginCheck(this)">

					<table class="table" style="width: 500px;">
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" value="<%=c_id%>" size="10"
								placeholder="아이디를 입력하세요." required class="form-control"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="passwd" size="30"
								placeholder="비밀번호를 입력하세요." required class="form-control"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="checkbox" name="c_id"
								value="SAVE" <%if (!(c_id.isEmpty())) {
					out.print("checked");
				}%>>
								아이디 저장 <span><a href="../member/agreement.jsp">회원가입</a></span> <span><a
									href="agreement.jsp">아이디/비밀번호 찾기</a></span></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="로그인"
								class="btn btn-primary"> <input type="reset" value="취소"
								data-dismiss="modal" class="btn btn-outline-secondary">
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
	
