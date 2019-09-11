<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//session 내부객체
	//- HttpSession session
	//- 요청한 사용자에게 개별적으로 접근
	out.print("세션 유지시간은");
	out.print(session.getMaxInactiveInterval());
	
	//세션 유지 시간 변경
	//1) 
	session.setMaxInactiveInterval(60*10);
	
	out.print("<hr>");
	
	//세션 변수선언
	session.setAttribute("s_id", "kim");
	session.setAttribute("s_pw", "12341234");
	
	//세션 변수값 가져오기
	Object obj = session.getAttribute("s_id");
	String s_id = (String)obj;
	String s_pw = (String)session.getAttribute("s_pw");
	
	out.println("세션변수 s_id:"+s_id+"<br>");
	out.println("세션변수 s_pw:"+s_pw+"<br>");
	
	out.print("<hr>");
	
	//세션변수 강제 삭제(로그아웃)
	session.removeAttribute("s_id");
	session.removeAttribute("s_pw");
	out.print("세션변수 강제삭제:"+session.getAttribute("s_id")+"<br>");
	out.print("세션변수 강제삭제:"+session.getAttribute("s_pw"));
	
	//세션영역에 있는 모든 값 전부 강제 삭제
	session.invalidate();
	
	//세션객체에서 발급해주는 id
	out.print("세션 임시 아이디: ");
	out.print(session.getId());
	out.print("<br>");
	
	out.print("<hr>");
	
	/* 
	application 내부객체: 서버에 대한 정보를 관리하는 객체
 	*/
 	
 	//실제경로: D:\java0514\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\myweb\bbs
 	//웹경로: http://172.16.83.17:8090/myweb/bbs
 	out.print(application.getRealPath("/bbs"));
	
	application.setAttribute("uname", "김연아");
	out.print(application.getAttribute("uname"));
	
	
	/* response 내부 객체 */
 	//페이지 이동
 	response.sendRedirect("파일명");
	
	//요청한 사용자에게 응답 메세지 전송
	//PrintWriter write = response.getWriter();
 	
%>

</body>
</html>