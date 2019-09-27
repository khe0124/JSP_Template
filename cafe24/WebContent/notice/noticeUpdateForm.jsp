<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 -->
<div class="container-fluid">
<h2>UPDATE</h2>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	dto = dao.read(num);
	if (dto == null) {
		out.println("해당 게시글이 없습니다.");
	} else {
%>
<form method="post" action="noticeUpdateProc.jsp"
	onsubmit="return bbsCheck(this)">
	<table class="table">

		<tr>
			<th>글번호</th>
			
			<td><input type="text" name="num" value="<%=dto.getNum()%>"
				readonly class="form-control"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="writer" maxlength="20"
				value="<%=dto.getWriter()%>" required autofocus class="form-control"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" size="30" maxlength="100"
				value="<%=dto.getSubject()%>" required class="form-control"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="30" name="content"
					class="form-control"><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" size="10"
				maxlength="10"  value="<%=dto.getPasswd()%>" class="form-control"></td>
		</tr>

		<tr>
			<td colspan="2" align="center" class="bottom">
			<input type="submit" value="수정" class="submit btn btn-default"> 
			<input type="reset"	value="취소" class="reset btn btn-primary">
		</tr>

	</table>

</form>
<%
	}
%>


</div>

<%@ include file="../footer.jsp"%>

