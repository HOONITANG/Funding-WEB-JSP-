<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String user_sid = (String)(session.getAttribute("user_sid_key")); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ȸ������ ������</title>
    <link rel="stylesheet" href="./css/join.css">
</head>
<body>
<%
if(user_sid == null) {
%>
    <div class="wrapper">
        <h2>ȸ������</h2>
        <div class="join_wrapper">
            <form class="frm" name="join_tran" method="post" action="Join_in_ok.jsp" onchange="subCheck()">
                <div class="frm_input_wrapper frm_id_js">
                    <input class="frm_input frm_input_id_js" type="text" name="userId" onchange="idLoadCheck();" placeholder="ȸ�� ���̵�">
                    <input class="check_id_dup" type="button" onclick="openIdChk();" value="�ߺ��˻�">
                    <p id="iderror">4~12�ڸ��� �����ڿ� ���ڸ� ������ּ���.</p>
                </div>
                <div class="frm_input_wrapper frm_pw_js">
                    <input class="frm_input frm_input_pw_js" type="password" name="userPasswd" placeholder="��й�ȣ">
                	<p>�߸��� ���Դϴ�.</p>
                </div>
                <div class="frm_input_wrapper frm_pwok_js">
                    <input class="frm_input frm_input_pwok_js" type="password" name="userPasswdOk" placeholder="��й�ȣ Ȯ��">
                	<p id="pwerror">���� �Է��� ���� �������� �ʽ��ϴ�.</p>
                </div>
                <div class="frm_input_wrapper frm_em_js">
                    <input class="frm_input frm_input_em_js" type="email" name="userEmail" placeholder="�̸��� �Է�">
                	<p id="emerror">�߸��� ������ �̸����Դϴ�.</p>
                </div>
                <div class="frm_submit_wrapper">
                    <input class="frm_input frm_input_sb_js" type="button" onchange="subCheck()" onclick="submit()" value="ȸ������">
                    <input class="frm_input" type="reset" value="���">
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