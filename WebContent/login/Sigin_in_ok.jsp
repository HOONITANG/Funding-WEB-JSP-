<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="funding.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="userDTO" class="funding.UserDTO"></jsp:useBean>
<jsp:setProperty name="userDTO" property="userId"/>
<jsp:setProperty name="userDTO" property="userPasswd"/>
<%	
	/* 비밀번호를 너무 안숨긴거같아서 객체로 전달  */
	/* String log_id = request.getParameter("userId");
	String log_passwd = request.getParameter("userPasswd"); */
	
	PrintWriter script = response.getWriter();
	UserDAO userDAO = new UserDAO();
	int login_check = userDAO.userLogin(userDTO);
	String user_sid = null;
	
	if (login_check == 1) {
		user_sid = userDTO.getUserId();
		if (user_sid != null) {
			session.setAttribute("user_sid_key",user_sid);
		}
		System.out.println("로그인 성공");
		script.println("<script>");
		script.println("alert('성공적으로 로그인이 되었습니다.')");
		script.println("location.href ='/funding/index.jsp'");
		script.println("</script>");
	}
	else if (login_check == 0) {
		System.out.println("비밀번호 틀림");
		script.println("<script>");
		script.println("alert('비밀번호를 확인해주세요')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (login_check == -1) {
		System.out.println("아이디가 없습니다.");
		script.println("<script>");
		script.println("alert('아이디를 확인해주세요')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		System.out.println("데이터 베이스 에러");
		script.println("<script>");
		script.println("alert('잠시후 다시 시도해주세요')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>