<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% String user_sid = (String)(session.getAttribute("user_sid_key")); %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>�α��� ȭ��</title>
    <link rel="stylesheet" href="./css/login.css">
    <script type="text/javascript" src="./js/sign_in_check.js" charset="utf-8"></script>
</head>
<body>
   <div class="wrapper">
   		<h2>�α���</h2>
        <form name="frm_login" method="post" action="Sigin_in_ok.jsp">
            <input type="text" class="userId_js" name="userId">
            <input type="password" class="userPasswd_js" name="userPasswd">
            <input type="button" class="userId_js" value="�α���" onclick="login_check();">
        </form>
   </div>  
</body>

</html>
