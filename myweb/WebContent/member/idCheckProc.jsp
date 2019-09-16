<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="ssi.jsp" %>
<body>
	<div style= "text-align:center">
		<h3>아이디 중복확인 결과</h3>
	<%
	 String id = request.getParameter("id").trim();
	 dto.setId(id);
	 int cnt = dao.duplicateID(dto);
	 out.println("입력 ID: <strong>"+ id + "</strong>");
	 if (cnt == 0){
		 out.println("<p>사용가능한 아이디입니다.</p>");
		 out.println("<a href='javascript:apply(\"" + id +"\")'>[적용]</a>");
	 } else {
		 out.println("<p style='color:red'>중복된 아이디입니다.</p>");
	 }
	
	%>
	<hr>
	<a href ="javascript:history.back()">[다시검색]</a>
	<a href = "javascript:window.closd()">[창 닫기]</a>
	
	</div>

<script>
function apply(id){
	//중복확인 id를 부모창에 적용
	//부모창 opener
	opener.document.regForm.id.value = id;
	window.close();
}//apply end()

</script>
