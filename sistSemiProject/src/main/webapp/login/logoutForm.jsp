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
<title>로그인 완료</title>
</head>
<%
String root=request.getContextPath();
%>
<style>
body {
   min-height: 100vh;
   background-image: url('<%=root %>/jeju/login1.jpg');
   background-size: 100%;

}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}


@keyframes slideIn {
    0% {
        transform: translateX(-100%);
        opacity: 0;
    }
    100% {
        transform: translateX(0);
        opacity: 1;
    }
}

#wel {
    animation: slideIn 2.5s ease-in-out; 
}

</style>
<body>
<meta http-equiv="refresh" content="3; url=index.jsp">

<div class="main">
	<div class="a" id="welcome-text" style="margin-left: 600px; margin-top: 170px;">
   	 	<b id="wel" style="font-size: 32px;">어서오세요</b>
	</div>


	<div style="margin-left:400px; margin-top:20px;">

   <%
   String myid = (String)session.getAttribute("myid"); //session.attribute name가져오기.
   
   //db에 있는 이름 가져온다
   MemberDao dao = new MemberDao();
   String name = dao.getName(myid);
   %>
   <br><br>
   <table>
   <img alt="" src="<%=root%>/jeju/roopy.gif">
   <b style="font-size:20px;">환영합니다 <%=name  %> 님</b><br><br>
   
   <b id="countdown" style="font-size:30px; font-color:red;">3</b>
   <b>초뒤 자동으로 Home으로 넘어 가집니다.</b>
   </table>
   <!-- 나중에 시간이 된다면 지금까지 몇번 로그인했는지 로직을 짜보기  -->
   <!-- 로그인 후 10초뒤 자동으로 홈화면으로 넘어가지게 하는거. -->
	</div>
</div>

<script>
var countdownElement = document.getElementById('countdown');
var timeLeft = 3; // 카운트다운 시작 시간 (초)

function updateCountdown() {
  countdownElement.textContent = timeLeft;
  timeLeft--;

  if (timeLeft < 0) {
    // 시간이 초과되면 리다이렉트를 수행
    window.location.href = 'index.jsp';
  } else {
    // 1초마다 업데이트
    setTimeout(updateCountdown, 1000);
  }
}

// 초기 카운트다운 시작
updateCountdown();



</script>

</body>
</html>