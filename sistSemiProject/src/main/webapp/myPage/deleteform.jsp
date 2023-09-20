<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="mypage.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
<%
String root= request.getContextPath();
String myid= (String)session.getAttribute("myid");
%>

<form action="myPage/userDelete.jsp" method="post" style="display:flex; border:0px solid gray;">
    <div class="container" style="margin-left:150px; margin-top:100px; border:0px solid gray; width:1200px;">
        <legend><b>회원탈퇴</b></legend>
        <img src="<%=root %>/jeju/shoog.JPG" style="width:300px; height:400px; margin-top:20px;">
        <div style="display: flex; flex-direction: column; align-items: center; margin-top: -350px;">
            <img src="<%=root %>/jeju/shoog1.JPG" style="width:150px; height:100px;">
            <div style="border:0px solid gray; width:500px; height:100px; text-align: center; padding: 10px;">
                <b>비밀번호 : </b>
                <input type="password" name="pass">
                <input type="submit" value="탈퇴" class="btn btn-outline-dark" style="height:33px;">
            </div>
        </div>
        <input type="hidden" name="id" value="<%=myid %>">
    </div>
</form>
</body>
</html>



</body>
</html>