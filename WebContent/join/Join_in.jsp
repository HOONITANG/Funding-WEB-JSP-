<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String user_sid = (String)(session.getAttribute("user_sid_key")); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
    <link rel="stylesheet" href="./css/join.css">
</head>
<body>
<%
if(user_sid == null) {
%>
    <div class="wrapper">
        <h2>회원가입</h2>
        <div class="join_wrapper">
            <form class="frm" name="join_tran" method="post" action="Join_in_ok.jsp" onchange="subCheck()">
                <div class="frm_input_wrapper frm_id_js">
                    <input class="frm_input frm_input_id_js" type="text" name="userId" onchange="idLoadCheck();" placeholder="회원 아이디">
                    <input class="check_id_dup" type="button" onclick="openIdChk();" value="중복검사">
                    <p id="iderror">4~12자리의 영문자와 숫자를 사용해주세요.</p>
                </div>
                <div class="frm_input_wrapper frm_pw_js">
                    <input class="frm_input frm_input_pw_js" type="password" name="userPasswd" placeholder="비밀번호">
                	<p>잘못된 값입니다.</p>
                </div>
                <div class="frm_input_wrapper frm_pwok_js">
                    <input class="frm_input frm_input_pwok_js" type="password" name="userPasswdOk" placeholder="비밀번호 확인">
                	<p id="pwerror">위와 입력한 값이 동일하지 않습니다.</p>
                </div>
                <div class="frm_input_wrapper frm_em_js">
                    <input class="frm_input frm_input_em_js" type="email" name="userEmail" placeholder="이메일 입력">
                	<p id="emerror">잘못된 형식의 이메일입니다.</p>
                </div>
                <div class="frm_submit_wrapper">
                    <input class="frm_input frm_input_sb_js" type="button" onchange="subCheck()" onclick="submit()" value="회원가입">
                    <input class="frm_input" type="reset" value="취소">
                </div>
            </form>
        </div>
    </div>
<%
} else {
	response.sendRedirect("/funding/index.jsp");
}
%>    


</body>
<script type="text/javascript" src="./js/join_check.js" charset="utf-8"></script>
</html>