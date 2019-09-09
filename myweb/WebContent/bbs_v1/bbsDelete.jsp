<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 --> 
<div class="container-fluid">
<h2>DELETE</h2>
<form method="post" action="bbsDeleteProc.jsp"
	onsubmit="return pwCheck(this)">
	<table class="table">
		<tr>
			<th>비밀번호</th>
			<td>
			<input type="hidden" name="bbsno"  value="<%=request.getParameter("bbsno")%>">
			<input type="password" name="passwd" class="form-control" required autofocus>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인" class="btn btn-primary">
			</td>
		</tr>
	</table>

</form>
 <!-- 본문 끝 -->
 </div>
 
<%@ include file = "../footer.jsp" %>

