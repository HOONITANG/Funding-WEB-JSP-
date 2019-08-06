<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="funding.ItemDTO"%>
<%@ page import= "java.io.PrintWriter"%>
<jsp:useBean id="item_dao" class="funding.ItemDAO"></jsp:useBean>
<% 
String user_sid = (String)(session.getAttribute("user_sid_key"));
PrintWriter script = response.getWriter();
int item_id = Integer.parseInt(request.getParameter("update_no"));
ItemDTO item_dto = new ItemDTO();
item_dto = item_dao.itemShow(item_id); 
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/funding/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>������Ʈ �����ϱ�</title>
</head>
<body>
<% 
	if(user_sid != null) { 
		if (item_dao.getUserId(item_id).equals(user_sid)) {
%>
	<form method="post" action="item_proc.jsp?flag=update" enctype="multipart/form-data">
		������Ʈ�� : <input type="text" name="item_title" id="item_title" value=<%=item_dto.getItem_title() %>>
		����÷�� : <input type="file" name="item_picture_name" id="item_picture_name" value=<%=item_dto.getItem_picture_name() %> >
		��ǥ�ݾ� : <input type="text" name="item_goal_money" id="item_goal_money" value=<%=item_dto.getItem_goal_money() %>>
		��ǰ�Ұ� : <textarea name="item_content" id="ir1" rows="10" cols="100"><%=item_dto.getItem_content() %></textarea>
		������¥ : <input type="text" id="datepicker_init_day" name="item_day"  placeholder="�ʱ⳯¥" value=<%=item_dto.getItem_remain_time()%>>
		
		<script>
		$("#datepicker_init_day").datepicker();
		$("#datepicker_init_day").datepicker('setDate', new Date); // ���� ��¥ �ֱ�
		</script>
		
		<input type="button" value="����" onclick="submitContents(this);">
		<input type="hidden" name ="item_id" value= <%=item_id%>>
	</form>
<%		} else {
			script.println("<script>");
			script.println("alert('�ڽ��� ���۸� ���� �� �� �ֽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		  }
	} else {
%>	
<%
	script.println("<script>");
	script.println("alert('�α��� �� �̿��� �ּ���');");
	script.println("history.back();");
	script.println("</script>");
	}
%>
</body>

<script type="text/javascript" src="/funding/item/js/item_proc_js.js" charset="utf-8"></script>

</html>