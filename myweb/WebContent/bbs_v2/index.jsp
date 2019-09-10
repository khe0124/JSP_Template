<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file = "../header.jsp" %>

<!-- 본문 시작 -->
<!--여기에 내용 작성-->
<!-- First Container -->
<div class="container-fluid bg-1 text-center">
  <h3 class="margin Sedgwick">Who Am I?</h3>
  <img src="../img/square.png" class="img-responsive profile" style="display:inline" alt="SquarePants" width="350" height="350">
  <h4 class="Sedgwick">"I'm ready, I'm ready, I'm ready..."</h4>
</div>

<!-- Container 시작-->
<div class="container-fluid bg-2 text-center">
        <h3>Who Are We?</h3><br>
        <div class="row">
          <div class="col-sm-4">
            <div class="imgBox">
                <img src="../img/spongebob.png" class="img-responsive character" id="spongebob" alt="Image">
            </div>
            <input type="button" class="Sedgwick" onclick="change1()" value="Spongebob">
          </div>
          <div class="col-sm-4"> 
              <div class="imgBox">
                  <img src="../img/squidward.png" class="img-responsive character" id="squidward" alt="Image">
              </div>
              <input type="button" class="Sedgwick" onclick="change2()" value="Squidward">    
          </div>
          <div class="col-sm-4">
              <div class="imgBox">
                  <img src="../img/patrick.png" class="img-responsive character" id="patrick" alt="Image">
              </div>
              <input type="button" class="Sedgwick" onclick="change3()" value="Patrick">
            </div>
          </div>
        </div>
  </div>

<div class="container-fluid bg-3 text-center">
	<div class ="row">
		<div class="col-sm-12">
			<div id="background-video" class="background-video">
          <iframe width="100%" height="720" src="https://www.youtube.com/embed/PI4T5EcJ1U4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>    		
  			</div>
		</div>
	</div>
</div>

<!-- Container 끝-->
 
 <!-- 본문 끝 -->
 
 <script>

var flag = true;
 function change1() {
    if(flag){
      document.getElementById("spongebob").src="../img/spongebob2.png";
      flag = false;
    } else {
      document.getElementById("spongebob").src="../img/spongebob.png";
      flag = true;
    }
   
 }

 function change2() {
  if(flag){
   document.getElementById("squidward").src="../img/squidward2.png";
   flag = false;
    } else {
      document.getElementById("squidward").src="../img/squidward.png";
      flag = true;
    }
 }

 function change3() {
  if(flag){
   document.getElementById("patrick").src="../img/patrick2.png";
   flag = false;
    } else {
      document.getElementById("patrick").src="../img/patrick.png";
      flag = true;
    }
 }
</script>
 

<%@ include file = "../footer.jsp" %>

