<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> 
<%@ page import="funding.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="userDTO" class="funding.UserDTO" scope="page"/>
<jsp:setProperty name="userDTO" property="userId" />
<jsp:setProperty name="userDTO" property="userPasswd" />
<jsp:setProperty name="userDTO" property="userEmail" />
<%=userDTO.getUserId()%>
<%=userDTO.getUserPasswd()%>
<%=userDTO.getUserEmail()%>
<%
	PrintWriter script = response.getWriter();
	
	//�̰� �ѹ濡 ó���ϴ� �� �����.
	UserDAO user = new UserDAO();
	int check = user.userJoin(request);
	
	if(check != 0 ) {
		script.println("<script>");
		script.println("alert('ȸ�������� �Ϸ�Ǿ����ϴ�.')");
		script.println("location.href='/funding/index.jsp'");
		script.println("</script>");
		System.out.println("���������� �Էµ�.");
	}
	else {
		script.println("<script>");
		script.println("alert('ȸ�������� ���������� ó������ �ʾҽ��ϴ�..')");
		script.println("history.back();");
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