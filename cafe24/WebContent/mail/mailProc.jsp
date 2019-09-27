<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="net.utility.Utility"%>
<%@page import="net.utility.MyAuthenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 mailProc.jsp -->
<br><h2>MAIL RESULT</h2><br>

<%
	//1) 메일서버(POP3/SMTP) 지정하기
	String mailServer="mw-002.cafe24.com";
	Properties props=new Properties();
	props.put("mail.smtp.host", mailServer);
	props.put("mail.smtp.auth", "true"); //메일검증확인하는 것

	//2) 1)메일서버에서 인증받은 계정/비번 가져오기
	Authenticator myAuth=new MyAuthenticator();
	
	//3) 1)과 2)가 유효한지 검증
	//sess로 인증받은것이기 때문에 sess변수로 움직인다. 
	Session sess=Session.getInstance(props, myAuth);
	//out.print("메일 서버 인증성공!");
	
	//4) 메일보내기 
	try{
		request.setCharacterEncoding("UTF-8");
		String to     =request.getParameter("to").trim();
		String from   =request.getParameter("from").trim();
		String subject=request.getParameter("subject").trim();
		String content=request.getParameter("content").trim();
		
		//엔터 및 특수문자 변경
		content=Utility.convertChar(content);
		
		//이미지 보여주기
				
		//테이블작성
		content += "<h1>확인</h1>";		
		content += "<p><span style='color:red;'>헤헤 호호호</span></p>";
						
		//메일관련 메세지 작성
		Message msg=new MimeMessage(sess);
		
		//받는 사람
		InternetAddress[] address={
				new InternetAddress(to)
		};
		
		/* 수신인이 여러명이라면
		InternetAddress[] address={
				new InternetAddress(to1),
				new InternetAddress(to2),
				new InternetAddress(to3)
		};
		*/
		
		msg.setRecipients(Message.RecipientType.TO, address);
		
		//보내는 사람
		msg.setFrom(new InternetAddress(from));
		
		//메일 제목
		msg.setSubject(subject);
		
		//메일 내용
		msg.setContent(content,"text/html; charset=UTF-8");
		
		//보낸 날짜
		msg.setSentDate(new Date());
		
		//메일 전송
		Transport.send(msg);
		out.print(to+"님에게 메일이 발송되었습니다");
		
	}catch(Exception e){
		out.println("<p>메일전송실패!"+e+"</p>");
		out.println("<p><a href='javascript:history.back();'>[다시시도]</p>");
	}//try end


%>
<!-- 본문 끝 --> 
<%@ include file="../footer.jsp"%>