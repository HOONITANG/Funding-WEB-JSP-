<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="funding.UserDAO" %> 
<%@ page import="java.io.PrintWriter" %>
<%response.setCharacterEncoding("utf-8");
response.setContentType("text/html"); 
request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
</style>
<meta charset="EUC-KR">
<title>아이디 중복검사 처리</title>
</head>
<body>
<%
String userId = request.getParameter("idinput");
UserDAO userDAO = new UserDAO();
int flag = userDAO.userIdCheck(userId);
PrintWriter script = response.getWriter();
%>

<%
if (flag == 1) {
	script.println("<script>");
	script.println("alert('사용가능한 아이디 입니다.');");
	script.println("</script>");
%>
<div id="wrap">
	<br> <b><font size="4" color="gray">아이디 중복체크</font></b>

	<hr size="1" width="460">
	<br>
	<div id="chk">
		<form>
			<h3><%=userId%></h3>
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue('<%=userId%>');">
		</form>
		<br>
	</div>
</div>
<%
	} else {
		script.println("<script>");
		script.println("alert('중복된 아이디 입니다.');");
		script.println("history.back();");
		script.println("</script>");
	}
%>
</body>
<script type="text/javascript" src="./js/id_dup_check.js"></script>
</html>