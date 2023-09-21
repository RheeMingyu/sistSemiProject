<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>

div.menu {
	position:absolute;
	border : 1px solid gray;
	width : 100px;
	height : 150px;
	
}

.sidebar {
    height: 800px;
    width: 220px;
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


</style>
<body>

<div class="menu">
<button onclick="toggleSidebar()" style="width:40px; height:40px;"><i class="bi bi-menu-app" style="font-size:20px; border:none;"></i></button><br><br>
</div>

<!-- 사이드바 -->
<div class="sidebar">
	<button type="button" style="margin-left:15px; margin-top:20px; border:none;" onclick="toggleSidebar()">
	<i class="bi bi-menu-app" style="font-size:20px;"></i></button>
	<br><br>
    &nbsp;&nbsp;<a href="index.jsp">&nbsp;<i class="bi bi-house-door"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>홈</b></a><br><br>
    &nbsp;&nbsp;<a href="#">&nbsp;<i class="bi bi-person-lines-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>개인정보</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=myPage/secure.jsp">&nbsp;<i class="bi bi-shield-shaded"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>보안</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=admin/adminBoard.jsp">&nbsp;<i class="bi bi-telephone-outbound-fill"></i>&nbsp;&nbsp;&nbsp;<b>고객센터</b></a>
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
</script>

</body>
</html>