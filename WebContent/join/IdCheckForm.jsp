<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>���̵� �ߺ� üũ</title>
    <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
   </style>

</head>
<body>
<div id="wrap">
    <br>
    <b><font size="4" color="gray">���̵� �ߺ�üũ</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm" method="post" action="Id_check_ok.jsp">
            <input type="text" name="idinput" id="usercheckId-js">
            <input type="button" value="�ߺ�Ȯ��" onclick="idCheck()">
        </form>
        <br>
        <input id="cancelBtn" type="button" value="���" onclick="window.close()"><br>
        
    </div>
</div>    
</body>
<script type="text/javascript" src="./js/id_dup_check.js" charset="utf-8"></script>
</html>
