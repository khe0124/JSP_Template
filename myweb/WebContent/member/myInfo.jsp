<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 -->
<div class="container-fluid">
<h2>My Information</h2>

<%
	String id = (String)session.getAttribute("s_id");
	dto = dao.myInfo(id);
	if (dto == null) {
		out.print("해당 정보 없음");
	} else {

%>
<div class = "table-div">
<table class="table" style="width: 30vw;">
	<tr>
		<th colspan="4" class ="readTitle"><%=dto.getMname()%>님의 정보</th>
	</tr>
	<tr>
		<th>아이디</th>
		<td><%=dto.getId()%></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=dto.getMname()%></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=dto.getEmail()%></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=dto.getTel()%></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><%=dto.getZipcode()%></td>		
	</tr>
	<tr>
		<th>주소</th>		
		<td><%=dto.getAddress1()%></td>		
	</tr>
	<tr>
		<th>주소상세</th>		
		<td><%=dto.getAddress2()%></td>
	</tr>
	<tr>
		<th>직업</th>
		<td>
		<%
		String job = dto.getJob();
		switch (job){
		  case "A01": out.print("회사원"); break;
		  case "A02": out.print("전산관련직"); break;
		  case "A03": out.print("학생"); break;
		  case "A04": out.print("주부"); break;			  
		  case "A05": out.print("기타"); break;			  
		}		
		%>		
		</td>
	</tr>
	<tr>
		<th>회원등급</th>
		<td><%
		String level = dto.getMlevel();
		switch (level){
		  case "A1": out.print("VIP"); break;
		  case "B1": out.print("GOLD"); break;
		  case "C1": out.print("SILVER"); break;
		  case "D1": out.print("NEWBIE"); break;			  
		}		
		%></td>
	</tr>
	<tr>
	<td colspan ="2" style="text-align: right;">	
		<a href="idUpdate.jsp?id=<%=(String)session.getAttribute("s_id")%>" class="modify btn btn-default">수정</a> 
		<a href="idDelete.jsp?id=<%=(String)session.getAttribute("s_id")%>" class="delete btn btn-danger">삭제</a>					
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