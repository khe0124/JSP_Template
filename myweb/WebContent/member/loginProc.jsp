<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 bbsReplyProc.jsp-->
<%
	//1) 사용자가 입력한 정보를 변수에 담기
	String id = request.getParameter("id").trim();
	String passwd  =request.getParameter("passwd").trim();
	
	//2) 1)의 내용을 dto객체에 담기
	dto.setId(id);
	dto.setPasswd(passwd);
	String mlevel = dao.loginProc(dto);
	//3) 2)의 내용을 tb_bbs테이블에 추가하기
		
	//4) 글쓰기 성공 후 bbsList.jsp로 이동하기
	if(mlevel == null){
		out.println("<p>아이디/비밀번호를 확인해주세요!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		/* out.println(id+"<span>님 환영합니다.</span>");
		out.println(mlevel); */
		//다른 페이지에서 로그인 상태를 공유할 수 있도록
		session.setAttribute("s_id", id);
		session.setAttribute("s_passwd", passwd);
		session.setAttribute("s_mlever", mlevel);
		
		//첫페이지로 이동
		String root = Utility.getRoot();
		response.sendRedirect(root+"/index.jsp");
		
		
	}//if end	
%>


<!-- 본문 끝 --> 
<%@ include file="../footer.jsp"%>