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
    // 1: ������ ���� �����͸� ��� ����
    session.invalidate();
    // 2: �α��� �������� �̵���Ŵ.
%>
	<script>
		alert('�α׾ƿ��Ǿ����ϴ�.');
		location.href= '/funding/index.jsp';
	</script>
<%-- <%
    response.sendRedirect("/funding/index.jsp");
%> --%>

</body>
</html>