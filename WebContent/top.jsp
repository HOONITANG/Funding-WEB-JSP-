<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<% 
String user_sid = null;
user_sid = (String)(session.getAttribute("user_sid_key"));
%>
<meta charset="EUC-KR">
<title>���</title>
</head>
<body>
<h1>�����������Դϴ�.</h1> 
<% if (user_sid == null) { %>
<a href="/funding/login/Sign_in.jsp">�α���</a>
<a href="/funding/join/Join_in.jsp">ȸ������</a>
<%
} else {
%>
<a href="/funding/login/Sign_out.jsp">�α׾ƿ�</a> 
<%
}
%>
<a href="/funding/item/item_input_form.jsp">������Ʈ ����ϱ�</a>
</body>
</html>