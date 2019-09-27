<%@page import="net.comment.CommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<jsp:useBean id="cdao" class="net.comment.CommentDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="net.comment.CommentDTO"></jsp:useBean>

<!-- 본문 시작 -->
<div class="container-fluid">
<h2>READ</h2>

<%	
	String id = (String)session.getAttribute("s_id");
	if(id==null){
		id="guest";
		out.print(id);
	}else{
		out.print(id);
	};
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
		  <form action="../comment/commIns.jsp" 
		  		onsubmit="return commentCheck(this)" method="post">		  		  	
		  	<input type="text"   name="cname" class="form-control" placeholder="작성자" style="display: unset; width:20%" value="<%=id%>">
		  	<input type="hidden"   name="bbsno" value="<%=dto.getBbsno()%>" >
		  	<textarea rows="3" cols="15" name="cocontent" placeholder="내용을 입력하세요."  class="form-control" style="display: unset; width:70%"></textarea>		  	
		  	<input type="submit" value="댓글달기" class="btn btn-default" style="width: 9%; height: 74px;">
		  </form>
		  </td>
		<%
		 int cobbsno = dto.getBbsno();
		 cdto.setCobbsno(cobbsno);
		 ArrayList<CommentDTO> list = cdao.list(cdto);
		 
		 if(list == null){
			 out.println("<tr>");
				out.println("	<td colspan='6'>아직 댓글이 없습니다.</td>");
				out.println("</tr>");
			 } else{
				 for (int i=0; i<list.size(); i++){
					 cdto = list.get(i);
					 %>
					 <tr id='#comment'>						 	
						<td>작성자: <%=cdto.getCname()%></td>
					 	<td colspan='2'><%=cdto.getCocontent()%></td>
					 	<td><%=cdto.getCodate()%></td>
					 <tr>
					 <%
					 
				 }//for end
			 }//else end
		 %>
	<tr>		
		<td colspan ="2" style="text-align: left;">
			<a href="bbsReply.jsp?bbsno=<%=dto.getBbsno()%>" class="reply btn btn-default">답변</a>
			<a href="bbsUpdate.jsp?bbsno=<%=dto.getBbsno()%>" class="modify btn btn-default">수정</a> 
			<a href="bbsDelete.jsp?bbsno=<%=dto.getBbsno()%>" class="delete btn btn-danger">삭제</a>					
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