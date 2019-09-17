<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp"%>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 -->
<!--여기에 내용 작성-->
<%
	//1) 사용자가 입력한 정보를 변수에 담기
	String id = (String)session.getAttribute("s_id");	
	String passwd  =request.getParameter("passwd").trim();
	String email  =request.getParameter("email").trim();
	String tel  =request.getParameter("tel").trim();
	String zipcode  =request.getParameter("zipcode").trim();
	String address1  =request.getParameter("address1").trim();
	String address2  =request.getParameter("address2").trim();
	String job  =request.getParameter("job");	
	
	//2) 1)의 내용을 dto객체에 담기
		dto.setPasswd(passwd);
		dto.setEmail(email);
		dto.setTel(tel);
		dto.setZipcode(zipcode);
		dto.setAddress1(address1);
		dto.setAddress2(address2);
		dto.setJob(job);
		dto.setId(id);
	//3) 2)의 내용을 tb_bbs테이블에 추가하기
	int cnt= dao.updateInfo(dto);
	
	//4) 글쓰기 성공 후 bbsList.jsp로 이동하기
	if(cnt==0){
		out.println("<p>정보 수정에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("alert('정보 수정이 성공했습니다.');");
		out.println(" location.href='./myInfo.jsp?id="+id+"';");
		out.println("</script>");
	}//if end	
%>
<%@ include file = "../footer.jsp" %>

