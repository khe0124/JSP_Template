<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="ssi.jsp" %>

<body>
	<div style= "text-align:center">
		<h3>이메일 중복확인 결과</h3>
	<%
	 String email = request.getParameter("email").trim();
	 dto.setEmail(email);
	 int cnt = dao.duplicateEmail(dto);
	 out.println("입력 EMAIL: <strong>"+ email + "</strong>");
	 if (cnt == 0){
		 if(email.indexOf("@") != -1){
			 out.println("<p>@가 없습니다.</p>");
		 } else{
		 out.println("<p>사용된 적 없는 이메일입니다.</p>");
		 out.println("<a href='javascript:apply(\"" + email +"\")'>[적용]</a>");
		 }
	 } else {
		 out.println("<p style='color:red'>이미 가입된 이메일입니다.</p>");
	 }
	
	%>
	<hr>
	<a href ="javascript:history.back()">[다시검색]</a>
	<a href = "javascript:window.closd()">[창 닫기]</a>
	
	</div>
	<script>
	function apply(email){
		//중복확인 id를 부모창에 적용
		//부모창 opener
		opener.document.regForm.email.value = email;
		window.close();
	}//apply end()
	
	</script>
