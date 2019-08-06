
const iderror = document.querySelector("#iderror");

const id = document.querySelector(".frm_input_id_js");

const pwerror = document.querySelector("#pwerror");
const pw = document.querySelector(".frm_input_pw_js");
const pwok = document.querySelector(".frm_input_pwok_js");

const emerror = document.querySelector("#emerror");
const email = document.querySelector(".frm_input_em_js");

const btn = document.querySelector(".frm_input_sb_js");
const SHOWING_ON = "showing";

//var re = new RegExp("^[a-zA-Z0-9]{4,12}$");
const idvalid = /^[a-zA-Z0-9]{4,12}$/;

const emvalid = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

function errorShow(chose) {
	chose.classList.add(SHOWING_ON);
	
}

function errorHidden(chose) {
	chose.classList.remove(SHOWING_ON);
}

//id 유효성처리
function idCheck() {

	id.addEventListener("keyup",function () {
		if(idvalid.test(id.value)) {
			subCheck();
			
//			iderror.classList.remove("showing");
			errorHidden(iderror);
		}
		else {
			subCheck();
//			iderror.classList.add("showing");
			errorShow(iderror);
		}
	});
}
//외부에서 불러오는 id유효성 처리
function idLoadCheck() {
	if (idvalid.test(id.value)) {
		errorHidden(iderror);
	}
	else {
		errorShow(iderror);
	}
}

// 비밀번호와 비밀번호 확인 비교 부분 
// 이름빼고 함수는 중복되는데 방법이 없을까?
function passwdCheck() {
	pw.addEventListener("keyup",function () {
		if(pw.value == pwok.value) {
			subCheck();
			errorHidden(pwerror);
		}
		else {
			subCheck();
			errorShow(pwerror);
		}
	});
	
	pwok.addEventListener("keyup",function () {
		if(pw.value == pwok.value) {
			subCheck();
			errorHidden(pwerror);
		}
		else {
			subCheck();
			errorShow(pwerror);
		}
	});
}

//이메일 유효성 처리
function emailCheck() {
	
	email.addEventListener("keyup",function () {
		if(emvalid.test(email.value)) {
			subCheck();
			errorHidden(emerror);
		}
		else {
			subCheck();
			errorShow(emerror);
		}
	});
}

//option 클릭 시 input 값 변경 처리
function OnChange(kakao)
{    
  var gubun = kakao[kakao.selectedIndex].value;
 
  if ( gubun != "X" ){   
	  email.value = kakao[kakao.selectedIndex].text;
  }
  if (gubun == "X") {
	  email.value = "";
  }
}

function btn_on() {
	btn.disabled = false;
}
	 
//버튼비활성화
function btn_off() {
	btn.disabled = 'disabled';
}

// 전체적인 유효성 검사 후 버튼 활성,비활성화 함수
function subCheck() {
	if(idvalid.test(id.value) && pw.value == pwok.value && emvalid.test(email.value)) {
		btn_on();
	}
	else {
		btn_off();
	}
}

// 아이디 중복체크 새로운 화면 open
function openIdChk() {
	window.name = "parentForm";
	window.open("/funding/join/IdCheckForm.jsp", "chkform", "width=500, height=300, resizable=no, scrollbars=no")
}

function init() {
	subCheck();
	idCheck();
	passwdCheck();
	emailCheck();
}

init();