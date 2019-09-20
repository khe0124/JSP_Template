<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="net.pds.*" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 bbsIns.jsp-->
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
		 out.println(mr.getParameter("wname"));
		 out.println("<br>");
		 out.println(mr.getParameter("subject"));
		 out.println("<br>");
		 out.println(mr.getParameter("content"));
		 out.println("<br>");
	
		 //2) 저장된 파일명, 파일크기 가져오기 
		 String item = "";		 
		 String fileName = "";
		 long filesize = 0;		 
		 File file = null;
		 
		 Enumeration files =  mr.getFileNames();
		 int i = 1;
		 while (files.hasMoreElements()){
			 item = (String)files.nextElement();			 
			 fileName = mr.getFilesystemName(item);
			if(fileName != null) { 
				file = mr.getFile(item);
				 if(file.exists()){
					 filesize = file.length();					 
					 out.println("<br>");
					 out.println("파일명: " + file.getName());
					 out.println("<br>");
					 out.println("파일크기: " + (int)filesize/1000 + "kb");
					 out.println("<br>");
					 out.println("<hr>");				 
				 }
			}
			i++; 
		 }//while end
		 
		 //3) tb_pds테이블에 행추가하기
		 String wname = mr.getParameter("wname").trim();
		 String passwd = mr.getParameter("passwd").trim();
		 String subject = mr.getParameter("subject").trim();
		 String content = mr.getParameter("content").trim();
		 		 
		 dto.setWname(wname);
		 dto.setPasswd(passwd);
		 dto.setSubject(subject);
		 dto.setContent(content);
		 dto.setFilename(fileName);
		 dto.setFilesize(filesize);
		 
		 boolean flag = dao.insert(dto);
		 if(flag == false){
		 out.println("<p>글 입력에 실패했습니다</p>");
		 out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
		 } else {
			 out.println("<script>");
			 out.println("	alert('글이 입력되었습니다.');");
			 out.println(" location.href='pdsList.jsp'");
			 out.println("</script>");
			 
		 }
		 
		 		 		 
	} catch (Exception e) {
		 out.println(e);
		 out.println("<p>이미지업로드에 실패했습니다</p>");
		 out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}
%>


<!-- 본문 끝 --> 
<%@ include file="../footer.jsp"%>