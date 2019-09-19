<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문 시작 pdsList.jsp-->

<style>
.table-div {
 column-width: 280px;
 column-gap : 10px;
 }

.imgBox {
 width: 280px;
 min-height: 285px;
 padding: 10px;
 margin: 8px;
 border: 1px solid #eee;
 border-radius: 3%;
 display: inline-block;
 box-shadow: 2px 2px 5px rgba(0,0,0,0.3);
}

img {
border-radius: 3%;
width: 100%;
}

.writer {
font-size: 18px;
}

.redate {
font-size: 12px;
}

h4 {
font-weight: bold;
 font-size: 24px; 
}

.uploadPic{
    clear: both;
    margin: 20px 0;
}


</style>

<br>
<h2>Photo Gallery</h2>
<br>
<div class ="wrap" style="width:1200px; margin:auto;">
<div class = "table-div" >
	<ul>	
		<%	
			//한 페이지 당 출력할 글의 줄수
				
			//전체목록
			ArrayList<pdsDTO> list = dao.list();
			if (list == null) {
				out.println("<tr>");
				out.println("	<td colspan='6'>결과를 찾을 수 없습니다.</td>");
				out.println("</tr>");
			} else {
				
				//오늘 날짜를 "2019-09-05" 문자열
				String today = Utility.getDate();
				
				for (int idx = 0; idx < list.size(); idx++) {
					dto = list.get(idx);
				
		%>
	
			<li style="float:left;">
				<div class="imgBox">								
				<img src="../storage/<%=dto.getFilename()%>">
				<h4><%=dto.getSubject()%></h4>
				<%-- <span><%=dto.getPdsno()%></span> --%>
				<p class="writer"><%=dto.getWname()%></p>										
				<%-- <p><%=dto.getReadcnt()%></p> --%>
				<p class="redate"><%=dto.getRegdate().substring(0, 10)%></p>
				<div>		
				<span><a href="#" class="delete btn btn-default">수정</a></span> 
				<span><a	href="#" class="delete btn btn-danger">삭제</a></span>
				</div>
				</div>
			</li>  
		
		<% } 
		
		}%>	
		</ul>
		</div>
		<div class="uploadPic">						
			<p>
				<a href="pdsForm.jsp" class="btn btn-default">사진 올리기</a>
			</p>			
		</div>
			
</div>
		

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>