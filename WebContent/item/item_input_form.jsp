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
<title>프로젝트 등록하기</title>
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
		프로젝트명 : <input type="text" name="item_title" id="item_title">
		사진첨부 : <input type="file" name="item_picture_name" id="item_picture_name">
		목표금액 : <input type="text" name="item_goal_money" id="item_goal_money">
		제품소개 : <textarea name="item_content" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
		마감날짜 : <input type="text" id="datepicker_init_day" name="item_day"  placeholder="초기날짜">
		
		<script>
		$("#datepicker_init_day").datepicker();
		$("#datepicker_init_day").datepicker('setDate', new Date); // 오늘 날짜 넣기
		</script>
		<input type="button" value="전송" onclick="submitContents(this);">
		<input type="hidden" name="user_id" value=<%=user_sid %>>
	</form>
<%		//이메일 인증 없을 때
		} else {
			script.println("<script>");
			script.println("alert('이메일 인증이 필요한 서비스 입니다. 이메일 인증 후 이용해 주세요');");
			script.println("location.href='/funding/email/emailSendConfirm.jsp';");
			script.println("</script>");
		}
		
		//로그인 안되어있을 때
	} else {
	script.println("<script>");
	script.println("alert('로그인 후 이용해 주세요');");
	script.println("location.href='/funding/login/Sign_in.jsp';");
	script.println("</script>");
	}
%>	
</body>

<script type="text/javascript" src="/funding/item/js/item_proc_js.js" charset="utf-8"></script>
</html>