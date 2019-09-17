<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 -->
<div class="container-fluid">
<h2>READ</h2>

<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	dto = dao.read(bbsno);
	if (dto == null) {
		out.print("해당 정보 없음");
	} else {

		//조회수 증가
		dao.incrementCnt(bbsno);
%>
<div class = "table-div">
<table class="table">
	<tr>
		<th colspan="4" class ="readTitle"><%=dto.getSubject()%></th>
	</tr>
	<tr>
		<td>글번호 : <%=dto.getBbsno()%></td>
		<td>작성자 : <%=dto.getWname()%></td>
		<td>등록일 : <%=dto.getRegdt()%></td>
		<td>조회수 : <%=dto.getReadcnt()%></td>
	</tr>
	<tr>
		<td colspan="4" class="contentRead" style="padding:100px 0;">
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
		  <td colspan = "4" style="text-align: left; height: 50px;">
		  <form action="bbsList.jsp" 
		  		onsubmit="return commentCheck(this)">		  		  	
		  	<input type="text"   name="cwname" class="form-control" placeholder="작성자" style="display: unset; width:20%" >
		  	<textarea rows="3" cols="15" name="comment" placeholder="내용을 입력하세요."  class="form-control" style="display: unset; width:70%"></textarea>		  	
		  	<input type="submit" value="댓글달기" class="btn btn-default" style="width: 9%; height: 74px;">
		  </form>
		  </td>
	<tr>
		<td colspan ="2" style="text-align: left;">
			<a href="bbsReply.jsp?bbsno=<%=dto.getBbsno()%>&nowPage=<%=nowPage%>" class="reply btn btn-default">답변</a>
			<a href="bbsUpdate.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="modify btn btn-default">수정</a> 
			<a href="bbsDelete.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="delete btn btn-danger">삭제</a>					
		</td>		
		<td colspan ="2">
			<p style="float:right;">	
				<a href="bbsForm.jsp"  class="btn btn-primary">글쓰기</a>
				<a href="bbsList.jsp?col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"  class="btn btn-default">글목록</a>	
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