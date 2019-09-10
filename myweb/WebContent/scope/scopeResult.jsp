<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
//- 출력
	 	out.println(" 1) pageContext:"+pageContext.getAttribute("kor")+"<br>");
	 	out.println(" 2) request:"+request.getAttribute("eng")+"<br>");
	 	out.println(" 3) session:"+session.getAttribute("mat")+"<br>");
	 	out.println(" 4) application:"+application.getAttribute("uname")+"<br>");

%>

</body>
</html>