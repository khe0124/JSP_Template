<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 -->

<style>
label {text-align: left; font-size: 18px; font-weight: bold;}
img { width: 65%; }
</style>

<div class="container-fluid">
<h2>READ</h2>

<%
	int pdsno = Integer.parseInt(request.getParameter("pdsno"));
	dto = dao.read(pdsno);
	if (dto == null) {
		out.print("해당 정보 없음");
	} else {

		//조회수 증가
		dao.incrementCnt(pdsno);
%>
<div class = "table-div">
<table class="table">
	<tr>
		<th colspan="5" class ="readTitle"><%=dto.getSubject()%></th>
	</tr>
	<tr>
		<td>글번호 : <%=dto.getPdsno()%></td>
		<td>작성자 : <%=dto.getWname()%></td>
		<td>등록일 : <%=dto.getRegdate()%></td>
		<td>조회수 : <%=dto.getReadcnt()%></td>
		<td>파일크기 : <%=Utility.toUnitStr(dto.getFilesize())%></td>		
	</tr>
	<tr>
		<td colspan="5" class="contentRead" style="padding:100px 0;">
		<img src="../storage/<%=dto.getFilename()%>">
		<br>
		<br>
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
		<td colspan ="2" style="text-align: left;">			
			<a href="pdsUpdate.jsp?pdsno=<%=dto.getPdsno()%>" class="modify btn btn-default">수정</a> 
			<a href="pdsDelete.jsp?pdsno=<%=dto.getPdsno()%>" class="delete btn btn-danger">삭제</a>					
		</td>		
		<td colspan ="3">
			<p style="float:right;">	
				<a href="pdsForm.jsp"  class="btn btn-primary">글쓰기</a>
				<a href="pdsList.jsp"  class="btn btn-default">글목록</a>	
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