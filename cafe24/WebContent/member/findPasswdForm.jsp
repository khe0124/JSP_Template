<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 --> 
<div class="container-fluid">
<h2>Find Password</h2>
<%
	 String id = request.getParameter("id").trim();	 
	 dto = dao.fpproc(id);
		if (dto == null) {
		 out.println("<p>입력하신 아이디는 없는 아이디입니다.</p>");
		 out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	 } else {
		 StringBuilder newpw = new StringBuilder();
			char [] pw = {
					 'a','b','c','d','e','f','g','h',		 
					 'i','j','k','l','m','n','o','p',
					 'q','r','s','t','u','w','x','y',
					 'z','A','B','C','D','E','F','G',
					 'H','I','J','K','L','M','N','O',
					 'P','Q','R','S','T','U','W','X',
					 'Y','Z','1','2','3','4','5','6',
					 '7','8','9','!','@','#','$','%',
					 '&','*' };
			
			int size = pw.length;
			char passwd[] = new char[8];
			int leng = passwd.length;
			
			 for(int i=0; i<leng; i++){
				 int ran = (int)((Math.random()*(size))+1);
							 
				 if(ran < size){				 
					 passwd[i] = pw[ran];
					 for(int j=0; j<i; j++){
						 if(passwd[i] == passwd[j]){
							 i--;
							 break;
						 }
					 };	
				 }				  
			 };			 
			 newpw.append(String.valueOf(passwd));
		 %>		
	
	<form method="post" action="findPasswdProc.jsp"
		onsubmit="">
		<table class="table">
		<tr>
			<th><%=dto.getId()%>님의 새로운 비밀번호 발급					
				<input type="hidden" name="id" value="<%=dto.getId()%>">
				<input type="hidden" name="passwd" value="<%=newpw%>">			
				<input type="hidden" name="mname" value="<%=dto.getMname()%>">			
				<input type="hidden" name="email" value="<%=dto.getEmail()%>">	
			</th>
						
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="비밀번호발송" class="btn btn-primary">
			</td>
		</tr>
	</table>

</form>
 <!-- 본문 끝 -->
 </div>
 
<%
 }
 %>
	
 
<%@ include file = "../footer.jsp" %>

