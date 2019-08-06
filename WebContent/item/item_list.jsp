<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Vector" %>
<%@ page import="funding.ItemDTO" %>    
<% String user_sid = null;
if (session.getAttribute("user_sid_key") != null) {
	user_sid =(String)(session.getAttribute("user_sid_key"));
}%>  

<jsp:useBean id="item_dao" class="funding.ItemDAO"></jsp:useBean>
<% 
Vector<ItemDTO> itemlist = item_dao.getItemList(); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="/funding/item/css/cardview.css">
<title>Item list</title>
</head>
<body onload="init();">
	<div class="imenu">
		<div class="totalmenu">	
<% 
for(int i = 0; i < itemlist.size(); i++) {
	ItemDTO item_dto = itemlist.get(i);	
%>
			<div class="card" >
				<figure class="menu-graphic" onclick="detailProc('<%=item_dto.getItem_id()%>');">
					<figcaption>
						<h1><%=item_dto.getItem_title()%></h1>
						남은날짜 : <%=item_dao.getRemainDate(item_dto.getItem_id())%>
						<hr>
						
					</figcaption>		
					<div class="dtext">
						<p><%=item_dto.getItem_content() %></p>
					</div>
					<img src="/funding/data/<%=item_dto.getItem_picture_name()%>">
					
				</figure>
				
				<p class="goal_money"><%=item_dto.getItem_goal_money()%></p>
				
				<div class="tag">
					<a href="javascript:updateProc('<%=item_dto.getItem_id()%>')"><span class="more">수정하기</span></a>
					<a href="javascript:deleteProc('<%=item_dto.getItem_id()%>')"><span class="more">삭제하기</span></a>
				</div>
				
			</div>
<%
}
%>
			<form name="detailForm" method="post" action="/funding/item/item_detail.jsp">
				<input type="hidden" name="detail_no">
			</form>
			
			<form name="updateForm" method="post" action="/funding/item/item_update.jsp" >
				<input type="hidden" name="update_no">
			</form>
			
			<form name="deleteForm" method="post" action="/funding/item/item_proc.jsp?flag=delete" >
				<input type="hidden" name="delete_no">
			</form>
		</div>
	</div>
</body>
<script src="/funding/item/js/item_proc_js.js" charset="utf-8"></script>
</html>