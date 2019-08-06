
//id 유효성 처리
function idCheck() {
	const id = document.querySelector("#usercheckId-js");
	const idvalid = /^[a-zA-Z0-9]{4,12}$/;
	
	if (idvalid.test(id.value)) {
		document.getElementById('checkForm').submit();
	} else {
		alert("4~12자리의 영어 대소문자를 입력해주세요");
	}
}

// 원래 창에 있는 input 태그에 값을 전달해준다.
function sendCheckValue(cuserId) {

	opener.document.join_tran.userId.value = cuserId;
	
	if(opener != null) {
		opener.chkform = null;
		self.close();
	}
}
