<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="funding.ItemDTO" %>
<%@ page import= "java.io.PrintWriter"%>
<jsp:useBean id="item_dao" class="funding.ItemDAO" ></jsp:useBean> 
<% 
	String user_sid = (String)(session.getAttribute("user_sid_key"));
	PrintWriter script = response.getWriter();
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	String flag = request.getParameter("flag");
	ItemDTO item_dto = new ItemDTO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>item ó��</title>
</head>
<body>
	<%
	if(user_sid != null) { 
		if (flag.equals("insert")) {
			int result = item_dao.itemWrite(request);
			if (result == 1) {
				response.sendRedirect("/funding/index.jsp");
			}
		}
		else if (flag.equals("update")) {
			int result = item_dao.itemUpdate(request);
			if (result == 1) {
				response.sendRedirect("/funding/index.jsp");
			}
		}
		else if (flag.equals("delete")) {
			int itemid =  Integer.parseInt(request.getParameter("delete_no"));
				if (item_dao.getUserId(itemid).equals(user_sid)) {
					int result = item_dao.itemDelete(itemid);
					if (result == 1) {
						response.sendRedirect("/funding/index.jsp");
					}
				} else {
					script.println("<script>");
					script.println("alert('�ڽ��� ���۸� ���� �� �� �ֽ��ϴ�.')");
					script.println("history.back()");
					script.println("</script>");
				}
		}
		else {
			System.out.println("bye");
		}
	} else {
		%>	
		<%
			script.println("<script>");
			script.println("alert('�α��� �� �̿��� �ּ���');");
			script.println("location.href='/funding/index.jsp';");
			script.println("</script>");
			}
		%>
	
</body>
</html>