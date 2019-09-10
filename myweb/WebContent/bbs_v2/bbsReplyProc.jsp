<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.bbs.*" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 bbsReplyProc.jsp-->
<%
	//1) 사용자가 입력한 정보를 변수에 담기
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	String wname  =request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String passwd =request.getParameter("passwd").trim();
	String ip     =request.getRemoteAddr();//요청pc의 ip
	
	//2) 1)의 내용을 dto객체에 담기
	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);
	
	//3) 2)의 내용을 tb_bbs테이블에 추가하기
	int cnt=dao.reply(dto);
	
	//4) 글쓰기 성공 후 bbsList.jsp로 이동하기
	if(cnt==0){
		out.println("<p>글 입력에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	alert('글이 입력되었습니다.');");
		out.println("	location.href='bbsList.jsp';"); //목록페이지 이동
		out.println("</script>");
	}//if end	
%>


<!-- 본문 끝 --> 
<%@ include file="../footer.jsp"%>