<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 -->
<!--여기에 내용 작성-->
<!-- First Container -->
<%		
	String passwd = request.getParameter("passwd").trim();
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));	
	
	dto.setPasswd(passwd);
	dto.setBbsno(bbsno);
		
	int cnt = dao.delete(dto);
	
	if(cnt == 0){
		out.println("<p>글 삭제가 실패했습니다.</p>");
		out.println("<p><a href='javascript:history.back()'>다시시도</a></p>");
	}else {
		out.println("<script>");
		out.println("alert('글이 삭제되었습니다.');");
		out.println(" location.href='bbsList.jsp?col="+col+"&word="+word+"';");
		out.println("</script>");
	}
%>
<!-- Container 끝-->
 
 <!-- 본문 끝 -->
 
 
<%@ include file = "../footer.jsp" %>

