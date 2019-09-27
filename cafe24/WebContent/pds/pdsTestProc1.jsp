<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>pdsTest1.jsp</title>
</head>
<body>
	<h3>파일첨부 테스트 결과</h3>
	<%
	/*
	request.setCharacterEncoding("UTF-8");
	out.print(request.getParameter("uname"));
	out.println("<br>");
	out.print(request.getParameter("subject"));
	out.println("<br>");
	out.print(request.getParameter("title"));
	out.println("<br>");
	out.print(request.getParameter("filenm"));
	out.println("<br>");
	
	//-------------------------------------------------
	//- form에 enctype 속상이 추가되면 request 객체가 가지고 있는 값을 제대로 가져올 수 없다.
	//- request.getParameter()는 null이 반환된다.
	 */
	 try {
		 //실제 물리적 경로
		 String saveDirectory = application.getRealPath("/storage/");
		 //저장 최대 용량
		 int maxPostSize = 1024*1024*10;
		 //한글 조합
		 String encoding = "UTF-8";
		 
		 MultipartRequest mr = new MultipartRequest(request
				                                    ,saveDirectory
				                                    ,maxPostSize
				                                    ,encoding
				                                    ,new DefaultFileRenamePolicy());
		 out.println("<p>파일전송이 성공했습니다</p>");
		 
		 //1) mr참조변수가 가리키고 있는 텍스트 정보 가져오기
		 out.println(mr.getParameter("uname"));
		 out.println("<br>");
		 out.println(mr.getParameter("title"));
		 out.println("<br>");
		 out.println(mr.getParameter("content"));
		 out.println("<br>");

		 //2) storage폴더에 저장된 파일 정보 확인하기
		 Enumeration files =  mr.getFileNames();
		 
		 //3) 2)의 files가 가지고 있는 값에서 개별 접근
		 //
		 String item = (String)files.nextElement();
		 out.println(item);
		 out.println("<hr>");
		 
		 //4) 3)에서 item이름으로 전송된 실제 파일을 mr객체에서 가져오기
		 String ofileName = mr.getOriginalFileName(item);
		 String fileName = mr.getFilesystemName(item);
		 out.println("원본 파일명: " + ofileName);
		 out.println("<br>");
		 out.println("리네임 파일명: " + fileName);
		 out.println("<br>");
		 out.println("<hr>");
		 
		 //5) 저장된 파일의 기타 세부 정보 확인하기
		 File file = mr.getFile(item);
		 if(file.exists()){
			 out.print("파일명: " + file.getName());
			 out.println("<br>");
			 out.print("파일크기: " + (file.length()/1024)+".kb");
			 out.println("<br>");
			 
		 } else {
			 out.print("해당 파일이 없습니다.");
			 out.println("<br>");
		 }
		 
		 //6) 파일 다운로드
		 //(단, 웹브라우저에서 해석되는 페이지는 제외)
		 // .html .jsp .asp .php
		 // .png .jpg .gif .avi .mp3 등
		 out.print("첨부파일");
		 out.print("<br>");
		 out.print("<a href = '../storage/'" + file.getName() + ">");
		 out.print(file.getName());
		 out.print("</a>");
		 
		 
	 } catch (Exception e) {
		 out.println("<p>파일업로드에 실패했습니다</p>");
		 out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	 }
	
	 
	
	
	%>
</body>
</html>