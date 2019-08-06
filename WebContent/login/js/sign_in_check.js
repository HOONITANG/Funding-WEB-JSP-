function login_check() {
	const userId = document.querySelector(".userId_js");
	const passWd = document.querySelector(".userPasswd_js");
 	if(userId.value == "") {
		alert('아이디를 입력해주세요');
	}
 	else if(passWd.value == "") {
		alert('비밀번호를 입력해주세요');
	}
	else {
		document.frm_login.submit();
	}
	
}