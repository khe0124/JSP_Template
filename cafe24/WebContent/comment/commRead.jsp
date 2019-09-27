<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="net.comment.CommentDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="net.comment.CommentDTO"></jsp:useBean>
<%-- 
	<%-- int conum = Integer.parseInt(request.getParameter("conum"));
	cdto = cdao.read(conum);
	if (cdto == null) {
		out.print("해당 정보 없음");
	} else {

	<tr>
		<td><%=cdto.getCname()%></td>
		<td colspan='3'><%=cdto.getCocontent()%></td>
	</tr>
	}//if end --%>
%> --%>