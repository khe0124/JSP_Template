<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="m_ssi.jsp"%>
<%@ include file="../header.jsp"%>

<style>
th, td {text-align: left;}
.form-control {width: 80%; display: inline-block;}
</style>

<!-- 본문 시작 -->
<div class="container-fluid">
<h2>UPDATE</h2>
<%
	String id = (String)session.getAttribute("s_id");
	dto = dao.myInfo(id);
	if (dto == null) {
		out.print("해당 정보 없음");
	} else {

%>
<div class = "table-div">
<form method="post" action="idUpdateProc.jsp"
	onsubmit="return memberCheck(this)">
<table class="table" style="width: 40vw;">
	<tr>
		<th colspan="4" class ="readTitle"><%=dto.getMname()%>님의 정보</th>
	</tr>
	<tr>
		<th>아이디</th>
		<td><%=dto.getId()%></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<input type="password" name="passwd" id="passwd" size="15" class="form-control" value="<%=dto.getPasswd()%>" required>
		</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=dto.getMname()%></td>
	</tr>
	<tr>
		<th>이메일</th>		
		<td>
			<input type="text" name="email" id="email" size="30" class="form-control" value="<%=dto.getEmail()%>" readonly>
	      	<input type="button" value="Email 중복확인" class="btn btn-default" onclick="emailCheck()">
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>
		<input type="text" name="tel" id="tel" class="form-control" size="15" value="<%=dto.getTel()%>">
		</td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td>
			<input type="text" name="zipcode" id="zipcode" class="form-control" size="7" value="<%=dto.getZipcode()%>" readonly>
      		<input type="button" id ="findAddr" value="주소찾기"  class="btn btn-default" onclick="DaumPostcode()">
      		<!-- ----- DAUM 우편번호 API 시작 ----- -->
	<!-- My Info Modal -->
	<div class="modal fade" id="findAddr_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	        <h4 class="modal-title" id="myModalLabel">Address</h4>
	      </div>
	      <div class="modal-body" id="modal-body">	      
	        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
			<script>
				$("#findAddr").on("click", function() {
					$("#findAddr_modal").modal();
				});
			
			    // 우편번호 찾기 화면을 넣을 element
			    var element_wrap = document.getElementById('modal-body');
			
			    function foldDaumPostcode() {
			        // iframe을 넣은 element를 안보이게 한다.
			        element_wrap.style.display = 'none';
			    }
			
			    function DaumPostcode() {
			        // 현재 scroll 위치를 저장해놓는다.
			        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var fullAddr = data.address; // 최종 주소 변수
			                var extraAddr = ''; // 조합형 주소 변수
			
			                // 기본 주소가 도로명 타입일때 조합한다.
			                if(data.addressType === 'R'){
			                    //법정동명이 있을 경우 추가한다.
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있을 경우 추가한다.
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
			                document.getElementById('address1').value = fullAddr;
			
			                // iframe을 넣은 element를 안보이게 한다.
			                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
			                element_wrap.style.display = 'none';
			                document.getElementById('modal-body').innerHTML = "<p>주소등록 완료! 창을 닫아주세요.</p>";
			                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
			                document.body.scrollTop = currentScroll;
			                
			                $('#address2').focus();
			            },
			            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
			            onresize : function(size) {
			                element_wrap.style.height = size.height+'px';
			            },
			            width : '100%',
			            height : '100%'
			        }).embed(element_wrap);
			
			        // iframe을 넣은 element를 보이게 한다.
			        element_wrap.style.display = 'block';
			    }
			</script>
			<!-- ----- DAUM 우편번호 API 종료----- -->	
	      </div>
	      <div class="modal-footer">       
	        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>


		</td>		
	</tr>
	<tr>
		<th>주소</th>		
		<td><input type="text" name="address1" id="address1" class="form-control" size="45" value="<%=dto.getAddress1()%>" readonly></td>		
	</tr>
	<tr>
		<th>주소상세</th>		
		<td><input type="text" name="address2" id="address2" class="form-control" size="45" value="<%=dto.getAddress2()%>"></td>
	</tr>
	<tr>
		<th>직업</th>		
		<td>
			<% String sjob = dto.getJob(); %>
			 <select name="job" class="form-control">
				<option value="0" <%if(sjob.equals("0")){out.print("selected");} %>>선택하세요.</option>
			  	<option value="A01" <%if(sjob.equals("A01")){out.print("selected");} %>>회사원</option>
			  	<option value="A02" <%if(sjob.equals("A02")){out.print("selected");} %>>전산관련직</option>
			  	<option value="A03" <%if(sjob.equals("A03")){out.print("selected");} %>>학생</option>
			  	<option value="A04" <%if(sjob.equals("A04")){out.print("selected");} %>>주부</option>
			  	<option value="A05" <%if(sjob.equals("A05")){out.print("selected");} %>>기타</option>
			 </select>
		</td>
	</tr>
	<tr>
		<th>회원등급</th>
		<td><%
		String level = dto.getMlevel();
		switch (level){
		  case "A1": out.print("VIP"); break;
		  case "B1": out.print("GOLD"); break;
		  case "C1": out.print("SILVER"); break;
		  case "D1": out.print("NEWBIE"); break;			  
		}		
		%></td>
	</tr>
	<tr>
	<td colspan ="2" style="text-align: right;">	
		<input type="submit" value="수정" class="submit btn btn-default"> 
		<input type="reset"	value="취소" class="reset btn btn-primary">					
	</td>
	</tr>
			
</table>
</form>

<%
	}//if end
%>

</div>
</div>
<%@ include file="../footer.jsp"%>

