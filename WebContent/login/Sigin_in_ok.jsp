<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="funding.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="userDTO" class="funding.UserDTO"></jsp:useBean>
<jsp:setProperty name="userDTO" property="userId"/>
<jsp:setProperty name="userDTO" property="userPasswd"/>
<%	
	/* ��й�ȣ�� �ʹ� �ȼ���Ű��Ƽ� ��ü�� ����  */
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
		System.out.println("�α��� ����");
		script.println("<script>");
		script.println("alert('���������� �α����� �Ǿ����ϴ�.')");
		script.println("location.href ='/funding/index.jsp'");
		script.println("</script>");
	}
	else if (login_check == 0) {
		System.out.println("��й�ȣ Ʋ��");
		script.println("<script>");
		script.println("alert('��й�ȣ�� Ȯ�����ּ���')");
		script.println("history.back()");
		script.println("</script>");
	}
	else if (login_check == -1) {
		System.out.println("���̵� �����ϴ�.");
		script.println("<script>");
		script.println("alert('���̵� Ȯ�����ּ���')");
		script.println("history.back()");
		script.println("</script>");
	}
	else {
		System.out.println("������ ���̽� ����");
		script.println("<script>");
		script.println("alert('����� �ٽ� �õ����ּ���')");
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