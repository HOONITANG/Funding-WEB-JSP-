<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="funding.ItemDTO" %>
<jsp:useBean id="itemdao" class="funding.ItemDAO"></jsp:useBean>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>프로젝트 상세보기</title>
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
                        <h3>모인 금액</h3>
                        <p class="detail_money"><%=item.getItem_money() %></p>
                        <h3>목표 금액</h3>
                        <p class="detail_money"><%=item.getItem_goal_money()%></p>
                    </div>
                    <div class="item_date">
                        <h3>남은시간</h3>
                        <p>
                        	<%=item.getItem_enroll_date()%> ~ <%=item.getItem_remain_time() %> 
                        	(<%=itemdao.getRemainDate(item.getItem_id()) %>일)
                        </p>
                    </div>
                    <div class="item_people">
                        <h3>후원자 수</h3>
                        <p><%=item.getItem_people()%>명</p>
                    </div>
                    <input type="button" class="button" value="프로젝트 후원하기">
                </div>
            </figure>
            <div class="content_describe">
            	<hr>
            	<h3>프로젝트 설명</h3>
            	<hr>
            	<%=item.getItem_content() %>
            </div>
        </div>
    </div>
<%-- <p>유저아이디 : <%=item.getUserid()%> </p>
	<p>프로젝트 명 : <%=item.getItem_title() %> </p>
	<p>현재 금액: <%=item.getItem_money() %></p>
	<p>목표 금액 <%=item.getItem_goal_money() %></p>
	<img src="/funding/data/<%=item.getItem_picture_name()%>" width="200px" height="200px">
	<p>프로젝트 내용 <%=item.getItem_content() %></p>
	<p>투자한 인원 수 <%=item.getItem_people() %></p>
	<p><%=item.getItem_enroll_date()%> ~ <%=item.getItem_remain_time() %></p>
	<p>남은 날짜 : <%=itemdao.getRemainDate(item.getItem_id()) %>일 </p> --%>	
	
</body>
<script src="/funding/item/js/item_proc_js.js" charset="utf-8"></script>
</html>