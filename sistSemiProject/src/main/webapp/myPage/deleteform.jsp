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
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}
</style>
<body>
<%
String root= request.getContextPath();
String myid= (String)session.getAttribute("myid");
%>


<form action="myPage/userDelete.jsp" method="post">
	
	<div class="container" style="margin-left:150px; margin-top:100px; border:1px solid gray; width:800px;">
	<legend>회원탈퇴</legend>
	<img alt="돌하르방 사진 넣고 무섭게하기" src="" style="width:120px; height:180px; margin-top:200px;">
	<input type="hidden" name="id" value="<%=myid %>">
	비밀번호 : <input type="password" name="pass">
	<input type="submit" value="탈퇴">
		<div style="width:400px; height:100px; margin-left:80px; margin-top:70px; border:1px solid gray;">
		<b>회원탈퇴할 떄 보이는 무슨 글 같은거 써놓기</b>
		</div>
	</div>
	
</form>


</body>
</html>