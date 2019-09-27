<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 -->
<div class="container-fluid">
<h2>Notice</h2>

<%	
	String stest = request.getParameter("num")==null? "":request.getParameter("num");
	out.print(stest);
	int num = Integer.parseInt(stest);	
	dto = dao.read(num);
	if (dto == null) {
		out.print("해당글없음");
	} else {

		//조회수 증가
		dao.incrementCnt(num);
%>
<div class = "table-div">
<table class="table">
	<tr>
		<th colspan="5" class ="readTitle"><%=dto.getSubject()%></th>
	</tr>
	<tr>
		<td>글번호 : <%=dto.getNum()%></td>
		<td>작성자 : <%=dto.getWriter()%></td>
		<td>이메일 : <%=dto.getEmail()%></td>
		<td>등록일 : <%=dto.getReg_date()%></td>
		<td>조회수 : <%=dto.getReadcount()%></td>
	</tr>
	<tr>
		<td colspan="5" class="contentRead" style="padding:100px 0;">
		<%
			String content = dto.getContent();			
			content = content.replaceAll("'", "&apos;");
			content = content.replaceAll("\"", "&quot;");
			content = content.replaceAll("<", "&lt;");
			content = content.replaceAll(">", "&gt;");
			content = content.replaceAll("\r\n", "<br>");
			out.print(content);		
		%>
		
		</td>
	</tr>
	<tr>
		  <td colspan = "5" style="text-align: left; height: 50px;">
		  <form action="noticeList.jsp" 
		  		onsubmit="return commentCheck(this)">		  		  	
		  	<input type="text"   name="cwname" class="form-control" placeholder="작성자" style="display: unset; width:20%" >
		  	<textarea rows="3" cols="15" name="comment" placeholder="내용을 입력하세요."  class="form-control" style="display: unset; width:70%"></textarea>		  	
		  	<input type="submit" value="댓글달기" class="btn btn-default" style="width: 9%; height: 74px;">
		  </form>
		  </td>
	<tr>
		<td colspan ="3" style="text-align: left;">
			<a href="bbsReply.jsp?num=<%=dto.getNum()%>" class="reply btn btn-default">답변</a>
			<a href="bbsUpdate.jsp?num=<%=dto.getNum()%>" class="modify btn btn-default">수정</a> 
			<a href="bbsDelete.jsp?num=<%=dto.getNum()%>" class="delete btn btn-danger">삭제</a>					
		</td>		
		<td colspan ="2">
			<p style="float:right;">	
				<a href="bbsForm.jsp"  class="btn btn-primary">글쓰기</a>
				<a href="bbsList.jsp"  class="btn btn-default">글목록</a>	
			</p>
		</td>
	</tr>
</table>

<%
	}//if end
%>

</div>
</div>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>