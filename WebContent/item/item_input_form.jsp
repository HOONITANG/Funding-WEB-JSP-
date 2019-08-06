<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.io.PrintWriter"%>
<%@ page import="funding.UserDAO" %>
<% 
	UserDAO userDAO = new UserDAO();
	String user_sid = (String)(session.getAttribute("user_sid_key"));
	PrintWriter script = response.getWriter();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="/funding/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<title>������Ʈ ����ϱ�</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<jsp:include page ="/top.jsp" flush="false"/>

<% 
	if (user_sid != null) { 
		if (userDAO.getUserEmailChecked(user_sid) == 1) {
%>
	<form method="post" action="item_proc.jsp?flag=insert" enctype="multipart/form-data">
		������Ʈ�� : <input type="text" name="item_title" id="item_title">
		����÷�� : <input type="file" name="item_picture_name" id="item_picture_name">
		��ǥ�ݾ� : <input type="text" name="item_goal_money" id="item_goal_money">
		��ǰ�Ұ� : <textarea name="item_content" id="ir1" rows="10" cols="100">�����Ϳ� �⺻���� ������ ��(���� ���)�� ���ٸ� �� value ���� �������� �����ø� �˴ϴ�.</textarea>
		������¥ : <input type="text" id="datepicker_init_day" name="item_day"  placeholder="�ʱ⳯¥">
		
		<script>
		$("#datepicker_init_day").datepicker();
		$("#datepicker_init_day").datepicker('setDate', new Date); // ���� ��¥ �ֱ�
		</script>
		<input type="button" value="����" onclick="submitContents(this);">
		<input type="hidden" name="user_id" value=<%=user_sid %>>
	</form>
<%		//�̸��� ���� ���� ��
		} else {
			script.println("<script>");
			script.println("alert('�̸��� ������ �ʿ��� ���� �Դϴ�. �̸��� ���� �� �̿��� �ּ���');");
			script.println("location.href='/funding/email/emailSendConfirm.jsp';");
			script.println("</script>");
		}
		
		//�α��� �ȵǾ����� ��
	} else {
	script.println("<script>");
	script.println("alert('�α��� �� �̿��� �ּ���');");
	script.println("location.href='/funding/login/Sign_in.jsp';");
	script.println("</script>");
	}
%>	
</body>

<script type="text/javascript" src="/funding/item/js/item_proc_js.js" charset="utf-8"></script>
</html>