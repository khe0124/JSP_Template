<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>웹페이지의 SCOPE(유효범위)</h1>
	<%
	 /* 프로젝트에서 페이지들간에 값을 공유하기 위해 사용  
	   - scope의 종류
	   1. page        : 현재 페이지에서만 유효, 생략가능
	   2. request     : 서로 연결되어 있는 페이지에서만 유효 (부모페이지와 자식페이지에서만 유효)
	   3. session     : 모든 페이지에서 유효(사용자개별접근, 시간) -- 로그인 정보를 여기에
	   4. application : 모든 페이지에서 유효(모든 사용자접근, 서버정보를 담고 있음)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
	   
	 - 웹페이지의 내장변수 별도의 자료형이 없다 
	 1) pageContext.setAttribut("변수명",값)
	 2) request.setAttribute("변수명",값)
	 3) session.setAttribute("변수명",값)
	 4) application.setAttribute("변수명",값)
	 
	 - scope의 변수값 받아오기
	 1) pageContext.getAttribute("변수명")
	 2) request.getAttribute("변수명")
	 3) session.getAttribute("변수명")
	 4) application.getAttribute("변수명")	 
	 
	 */ 
	 
	 // - 각 scope에 내장변수를 이용해서 값 올리기
		pageContext.setAttribute("kor",100);
	 	request.setAttribute("eng",200);
	 	session.setAttribute("mat",300);
	 	application.setAttribute("uname","kim");
	 	
	 // - scope영역의 값 가져오기
	 	Object obj = pageContext.getAttribute("kor");
	 	int kor = (int)(obj);
	 	int eng = (int)request.getAttribute("eng");
	 	int mat = (int)session.getAttribute("mat");
	 	String uname = (String)application.getAttribute("uname");
	 
	 // - 출력
	 	out.println(" 1) pageContext:"+kor+"<br>");
	 	out.println(" 2) request:"+eng+"<br>");
	 	out.println(" 3) session:"+mat+"<br>");
	 	out.println(" 4) application:"+uname+"<br>");
	 // -------------------------------------------------------------------------
	/*  // - 각 scope에 변수를 삭제
	 /* 	
	    pageContext.removeAttribute("kor");
	 	request.removeAttribute ("eng");
	 	session.removeAttribute("mat");
	 	application.removeAttribute("uname"); 
	 	
	 // - 출력
	 	out.println(" 1) pageContext:"+pageContext.getAttribute("kor")+"<br>");
	 	out.println(" 2) request:"+request.getAttribute("eng")+"<br>");
	 	out.println(" 3) session:"+session.getAttribute("mat")+"<br>");
	 	out.println(" 4) application:"+application.getAttribute("uname")+"<br>");
	 
	 //request.getAttribute()
	 	request.setAttribute("aver",85);
	 	out.println(request.getAttribute("aver"));
	 //request.getParameter()
	 out.print(request.getParameter("aver")); 
	 */
	 %>
	 
	 <%
	 //-----------------------------------------------------------------------------
	 // 페이지 이동
	 // 1) <a href=""></a>
	 // 2) action =""
	 // 3) location.href=""
	 // 4) <jsp:forward page=""></jsp:forward>
	 // 5) response.sendRedirect("")
	 
	 %>
	<%--  <!-- 1) link 
	 request가 null
	 -->
	 <a href="scopeResult.jsp">[SCOPE 결과 페이지로 이동]</a>
	 
	 <!-- 2) action 
	 request가 null
	 -->
	 <form action="scopeResult.jsp">
	 	<button>[SCOPE 결과 페이지로 이동]</button>
	 </form>
	 
	 <!-- 3) location.href="" JS로 넘기기  
	 request가 null-->
	 <script>
	 	alert("이동");
	 	location.href="scopeResult.jsp";
	 </script>
	 	 
	 <!-- 4) jsp:forward
	 request가 값이 제대로 넘어감-->
	 <jsp:forward page="scopeResult.jsp"></jsp:forward> 
	 
	 //5) 
	 response.sendRedirect("scopeResult.jsp");	 
	 
	 --%> 
	 
	 <%
	 //6) RequestDispatcher 이용 
	 //request 값이 살아있다.
	 String view = "scopeResult.jsp";
	 RequestDispatcher rd = request.getRequestDispatcher(view);
	 rd.forward(request, response);
	 
	 %>
	 
	 
</body>
</html>