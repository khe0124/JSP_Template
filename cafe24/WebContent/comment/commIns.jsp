<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="net.bbs.*" %>
<%@ include file="../bbs/ssi.jsp"%>
<%@ include file="../header.jsp"%>
<jsp:useBean id="cdao" class="net.comment.CommentDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="net.comment.CommentDTO"></jsp:useBean>

<!-- 본문 시작 bbsIns.jsp-->
<%
	//1) 사용자가 입력한 정보를 변수에 담기
	String cname  =request.getParameter("cname").trim();
	String cocontent=request.getParameter("cocontent").trim();
	int cobbsno  =Integer.parseInt(request.getParameter("bbsno").trim());
	
	//2) 1)의 내용을 dto객체에 담기
	cdto.setCname(cname);
	cdto.setCocontent(cocontent);
	cdto.setCobbsno(cobbsno);
	
	//3) 2)의 내용을 tb_bbs테이블에 추가하기
	int cnt=cdao.insert(cdto);
	
	//4) 글쓰기 성공 후 bbsList.jsp로 이동하기
	if(cnt==0){
		out.println("<p>댓글 입력에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	alert('댓글이 입력되었습니다.');");
		out.println(" location.href='../bbs/bbsRead.jsp?bbsno=" + cobbsno +"';");
		out.println("</script>");
	}//if end	
%>


<!-- 본문 끝 --> 
<%@ include file="../footer.jsp"%>