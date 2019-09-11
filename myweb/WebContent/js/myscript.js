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

/*function commentCheck(f) {
	var cwname = f.cwname.value;
	cwname = cwname.trim();
	if(cwname == 0) {
		alert("작성자를 입력하세요.")
		return false;
	}
	
	var comment = f.comment.value;
	comment = comment.trim();
	if(comment == 0) {
		alert("내용을 입력하세요.")
		return false;
	}
	return true;
}*/

/* login */
function loginCheck(f) {
	//로그인 유효성 검사
	//1) 아이디 5~10글자 이내
	var id = f.id.value;
	if (id.length < 4) {
		alert("아이디는 5글자 이상입니다.");
		f.id.focus();
		return false;
	} else if(id.length >10) {
		alert("아이디는 10글자 이내입니다.")
		f.id.focus(0);
		return false;
	}	
	
	//2) 비밀번호 5~10글자 이내
	var passwd = f.passwd.value;
	if (passwd.length < 4) {
		alert("비밀번호는 5글자 이상입니다.");
		f.passwd.focus();
		return false;
	} else if(passwd.length >10) {
		alert("비밀번호는 10글자 이내입니다.")
		f.passwd.focus(0);
		return false;
	}	
	return true;
}//loginCheck() end




