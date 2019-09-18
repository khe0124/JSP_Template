<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>pdsTest1.jsp</title>
</head>
<body>
	<h3>파일첨부 테스트 다중</h3>
	<form method="post" action="pdsTestProc2.jsp"
		enctype="multipart/form-data">
		<!-- 파일 첨부시 필수 -->
		이름: <input type='text' name='uname' size='20'> <br /> 
		제목: <input type='text' name='title' size='20'> <br /> 
		내용: <textarea name="content" rows='5' cols="20"></textarea> <br />
		파일첨부1: <input type="file" name="filenm1"> <br /> 
		파일첨부2: <input type="file" name="filenm2"> <br /> 
		파일첨부3: <input type="file" name="filenm3"> <br /> 
		           <input type='submit' value='등록'>

	</form>

</body>
</html>