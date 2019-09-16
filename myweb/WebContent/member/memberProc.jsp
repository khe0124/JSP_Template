<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<body>
	<div style= "text-align:center">
		<h3>회원가입</h3>
	<%
	 //1) 사용자가 입력 요청한 정보 가져오기
	 //2) 1)의 내용을 dto객체에 담기
	 //3) tel ,email ,zipcode ,address1 ,address2 ,job
	 
	String id  =request.getParameter("id").trim();
	String passwd =request.getParameter("passwd").trim();
	String mname =request.getParameter("mname").trim();
	String tel =request.getParameter("tel").trim();
	String email =request.getParameter("email").trim();
	String zipcode =request.getParameter("zipcode").trim();
	String address1 =request.getParameter("address1").trim();
	String address2 =request.getParameter("address2").trim();
	String job =request.getParameter("job").trim();
	
	
	//2) 1)의 내용을 dto객체에 담기
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setTel(tel);
	dto.setEmail(email);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);
	
	//3) 2)의 내용을 tb_bbs테이블에 추가하기
	int cnt=dao.insertMem(dto);
	
	//4) 글쓰기 성공 후 bbsList.jsp로 이동하기
	if(cnt==0){
		out.println("<p>회원가입에 실패했습니다</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");
	}else{
		out.println("<script>");
		out.println("	alert('회원가입을 환영합니다.');");
		out.println("	location.href='../index.jsp';"); //목록페이지 이동
		out.println("</script>");
	}//if end	
	 
	%>
		
	
	</div>

<!-- 본문 끝 -->			
<%@ include file="../footer.jsp"%>