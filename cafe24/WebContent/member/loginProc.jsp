<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp" %>
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
		
		
		
		//쿠키 아이디 저장
		String c_id = Utility.checkNull(request.getParameter("c_id"));
		Cookie cookie = null;
		if(c_id.equals("SAVE")){
			//아이디저장 체크를 했다면
			cookie = new Cookie("c_id", id);
			
			//쿠키의 생존기간 1개월
			cookie.setMaxAge(60*60*24*30);
			
		} else {
			cookie = new Cookie("c_id", "");
			cookie.setMaxAge(0);
		}
		
		//요청한 사용자 PC에 쿠키값을 저장
		response.addCookie(cookie);
		
		
		//첫페이지로 이동
		String root = Utility.getRoot();
		response.sendRedirect(root+"/index.jsp");
		
		
	}//if end	
%>


<!-- 본문 끝 --> 
<%@ include file="../footer.jsp"%>