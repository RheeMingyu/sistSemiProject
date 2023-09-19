<%@page import="data.dao.MemberDao"%>
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
<title>회원가입을 환영합니다</title>
</head>
<%
	String root=request.getContextPath();
	//String loginok =(String)session.getAttribute("loginok");
	//String myid = (String)session.getAttribute("myid"); 
	String myid = (String)session.getAttribute("myid");
	
	MemberDao dao = new MemberDao();
	
	String name = dao.getName(myid);

	System.out.println(myid);
	
%>
<style>
body {
   min-height: 100vh;
   background-image: url('<%=root %>/jeju/gaip3.jpg');
   background-size: 100%;

}

#wel {
 border-image-width:10%;
}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}

</style>
<body>


<div style="margin:200px 200px; margin-left:420px; border:0px solid gray; width:700px; height:400px;">
	<img id="wel" alt="" src="<%=root%>/jeju/wel1.png" style="width:230px; height:230px;"> <!-- 이벤트줘서 더 이쁘게하기  -->
	<b id="wel2" style="font-size:22px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;어서오세요 회원 가입을 환영합니다. ↓ ↓</b>
	<br>
	
	<button type="button" style="float:right;" class="btn btn-info" onclick="location.href='index.jsp?main=login/loginMain.jsp'">로그인</button>
	<button type="button" style="float:right;" class="btn btn-danger" onclick="location.href='index.jsp'">HOME</button>
	<br><br>
</div>
<script>
$("#wel2").animate();


</script>


</body>
</html>