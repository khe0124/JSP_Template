<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<jsp:useBean id="cdao" class="net.comment.CommentDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="net.comment.CommentDTO"></jsp:useBean>
<!-- 본문 시작 bbsList.jsp-->

<br>
<h2>LIST</h2>
<br>
<div class = "table-div">
<table class="table">
	<tr id="t1">			
		<th>No.</th>
		<th>작성자</th>
		<th>제목</th>
		<th>등록일</th>
		<th>조회수</th>
		<th>수정/삭제</th>
	</tr>
	<%	
		//전체목록
		ArrayList<BbsDTO> list = dao.list();
		if(list == null){
			out.println("<tr>");
			out.println("	<td colspan='6'>결과를 찾을 수 없습니다.</td>");
			out.println("</tr>");
			out.println("<tr>");
			out.println("<td colspan = '6'>");
			out.println("<a href='bbsForm.jsp' class='btn btn-default'>글쓰기</a>");
			out.println("</td>");
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
			<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno()%>"><%=dto.getSubject()%>
			<%
			int cobbsno = dto.getBbsno();
			int corecord = cdao.countco(cobbsno);
			//글의 댓글 갯수
			out.print("<span style='color:#8ebae0; font-weight:bold;'>");			
			out.print("("+corecord+")");			
			out.print("</span>");
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
		<%		
		if ((String)session.getAttribute("s_id") == null){
			out.println("<td></td>");
		} else {
			%>	
		<td><a href="bbsUpdate.jsp?bbsno=<%=dto.getBbsno()%>" class="modify btn btn-default">수정</a> 
		    <a href="bbsDelete.jsp?bbsno=<%=dto.getBbsno()%>" class="delete btn btn-danger">삭제</a>
		</td>
			<%
				}		
			%>	
	</tr>	
	<%
		}//for end	
	%>
		<!-- 검색시작 -->
		<tr>	
		  <td colspan="6" style="text-align:right;">
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

<br>
</div>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>