<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>보안</title>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}
.bi.bi-box-arrow-in-right {
  background-color: wheat; /* 배경색을 투명하게 설정합니다. */
}
.sidebar {
    height: 800px;
    width: 190px;
    position: fixed;
    top: 100px;
    left: -250px; /* 초기에는 화면 밖에 위치 */
    background-color: wheat;
    transition: left 0.3s ease;
    z-index: 999; /* 이 부분을 추가해서 sidebar가 다른 요소 위에 나타나도록 설정 */
}

        /* 사이드바 링크 스타일 (마우스 호버 시) */
.sidebar a:hover {
            background-color: #555;
        }

        /* 내용 부분 스타일 */
.content {
            margin-left: 0; /* 사이드바가 열릴 때 내용 부분을 옮기기 위한 여백 */
            padding: 20px;
        }

        /* 사이드바 열릴 때 애니메이션 */
.sidebar.open {
   left: 0;
        }
        
div.top {
	border : 0px solid gray;
	margin-left:460px;
	margin-top:120px;
}

div.contatiner {
	position: relative;
    display: flex;
    flex-direction: column;
}
</style>
<%
String root=request.getContextPath();
//로그인 세션
String loginok = (String)session.getAttribute("loginok");

String myid =(String)session.getAttribute("myid");
%>
<body>
<button type="button" onclick="toggleSidebar()" style="margin-top:150px; border:none; margin-left:15px;"><i class="bi bi-menu-app" style="font-size:20px;"></i></button><br><br>


<div class="container" style="margin-left:330px; margin-top:-100px; width:1500px; height:2000px; border-radius:20px;">
    <br><br>
    <div class="row">
        <div class="col-md-4" style="margin-bottom:30px;"> <!-- 왼쪽 열 (이미지) -->
            <img src="<%=root %>/jeju/img1.JPG" alt="보안 이미지" style="margin-left:215px; width:900px; height:200px;">
        </div><br>
    </div>
    <hr><br><br>

		<!-- div안에 비밀번호 변경 div임  -->
		<div class="secure" style="margin-left:170px; border-radius:20px; border:1px solid gray; width:1000px; height:1000px; ">
			<br>
			<legend><b font-size="22px">&nbsp;&nbsp;&nbsp;보&nbsp;안</b></legend><br><hr><br>
			<div class="recentLogin" style=" width: 800px; margin-left:50px; border:1px solid gray; height:120px; border-radius:10px;">
			<b>최근 로그인 날짜 : </b></div><br><br>
			
			<div class="recentLogin" style=" width: 800px; margin-left:50px; border:1px solid gray; height:120px; border-radius:10px; cursor:pointer;" onclick="updatepass()">
			<b>비밀번호 변경하기 ★ </b></div><br><br>
		
			<div class="recentLogin" style=" width: 800px; margin-left:50px; border:1px solid gray; height:120px; border-radius:10px; cursor:pointer" onclick="location.href='https://www.naver.com/'">
			<b>Q 검색하기</b></div><br><br>
			
			<div class="recentLogin" style=" width: 800px; margin-left:50px; border:1px solid gray; height:120px; border-radius:10px; cursor:pointer;" onclick="question()">
			<b>고객센터 의견 보내기 </b></div><br><br>
			
			<div class="recentLogin" style=" width: 800px; margin-left:50px; border:1px solid gray; height:120px; border-radius:10px; cursor:pointer;" onclick="money()">
			<b>후원하기</b></div>
		</div>
</div> <!-- 최종 container 닫는 div임  -->


<!-- 사이드바 -->
<div class="sidebar open">
	<button type="button" style="margin-left:15px; margin-top:50px; border:none;" onclick="toggleSidebar()">
	<i class="bi bi-box-arrow-in-right" style="font-size:24px;"></i></button>
	<br><br><br>
    &nbsp;&nbsp;<a href="index.jsp">&nbsp;<i class="bi bi-house-door"></i>&nbsp;&nbsp;&nbsp;&nbsp;홈</a><br><br>
    &nbsp;&nbsp;<a href="#">&nbsp;<i class="bi bi-person-lines-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;개인정보</a><br><br>
    &nbsp;&nbsp;<a href="#">&nbsp;<i class="bi bi-shield-shaded"></i>&nbsp;&nbsp;&nbsp;&nbsp;보안</a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=admin/adminBoard.jsp">&nbsp;<i class="bi bi-telephone-outbound-fill"></i>&nbsp;&nbsp;&nbsp;고객센터</a>
    <!-- 로그인상태면 로그아웃 , 로그아웃 상태면 로그인으로 보이게하기 0905 적어둠 -->
    <br><br><br><br><br><br><br><br><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=login/logoutAction.jsp">&nbsp;<i class="bi bi-door-closed-fill"></i>&nbsp;&nbsp;&nbsp;로그아웃</a><br>
    
    <%
		// 관리자 로그인하면 메뉴바 하나 더 뜨게 만들기 0905 적어둠
    %>
</div>

<script>
    // 사이드바 열기/닫기 함수
    function toggleSidebar() {
        var sidebar = document.querySelector('.sidebar');
        sidebar.classList.toggle('open');
    }
    
    function money() {
   	 let a= "여러분의 소중한 후원이 여러명의 개발자를 살립니다 감사합니다."; 
   	 let b = "후원계좌 : 카카오뱅크 3333050489678 진현규\n";
   	 let c = "후원계좌 : 카카오뱅크 1234567890123 위시온\n";
   	 let d = "후원계좌 : 카카오뱅크 7979 25 81760 임형준";

   	 alert(a);
   	 alert(b+c+d);
    }
    
    function updatepass() { 
    	var w = window.screen.width/2-500; 
    	var h = window.screen.height/2-200;
    	
        var url = 'index.jsp?main=myPage/updatePass.jsp&myid=<%=myid %>';
        
        window.open(url , "passchange" , "scrollbars=yes , width:1000 , height=400 , left="+w+",top="+h);
    }
    
    function question() {
    		location.href='index.jsp?main=admin/adminBoard.jsp';
    }

</script>


</body>
</html>