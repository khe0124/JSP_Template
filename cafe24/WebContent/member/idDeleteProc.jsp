<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 -->
<!--여기에 내용 작성-->
<%
	
	//1) 현재 로그인한 세션정보 가져오기
	String id  = (String)session.getAttribute("s_id");		
					
	//3) 2)의 내용을 member테이블에 추가하기
	int cnt=dao.updateF(id);
	
	//4) 계정삭제 후 이동하기
	if(cnt==0){
		out.println("<p>계정삭제에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("alert('계정삭제를 성공했습니다.');");
		out.println(" location.href='logout.jsp'");
		out.println(" location.href='../index.jsp'");
		out.println("</script>");
	}//if end	
%>
<%@ include file = "../footer.jsp" %>

