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
	
	//이걸 한방에 처리하는 게 뭐드라.
	UserDAO user = new UserDAO();
	int check = user.userJoin(request);
	
	if(check != 0 ) {
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다.')");
		script.println("location.href='/funding/index.jsp'");
		script.println("</script>");
		System.out.println("정상적으로 입력됨.");
	}
	else {
		script.println("<script>");
		script.println("alert('회원가입이 정상적으로 처리되지 않았습니다..')");
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