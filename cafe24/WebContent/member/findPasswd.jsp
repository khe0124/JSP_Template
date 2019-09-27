<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 --> 
<div class="container-fluid">
<h2>Find Password</h2>

<form method="post" action="findPasswdForm.jsp"
	onsubmit="">
	<table class="table">
		<tr>
			<th>가입하신 아이디</th>
			<td>				
			<input type="text" name="id" id="id" size="15" class="form-control">
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

