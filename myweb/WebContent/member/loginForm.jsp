<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="auth.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 -->

<div class="container-fluid">
<h2>Login</h2>
<%if(s_id.equals("guest") || s_passwd.equals("guest")|| s_mlevel.equals("guest")){
	
 %>
<form name="loginfrm" method="post" action="loginProc.jsp"
	onsubmit="return loginCheck(this)">

	<table class="table">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" size="10" placeholder="아이디를 입력하세요."
				required class="form-control" ></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" size="30" placeholder="비밀번호를 입력하세요."
				required class="form-control"></td>
		</tr>
		<tr>			
			<td colspan="2">
				아이디 저장
				<span><a href="agreement.jsp">회원가입</a>></span>
				<span><a href="agreement.jsp">아이디/비밀번호 찾기</a>></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="로그인" class="btn btn-primary">
			<input type="reset"  value="취소" class="btn btn-outline-secondary">			
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
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>