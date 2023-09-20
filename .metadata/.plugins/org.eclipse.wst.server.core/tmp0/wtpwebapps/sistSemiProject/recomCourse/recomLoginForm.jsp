<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body * { 
 font-family: 'Jeju Gothic', sans-serif;
}

html {
  height: 100%;
}
body {
  margin:0;
  padding:0;
  font-family: sans-serif;
  background: #fff;
  min-height: 100vh; 
  background-image: url('image/b1.JPG');
  background-size:100% 100%;
}

.login-box {
  width: 400px;
  margin-top : 460px;
  margin-left : 920px;
  padding: 40px;
  transform: translate(-50%, -50%);
  background: rgba(0,0,0,.5);
  box-sizing: border-box;
  box-shadow: 0 15px 25px rgba(0,0,0,0.5);
  border-radius: 10px;
}

.login-box h2 {
  margin: 0 0 30px;
  padding: 0;
  color: #fff;
  text-align: center;
}

.login-box .user-box {
  position: relative;
}

.login-box .user-box input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background: transparent;
}
.login-box .user-box label {
  position: absolute;
  top:0;
  left: 0;
  padding: 10px 0;
  font-size: 16px;
  color: #fff;
  pointer-events: none;
  transition: .5s;
}

.login-box .user-box input:focus ~ label,
.login-box .user-box input:valid ~ label {
  top: -20px;
  left: 0;
  color: #03e9f4;
  font-size: 12px;
}

.login-box form a {
  position: relative;
  display: inline-block;
  padding: 10px 20px;
  color: black;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 40px;
  letter-spacing: 4px;
  width: 140px; 
  height: 40px; 
}

.login-box a:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}


.login-box a span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 50px;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%,100% {
    left: 100%;
  }
}

.login-box a.button-signup {
  position: absolute;
  right: 10px; /* 수정: 오른쪽 정렬 */
  bottom: 10px; /* 수정: 아래 정렬 */
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 20px;
  letter-spacing: 4px;
  width: 140px; 
  height: 40px; 
  display: flex;
  align-items: center;
  justify-content: center;
}


.login-box a.button-signup:hover {
  background: #03e9f4;
  color: #fff;
  border-radius: 5px;
  box-shadow: 0 0 5px #03e9f4,
              0 0 25px #03e9f4,
              0 0 50px #03e9f4,
              0 0 100px #03e9f4;
}

.login-box a.button-signup span {
  display: block;
}

.login-box a.button-signup span:nth-child(1) {
  top: 0;
  left: -100%;
  width: 100%;
  height: 2px;
  background: linear-gradient(90deg, transparent, #03e9f4);
  animation: btn-anim1 1s linear infinite;
}

@keyframes btn-anim1 {
  0% {
    left: -100%;
  }
  50%,100% {
    left: 100%;
  }
}

.login-box a.button-signup span:nth-child(2) {
  top: -100%;
  right: 0;
  width: 2px;
  height: 100%;
  background: linear-gradient(180deg, transparent, #03e9f4);
  animation: btn-anim2 1s linear infinite;
  animation-delay: .25s;
}

.login-box button.button-login {
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  background: transparent;
  border: 2px solid #03e9f4;
  border-radius: 5px;
  transition: .5s;
  margin-top: 20px; /* Adjust the margin as needed */
  margin-right: 10px; /* Adjust the margin as needed */
  cursor: pointer;
  outline: none;
}

.login-box button.button-login {
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  background: transparent;
  border: 2px solid transparent; /* Transparent border initially */
  border-radius: 5px;
  transition: .5s;
  margin-top: 20px; /* Adjust the margin as needed */
  margin-right: 10px; /* Adjust the margin as needed */
  cursor: pointer;
  outline: none;
  position: relative;
  overflow: hidden;
}

.login-box button.button-login:hover {
  background: #03e9f4;
  color: #fff;
  border: 2px solid #03e9f4; /* Add border color on hover */
}

.login-box button.button-login::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: transparent;
  border: 2px solid #03e9f4; /* Border color to match hover state */
  border-radius: 5px;
  transform: scale(0.8); /* Initial scale */
  opacity: 0; /* Initial opacity */
  transition: transform 0.3s ease, opacity 0.3s ease;
}

.login-box button.button-login:hover::before {
  transform: scale(1.2); /* Scale on hover */
  opacity: 1; /* Show on hover */
}

.login-box input[type="submit"] {
  border: none;
  background: transparent;
  font-weight: bold;
  margin-left: 50px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
}

</style>
</head>

<%

String name=request.getParameter("name");

String myid = (String)session.getAttribute("loginok");
String saveok = (String)session.getAttribute("saveok");
String sesave = (String)session.getAttribute("sesave");
//String memberid = (String)session.getAttribute("MEMBERID");

//boolean login = memberid==null?false:true;

boolean save = true;

if(saveok==null) {
   myid="";
   save=false;
} else {
   save = true;
}


%>
<body>

<div class="login-box">
  <h2>Login</h2>
  <hr>
  <form action="recomCourse/recomLoginAction.jsp" method="post">
  	<input type="hidden" name="name" value="<%=name%>">
    <div class="user-box">
      <input type="text" name="id" required="required" value="<%=saveok==null?"":myid %>">
      <label>ID</label>
    </div>
    <div class="user-box">
      <input type="password" name="pass" required="required" size="15">
      <label>Password</label><br>
    </div>
    
    <!-- 로그인 버튼 위치 수정하기 -->
    <button type="submit" class="btn btn-info" style="text-align:center; border: none; background: transparent; width: 100px; font-weight: bold; margin-left: 100px;">Enter</button><br>
    
    <!-- TODO : 버튼 클릭시 아이디찾기랑 비밀번호 찾기 할 수 있게 구현하기. -->
    <br>
    <div style="display: flex; justify-content: center; margin-top: 10px;">
     <button type="button" style="border: none; background: transparent; width: 100px; font-weight: bold; margin-left: 8px;"><b style="font-size:13px;">아이디찾기</b></button>
     <button type="button" style="border: none; background: transparent; width: 110px; font-weight: bold; margin-left: 10px;"><b style="font-size:13px;">비밀번호찾기</b></button>
   </div>

    
    <a class="button-signup" href="index.jsp?main=member/Gaipform.jsp"><b>회원가입</b></a>

    <br><br>
    
    <input type="checkbox" name="cbsave" <%=saveok==null?"":"checked" %>><b style="font-size:14px;">아이디저장</b>&nbsp;&nbsp;
    <input type="checkbox" name="sesave" <%=sesave==null?"":"checked" %>><b style="font-size:14px;">로그인상태유지</b>
  </form>
</div>


<%
System.out.println(name);

%>

</body>
</html>