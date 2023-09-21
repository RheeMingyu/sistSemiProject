<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.AddListDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.AddListDao"%>
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
<title>나의 일정</title>
</head>
<body>
<style>

.bi.bi-box-arrow-in-right {
  background-color: wheat; /* 배경색을 투명하게 설정합니다. */
}

bi bi-reddit {
 	background-color: transparent;
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

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}
</style>
<%
AddListDao adao = new AddListDao();
List<AddListDto> list = adao.getList();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd - HH:mm:ss");

//로그인 세션
String loginok = (String)session.getAttribute("loginok");

//아이디 얻기
String myid = (String)session.getAttribute("myid");

%>
<body>

<div class="top">
<i class="bi bi-reddit" style="font-size:28px;"></i>&nbsp;&nbsp;&nbsp;일정 목록
</div>
<button type="button" onclick="toggleSidebar()" style="border:none; margin-left:15px;"><i class="bi bi-menu-app" style="font-size:20px;"></i></button><br><br>
<%
int i=0;
for(AddListDto dto:list) {
	if(loginok!=null && myid.equals(dto.getId())) {
		if(i%2==0) {
%>
<div class="row">
<% } %>
<div class="col-md-4">
	<div class="i">
	<table class="table table-bordered" style="width:500px; height:300px; margin-top:10px; margin-left:450px;">
		<tr style="width:150px; height:80px;">
		<td><b>등록날짜 : <%=sdf.format(dto.getWriteday()) %></b></td>
		</tr>
		<tr>
		<td><%=dto.getContent() %></td>
		</tr>
	</table>
	</div>
</div>
<%
	if(i%2!=0) {
%>
</div>
<%		
	}
%>
<%
	i++;
	}
}
%>

<!-- 사이드바 -->
<div class="sidebar open">
	<button type="button" style="margin-left:15px; margin-top:50px; border:none;" onclick="toggleSidebar()">
	<i class="bi bi-box-arrow-in-right" style="font-size:24px;"></i>
	</button>
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
</script>

</body>
</html>