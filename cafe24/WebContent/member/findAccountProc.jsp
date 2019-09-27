<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 --> 
<div class="container-fluid">
<h2>Find Account</h2>
<%	
	String mname = request.getParameter("mname").trim();
	String email  =request.getParameter("email").trim();
	dto=dao.faproc(mname, email);
		
	dto.setMname(mname);
	dto.setEmail(email);
	
	if(dto==null){
	  out.print("가입하신 이메일이 없습니다.!!<br/><br/>");
	  out.print("<a href='javascript:history.back(-1);'>[다시시도]</a>");
	} else {
%>
	<table class="table">
		<tr>
			<th><%=mname%>님의 아이디</th>
			<td>
			<%
			String id = dto.getId();
			if(id != null){							
			}			
			%>
			<%=dto.getId()%>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="확인" class="btn btn-primary">
			</td>
		</tr>
	</table>
 <!-- 본문 끝 -->
 </div>
 
 <%
	}
 %>
 
<%@ include file = "../footer.jsp" %>

