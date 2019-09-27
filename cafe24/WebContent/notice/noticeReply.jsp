<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.bbs.*" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 bbsIns.jsp-->
<%
	//1) 사용자가 입력한 정보를 변수에 담기
	int num = Integer.parseInt(request.getParameter("num"));

%>
<div class="container-fluid">
<h2>REPLY</h2>
<form name="bbsfrm" method="post" action="noticeReplyProc.jsp"
	onsubmit="return bbsCheck(this)">
	<input type ="hidden" name="num" value="<%=num%>">
	<input type ="hidden" name="ref" value="">
	<input type ="hidden" name="re_level" value="">
	<input type ="hidden" name="re_step" value="">
	<table class="table">
		<tr>
			<th>작성자</th>
			<td><input type="text" name="wname" size="10" maxlength="20"
				required class="form-control"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" size="30" maxlength="100"
				required class="form-control"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="30" name="content"
					class="form-control"></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" size="10"
				maxlength="10" class="form-control"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="쓰기" class="btn btn-primary">
			<input type="reset"  value="취소" class="btn btn-outline-secondary">
			<span style="margin-left:20px; float:right;">
				<a href="bbsList.jsp" class="btn btn-default">글목록</a>
			</span>
			</td>
		</tr>
	</table>

</form>
</div>

<!-- 본문 끝 --> 
<%@ include file="../footer.jsp"%>