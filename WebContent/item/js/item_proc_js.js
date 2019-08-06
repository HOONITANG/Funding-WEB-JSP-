//스마트 에디터에서 제공하는 js
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "/funding/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});

//스마트 에디터와 다른 폼 들의 유효성 처리
// ‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
 // 에디터의 내용이 textarea에 적용된다.
 const moneyvalid = /^[0-9]{1,12}$/;
 const money_id = document.getElementById("item_goal_money");
 oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
 
 // 에디터의 내용에 대한 값 검증은 이곳에서
 // document.getElementById("ir1").value를 이용해서 처리한다.
 
 	if (document.getElementById("ir1").value == "<p><br></p>") {
		 alert('글을 입력해주세요.');
 	} 
 	else if (document.getElementById("item_title").value == ""){ 
//		 alert(document.getElementById("ir1").value);	
 		 alert('제목을 넣어주세요');	
 	}
 	else if (document.getElementById("item_picture_name").value == ""){ 
		 alert('사진을 넣어주세요');		 
 	}
 	else if (!moneyvalid.test(money_id.value)){ 
		 alert('목표금액은 1~12자리 숫자만 입력가능합니다.');		 
 	} else {
			try { elClickedObj.form.submit(); } catch(e) {}
	}
 }

function detailProc(no) {
	document.detailForm.detail_no.value = no;
	document.detailForm.submit();
}

function updateProc(no) {
	document.updateForm.update_no.value = no;
	document.updateForm.submit();
}

function deleteProc(no) {
	document.deleteForm.delete_no.value = no;
	document.deleteForm.submit();
}

// 금액 3자리마다 , 처리
function numberWithCommas() {
	const goal_money = document.querySelectorAll(".goal_money");
	const detail_money = document.querySelectorAll(".detail_money");
	if (goal_money.length > 0) {
		for( var i = 0; i < goal_money.length; i++ ){
			goal_money[i].innerText = "목표금액: " + goal_money[i].textContent.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		}
	}
	if (detail_money.length > 0) {
		for( var i = 0; i < detail_money.length; i++ ){
			detail_money[i].innerText = detail_money[i].textContent.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원";
		}
	}
}

function init() {
	numberWithCommas();
}
	

init();
