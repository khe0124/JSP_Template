<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 --> 
<div class="container-fluid">
<h2>Find Account</h2>
<form method="post" action="findAccountProc.jsp" onsubmit="">
	<table class="table">
		<tr>
			<th>이름</th>
			<td>				
			<input type="text" name="mname" id="mname" size="15" class="form-control" required autofocus>
			</td>			
		</tr>
		<tr>
			<th>이메일</th>
			<td>				
			<input type="text" name="email" id="email" size="30" class="form-control" required autofocus>
			</td>
		</tr>
		<tr>
			<td>
			<input type="submit" value="확인" class="btn btn-primary">
			</td>
		</tr>
	</table>
</form>
 <!-- 본문 끝 -->
 </div>
 
<%@ include file = "../footer.jsp" %>

