<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<%@ page import="funding.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); //��û���������� ������ ������ ��� UTF-8�� �ްڴٴ� �ǹ�%>   
<title>�̸���üũ</title>
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
		script.println("alert('�α����� ���ּ���');");
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
		script.println("alert('������ �����Ͽ����ϴ�.');");
		script.println("location.href = '/funding/index.jsp'");
		script.println("</script>");
		script.close();
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('��ȿ���� ���� �ڵ��Դϴ�.');");
		script.println("location.href = '/funding/index.jsp'");
		script.println("</script>");
		script.close();

	}
	%>

</body>
</html>