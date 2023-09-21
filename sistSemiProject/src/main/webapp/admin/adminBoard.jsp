<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>고객문의 페이지</title>
</head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}
table,td,tr {
	border:1px solid gray;
}
.a {
	width:1500px;
	height:100%;
	background-color: white;
	display:flex;
	margin-left:280px;
	margin-top:10px;
	
}
td {
cursor:pointer;
}

   #asd{
       width:700px; 
       height:600px;
      border:1px solid gray;
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
        
 #a1 {
 	margin-top : 120px;
 }
 
 tr {
 height:50px;
 }
 .bi.bi-box-arrow-in-right {
  background-color: wheat; /* 배경색을 투명하게 설정합니다. */
}
</style>
<body>
&nbsp;&nbsp;<button id="a1" onclick="toggleSidebar()"><i class="bi bi-menu-app" style="font-size:20px; border:none;"></i></button><br><br>

<div class="a" >
<table id="asd">
	<tr style="border-bottom: 1px solid gray;">
	<td onclick="question()"><b>&nbsp;<i class="bi bi-headset"></i>&nbsp;고객센터&nbsp;[문의하기]</b><p style="float:right"><b>365일 오전 9시 - 익일 오전 3시 운영 ></b>&nbsp;&nbsp;</p></td>
	</tr>

	<tr>
	<td onclick="location.href='#'"><b>&nbsp;<i class="bi bi-chat-dots"></i>&nbsp;카카오톡 1:1 문의</b><p style="float:right"><b>></b>&nbsp;&nbsp;</p></td>
	</tr>
	
	<tr>
	<td onclick="location.href='index.jsp?main=admin/boardList.jsp'"><b>&nbsp;<i class="bi bi-card-checklist"></i>&nbsp;문의 목록</b><p style="float:right"><b>></b>&nbsp;&nbsp;</p></td>
	</tr>

	<tr>
	<td onclick="location.href='#'"><b>&nbsp;<i class="bi bi-question-lg"></i>&nbsp;자주 묻는 질문 FAQ</b><p style="float:right;"><b>></b>&nbsp;</p></td>
	</tr>
	
	<tr>
	<td onclick="location.href='#'"><b>&nbsp;<i class="bi bi-megaphone"></i>&nbsp;공&nbsp;지&nbsp;사&nbsp;항</b><p style="float:right;"><b>></b>&nbsp;</p></td>
	</tr>
	
	<tr>
	<td onclick="location.href='#'"><b>&nbsp;<i class="bi bi-info-circle"></i>&nbsp;Jeju&nbsp;하다 정보</b><p style="float:right;"><b>></b>&nbsp;</p></td>
	</tr>
</table><br>


<div id="questionContent" style="margin-left:150px; width:700px; height:600px; border:0px solid gray;">
</div>

</div>


<div class="sidebar open">
	<button type="button" style="margin-left:15px; margin-top:20px; border:none;" onclick="toggleSidebar()">
	<i class="bi bi-box-arrow-in-right" style="font-size:24px;"></i></button>
	<br><br>
    &nbsp;&nbsp;<a href="index.jsp">&nbsp;<i class="bi bi-house-door"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>홈</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=myPage/mypage.jsp">&nbsp;<i class="bi bi-person-lines-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>개인정보</b></a><br><br>
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
    
    //고객센터 문의시 ajax 사용해서 form나오게하기.
    function question() {
    	
        $.ajax({
            url: 'admin/questionBoard.jsp', 
            type: 'POST', 
            dataType: 'html', // 데이터 형식은 HTML
            success: function(response) {
                // AJAX 요청이 성공하면 내용을 questionContent div에 삽입
                if($('#questionContent').html()=="") {
                	$('#questionContent').html(response);
                } else {
                	$('#questionContent').html("");
                }
                
            },
            error: function() {
                alert('데이터를 불러오는 데 실패했습니다.');
            }
        });
    }
    
</script>





</body>
</html>