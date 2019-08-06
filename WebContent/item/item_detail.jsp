<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="funding.ItemDTO" %>
<jsp:useBean id="itemdao" class="funding.ItemDAO"></jsp:useBean>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������Ʈ �󼼺���</title>
<link rel="stylesheet" href="/funding/item/css/detail.css">
</head>
<body onload="init();">
	<%
	int item_no = Integer.parseInt(request.getParameter("detail_no"));
	ItemDTO item = itemdao.itemShow(item_no);  
	%>
	
	<div id="content">
        <div class="content_wrapper">
            <h1><%=item.getItem_title()%></h1>
            <p><%=item.getUserid()%></p>
            <hr>
            <figure>
                <img class="detail_image" src="/funding/data/<%=item.getItem_picture_name()%>">
                <div class="detail_content">
                    <div class="item_gold">
                        <h3>���� �ݾ�</h3>
                        <p class="detail_money"><%=item.getItem_money() %></p>
                        <h3>��ǥ �ݾ�</h3>
                        <p class="detail_money"><%=item.getItem_goal_money()%></p>
                    </div>
                    <div class="item_date">
                        <h3>�����ð�</h3>
                        <p>
                        	<%=item.getItem_enroll_date()%> ~ <%=item.getItem_remain_time() %> 
                        	(<%=itemdao.getRemainDate(item.getItem_id()) %>��)
                        </p>
                    </div>
                    <div class="item_people">
                        <h3>�Ŀ��� ��</h3>
                        <p><%=item.getItem_people()%>��</p>
                    </div>
                    <input type="button" class="button" value="������Ʈ �Ŀ��ϱ�">
                </div>
            </figure>
            <div class="content_describe">
            	<hr>
            	<h3>������Ʈ ����</h3>
            	<hr>
            	<%=item.getItem_content() %>
            </div>
        </div>
    </div>
<%-- <p>�������̵� : <%=item.getUserid()%> </p>
	<p>������Ʈ �� : <%=item.getItem_title() %> </p>
	<p>���� �ݾ�: <%=item.getItem_money() %></p>
	<p>��ǥ �ݾ� <%=item.getItem_goal_money() %></p>
	<img src="/funding/data/<%=item.getItem_picture_name()%>" width="200px" height="200px">
	<p>������Ʈ ���� <%=item.getItem_content() %></p>
	<p>������ �ο� �� <%=item.getItem_people() %></p>
	<p><%=item.getItem_enroll_date()%> ~ <%=item.getItem_remain_time() %></p>
	<p>���� ��¥ : <%=itemdao.getRemainDate(item.getItem_id()) %>�� </p> --%>	
	
</body>
<script src="/funding/item/js/item_proc_js.js" charset="utf-8"></script>
</html>