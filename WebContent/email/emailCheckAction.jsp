<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<%@ page import="funding.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); //요청페이지에서 들어오는 값들을 모두 UTF-8로 받겠다는 의미%>   
<title>이메일체크</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String code = null;
	if(request.getParameter("code") != null ) {
		code = request.getParameter("code");
	}
	
	UserDAO userDAO = new UserDAO();
	String user_sid = null;
	if(session.getAttribute("user_sid_key") != null) {
		user_sid = (String) session.getAttribute("user_sid_key");
	}
	
	if(user_sid == null) {
		PrintWriter script = response.getWriter();
		
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = '/funding/login/Sign_in.jsp'");
		script.println("</script>");
		script.close();
	}
	
	String userEmail = userDAO.getUserEmail(user_sid);
	boolean isRight = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	
	if(isRight == true) {
		userDAO.setUserEmailChecked(user_sid);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공하였습니다.');");
		script.println("location.href = '/funding/index.jsp'");
		script.println("</script>");
		script.close();
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.');");
		script.println("location.href = '/funding/index.jsp'");
		script.println("</script>");
		script.close();

	}
	%>

</body>
</html>