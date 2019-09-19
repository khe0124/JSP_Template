/*myscript.js*/


function bbsCheck(f) {
	// 게시판 유효성 검사
	// 1) 작성자 2글자 이상 입력
	var wname = f.wname.value;
	wname = wname.trim();
	if (wname.length < 2) {
		alert("작성자 2글자 이상 입력해주세요");
		f.wname.focus();
		return false;
	}
	// if end

	// 2) 제목 2글자 이상 입력
	var subject = f.subject.value;
	subject = subject.trim();
	if (subject.length < 2) {
		alert("제목 2글자 이상 입력해주세요");
		f.subject.focus();
		return false;
	}// if end

	// 3) 내용 2글자 이상 입력
	var content = f.content.value;
	content = content.trim();
	if (content.length < 2) {
		alert("내용 2글자 이상 입력해주세요");
		f.content.focus();
		return false;
	}// if end
	// 4) 비밀번호 4글자 이상 입력
	var passwd = f.passwd.value;
	passwd = passwd.trim();
	if (passwd.length < 4) {
		alert("비밀번호 4글자 이상 입력해주세요");
		f.passwd.focus();
		return false;
	}// if end
	return true;
	// onsubmit이벤트에서 서버로 전송
}// bbsCheck() end

function pwCheck(f) {
	var passwd = f.passwd.value;
	passwd = passwd.trim();
	// 비밀번호가 4글자 이상 입력되었는지 검사
	if (passwd.length < 4) {
		alert("비밀번호는 4글자 이상입니다.");
		f.passwd.focus();
		return false;
	}

	var message = "정말 삭제하시겠어요?";
	if (confirm(message)) {
		return true;
	} else {
		return false;
	}
}

function pwCheckUp(f) {
	var passwd = f.passwd.value;
	passwd = passwd.trim();
	// 비밀번호가 4글자 이상 입력되었는지 검사
	if (passwd.length < 4) {
		alert("비밀번호는 4글자 이상입니다.");
		f.passwd.focus();
		return false;
	}
}

function searchCheck(f) {
	var word = f.word.value;
	word = word.trim();
	if (word.length == 0) {
		alert("검색어를 입력하세요.");
		return false;
	}
	return true;
}

/* login */
function loginCheck(f) {
	// 로그인 유효성 검사
	// 1) 아이디 5~10글자 이내
	var id = f.id.value;
	if (id.length < 4) {
		alert("아이디는 5글자 이상입니다.");
		f.id.focus();
		return false;
	} else if (id.length > 10) {
		alert("아이디는 10글자 이내입니다.")
		f.id.focus(0);
		return false;
	}

	// 2) 비밀번호 5~10글자 이내
	var passwd = f.passwd.value;
	if (passwd.length < 4) {
		alert("비밀번호는 5글자 이상입니다.");
		f.passwd.focus();
		return false;
	} else if (passwd.length > 10) {
		alert("비밀번호는 10글자 이내입니다.")
		f.passwd.focus(0);
		return false;
	}
	return true;
}// loginCheck() end

/* ID 체크 */
function idCheck(f) {

	window.open("idCheckForm.jsp", "idwin", "width=400, height=350");

	return true;
}

function emailCheck(f) {

	window.open("emailCheckForm.jsp", "idwin", "width=400, height=350");

	return true;
}

function memberCheck(f) {
	// 1) 아이디 유효성 검사
	var id = f.id.value;
	if (id.length < 4) {
		alert("아이디는 5글자 이상입니다.");
		f.id.focus();
		return false;
	} else if (id.length > 10) {
		alert("아이디는 10글자 이내입니다.")
		f.id.focus(0);
		return false;
	}// if end

	// 2) 비밀번호 유효성 검사
	var passwd = f.passwd.value;
	if (passwd.length < 4) {
		alert("비밀번호는 5글자 이상입니다.");
		f.passwd.focus();
		return false;
	} else if (passwd.length > 10) {
		alert("비밀번호는 10글자 이내입니다.")
		f.passwd.focus();
		return false;
	}

	// 3) 비밀번호 일치 여부 검사
	var repasswd = f.repasswd.value;
	repasswd = repasswd.trim();
	if (repasswd != passwd) {
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}

	// 4) 이름 2~20글자 사이인지.
	var mname = f.mname.value;
	mname = mname.trim();
	if (mname.length < 2) {
		alert("작성자 2글자 이상 입력해주세요");
		f.mname.focus();
		return false;
	} else if (mname.length > 20) {
		alert("작성자는 20글자 이내입니다.");
		f.mname.focus();
		return false;
	}

	// 5) 이메일에 @문자가 있는지
	var email = f.email.value;
	email = email.trim();
	if (email.indexOf('@') == -1) {
		alert("유효하지 않은 이메일 주소입니다.");
		return false;
	}

	// 6) 직업을 선택했는지?
	var job = f.job.value;
	if (job == "0") {
		alert("직업을 선택하세요.");
		return false;
	}
	return true;
}


//계정삭제
function pwCheckUpDelete(f) {
	var passwd = f.passwd.value;
	passwd = passwd.trim();
	// 비밀번호가 4글자 이상 입력되었는지 검사
	if (passwd.length < 4) {
		alert("비밀번호는 4글자 이상입니다.");
		f.passwd.focus();
		return false;
	} else{
	confirm("정말 계정을 삭제 하시겠습니까?");
	}
}


//갤러리 이미지 확장자 체크하기
function pdsCheck(f) {
	
	//이미지 판별
	var filename = f.filename.value;
	filename = filename.trim();
	//내가 쓴 방법
	if(filename.length == 0){
		alert("파일을 첨부해주세요.")
		return false;
	} else {
	/*var imgArr = filename.split('.');
	
	for(var i=0; i<imgArr.length; i++){
		if(i == imgArr.length-1){
			var img = imgArr[i].toLowerCase();
			if(img == 'jpg' || img == 'png' || img == 'gif'){
				alert("이미지파일이 맞습니다.");
				return true;
			} else {
				alert("이미지파일이 아닙니다. 확장자를 확인해주세요.");
				return false;
			}
		}
	}*/
	}
	
	//lastIndexOf와 substring 사용
	if(filename.length == 0){
		alert("파일을 첨부해주세요.")
		return false;
	}			
	else {
		
		var start = filename.lastIndexOf(".")+1;
		var end = filename.length;
		filename = filename.substring(start, end);
		filename = filename.toLowerCase();
		
		if(filename == 'jpg' || filename == 'png' || filename == 'gif'){			
			return true;
		} else {
			alert("이미지파일이 아닙니다. 확장자를 확인해주세요.");
			return false;
		}			
	}
	
	
	return false;	
}


