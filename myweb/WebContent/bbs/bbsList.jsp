<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 bbsList.jsp-->

<br>
<h2>LIST</h2>
<br>
<div class = "table-div">
<table class="table">
	<tr id="t1">
		<%
		//글 갯수 세기
		int totalRecord = dao.count(col, word);
				
		out.println("<tr>");
		out.println("<td colspan='6' style='text-align:left;'>");
		out.println("글갯수: <strong>");
		out.println(totalRecord);
		out.println("</strong>");
		out.println("<tr>");		
		%>
	
		<th>No.</th>
		<th>작성자</th>
		<th>제목</th>
		<th>등록일</th>
		<th>조회수</th>
		<th>수정/삭제</th>
	</tr>
	<%	
		//한 페이지 당 출력할 글의 줄수
		int recordPerPage = 10;
	
		//전체목록
		ArrayList<BbsDTO> list = dao.list(col, word, nowPage, recordPerPage);
		if (list == null) {
			out.println("<tr>");
			out.println("	<td colspan='6'>결과를 찾을 수 없습니다.</td>");
			out.println("</tr>");
		} else {
			
			//오늘 날짜를 "2019-09-05" 문자열
			String today = Utility.getDate();
			
			for (int idx = 0; idx < list.size(); idx++) {
				dto = list.get(idx);
	%>
	<tr>
		<td><%=dto.getBbsno()%></td>
		<td><%=dto.getWname()%></td>
		<td class="sub_title">
			<%
			//답변이미지 출력
			for(int n=0; n<dto.getIndent(); n++){
				out.println("└ RE: ");
			}//for end
			
			if (dto.getReadcnt() >= 10){
				out.println("<img src='../img/hot.png' width=25>");
			}	
			
			%>
			<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"><%=dto.getSubject()%>
			<%
			//오늘 작성한 글제목 뒤에 new 이미지 출력
			//regdt에서 "년월일"만 자르기 -> 예)2019-09-04	
			String regdt = dto.getRegdt().substring(0,10);
			if (regdt.equals(today)){
				out.println("<img src='../img/new.png' width=25>");
			}			
			%>			
			</a>
		</td>
		<td><%=dto.getRegdt().substring(0,10)%></td>
		<td><%=dto.getReadcnt()%></td>		
		<td><a href="bbsUpdate.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>"
			class="modify btn btn-default">수정</a> <a
			href="bbsDelete.jsp?bbsno=<%=dto.getBbsno()%>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>" class="delete btn btn-danger">삭제</a>
		</td>
	</tr>	
	<%
		}//for end	
	%>
		<!-- 검색시작 -->
		<tr>
		  <td colspan = "4" style="text-align: left; height: 50px;">
		  <form action="bbsList.jsp" 
		  		onsubmit="return searchCheck(this)">
		  	<select name="col" class="form-control" style="display: unset; width:inherit" >
		  	  <option value="wname">작성자</option>
		  	  <option value="subject">제목</option>
		  	  <option value="content">내용</option>
		  	  <option value="subject_content">제목+내용</option>
		  	</select>
		  	<input type="text"   name="word" class="form-control" style="display: unset; width:inherit" >
		  	<input type="submit" value="검색" class="btn btn-default">
		  </form>
		  
		  <td colspan="2" style="text-align:right;">
			<p>
			<a href="bbsForm.jsp" class="btn btn-default">글쓰기</a>
			</p>
		</td>
		<tr>
		
		<!-- 검색끝 -->
	<%
		}//if end
	%>
</table>

<%
String paging = new Paging().paging4(totalRecord, nowPage, recordPerPage, col, word, "bbsList.jsp");
out.print(paging);

%>
<br>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>