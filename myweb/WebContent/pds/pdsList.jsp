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
 
.contBox {
 width: 280px;
 min-height: 285px;
 padding: 20px;
 
 margin: 8px;
 border: 1px solid #eee;
 border-radius: 3%;
 display: inline-block;
 box-shadow: 2px 2px 5px rgba(0,0,0,0.3);
}

.imgBox {
 cursor: pointer;
 text-align: left;
}

.contBox:hover {
background-color: #e8e8e8;
border: 1px solid #e8e8e8;
box-shadow: 9px 9px 8px rgba(0,0,0,0.3);
transition:all 0.5s;
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
color: #b3b3b3;
}

h4 {
font-weight: bold;
font-size: 24px;
border-bottom: 1px solid #ddd;
padding: 5px 0;
margin: 10px 0;
}

.uploadPic{
    clear: both;
    margin: 20px 0;
}

.galBtns {
float: right;
}

.galBtn {
 padding: 5px;
 border-radius: 50%;
 width: 30px;
 height: 30px;
}

.Modbtn{
color: #888;
}


</style>

<br>
<h2>Photo Gallery</h2>
<br>
<div class ="wrap" style="width:80vw; margin:auto;">
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
				<div class="contBox">
				<div class="imgBox" onclick="location.href='pdsRead.jsp?pdsno=<%=dto.getPdsno()%>';">
				<img src="../storage/<%=dto.getFilename()%>">
				<h4><%=dto.getSubject()%></h4>				
				<p class="redate"><%=dto.getRegdate().substring(0, 10)%></p>
				<span class="writer"><%=dto.getWname()%></span>					
				</div>
					<div class="galBtns">		
					  <span><a href="#" class="galBtn Modbtn btn btn-default">M</a></span> 
					  <span><a href="pdsDelete.jsp?pdsno=<%=dto.getPdsno()%>" class="galBtn Delbtn btn btn-danger">D</a></span>
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