<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
    // 1: 기존의 세션 데이터를 모두 삭제
    session.invalidate();
    // 2: 로그인 페이지로 이동시킴.
%>
	<script>
		alert('로그아웃되었습니다.');
		location.href= '/funding/index.jsp';
	</script>
<%-- <%
    response.sendRedirect("/funding/index.jsp");
%> --%>

</body>
</html>