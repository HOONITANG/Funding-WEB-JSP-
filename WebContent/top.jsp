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
<title>상단</title>
</head>
<body>
<h1>메인페이지입니다.</h1> 
<% if (user_sid == null) { %>
<a href="/funding/login/Sign_in.jsp">로그인</a>
<a href="/funding/join/Join_in.jsp">회원가입</a>
<%
} else {
%>
<a href="/funding/login/Sign_out.jsp">로그아웃</a> 
<%
}
%>
<a href="/funding/item/item_input_form.jsp">프로젝트 등록하기</a>
</body>
</html>