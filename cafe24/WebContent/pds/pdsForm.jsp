<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 -->

<style>
label {text-align: left; font-size: 18px; font-weight: bold;}

</style>

<div class="container-fluid">
<h2>Upload</h2>
<%
	String id = (String)session.getAttribute("s_id");
	if (id==null){
		id = "guest";
	} else {
		id = (String)session.getAttribute("s_id");
	}
%>
<form name="photoForm" 
      method="post" 
	  enctype="multipart/form-data"
	  action="pdsIns.jsp" onsubmit="return pdsCheck(this)">
	<div class="table" style="width: 500px;">
	<label for ="wname">이름</label>	 
	<input type='text' name='wname' size='20' maxlength="100" value="<%=id%>" class="form-control" required autofocus> <br /> 
	
	<label for ="passwd">비밀번호</label>
	<input type='password' name='passwd' id="passwd" class="form-control" > <br />
	
	<label for ="subject">제목</label>
	<input type='text' name='subject' size='20' class="form-control" required autofocus> <br /> 
	
	<label for ="content">내용</label>
	<textarea rows="3" cols="10" name='content' class="form-control" ></textarea>	
	
	<label for ="filename">파일첨부</label>
	<input type="file" name="filename" class="form-control"> <br />
	
	<input type="submit" value="쓰기" class="btn btn-primary">
	<input type="reset"  value="취소" class="btn btn-outline-secondary">
    </div>
</form>

</div>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>