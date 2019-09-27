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
	<h3>파일첨부 테스트 결과 다중</h3>
	<%
	
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

		 //파일 업로드 (다중) 
		 String item = "";
		 String ofileName = "";
		 String fileName = "";
		 
		 File file = null;
		 
		 Enumeration files =  mr.getFileNames();
		 int i = 1;
		 while (files.hasMoreElements()){
			 item = (String)files.nextElement();
			 ofileName = mr.getOriginalFileName(item);
			 fileName = mr.getFilesystemName(item);
			if(fileName != null) { 
				file = mr.getFile(item);
				 if(file.exists()){
					 long filesize = file.length();
					 out.println(i + "원본 파일명: " + ofileName);
					 out.println("<br>");
					 out.println(i + "파일명: " + file.getName());
					 out.println("<br>");
					 out.println(i + "파일크기: " + filesize);
					 out.println("<br>");
					 out.println("<hr>");				 
				 }
			}
			i++; 
		 }
		 		 		 
	 } catch (Exception e) {
		 out.println("<p>파일업로드에 실패했습니다</p>");
		 out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	 }
	
	 
	
	
	%>
</body>
</html>