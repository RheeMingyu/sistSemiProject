<%@page import="data.dao.MyCourseDao"%>
<%@page import="data.dto.MyCourseDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>나만의 코스</title>
</head>
<style>
/*왼쪽 마이페이지 메뉴바*/
div.menu {
	position: absolute;
	border: 0px solid gray;
	width: 200px;
	height: 850px;
}

i {
	font-size: 30px;
}

/*info1 ~ info3 는 가운데 들어갈 마이페이지의 정보를 의미함*/
div.center1 {
	text-align: center;
	margin-top: 0px;
	margin-left: 350px;
}

div.foot {
	position: absolute;
	top: 5px;
	left: 1000px;
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

.container {
	margin-left:500px;
	margin-top:220px;

}
div.a {
	display:flex;
}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}

.bi.bi-box-arrow-in-right {
  background-color: wheat; /* 배경색을 투명하게 설정합니다. */
}

bi bi-menu-app {
	background-color : white;
}
</style>
<%
String root = request.getContextPath();

String myid = (String)session.getAttribute("myid");


MyCourseDao dao = new MyCourseDao();
List<String> nameList = dao.selectName(myid); 
%>
<body>
		<div class="menu">
			<hr>
			<br>
			<br>
			<br>
			<br>
			<button onclick="toggleSidebar()">
				<i class="bi bi-menu-app" style="font-size: 20px; border: none;"></i>
			</button>
			<br>
			<br> <a
				href="https://map.naver.com/p/entry/place/1917723384?lng=126.899169&lat=33.4915799&placePath=%2Fhome&entry=plt&c=15.00,0,0,0,dh">
				<img alt="광고1.gif" src="<%=root%>/jeju/jongdal.gif"
				style="width: 200px; height: 240px;">
			</a><br>
			<br>
			<br> <a
				href="https://map.naver.com/p/search/%EC%A0%9C%EC%A3%BC%EC%98%A4%EC%84%B1/place/37797002?placePath=?entry=pll&from=nx&fromNxList=true&c=15.00,0,0,0,dh">
				<img alt="광고2.gif" src="<%=root%>/jeju/momo.gif"
				style="width: 200px;">
			</a><br>
			<br>
			<br> <a
				href="https://map.naver.com/p/entry/place/1397321112?lng=126.90498876843613&lat=33.39882693494372&placePath=%2Fhome&entry=plt&c=15.00,0,0,0,dh">
				<img alt="광고3.gif" src="<%=root%>/jeju/onpyeong.gif"
				style="width: 200px;">
			</a><br>
			<br>
			<br> <a
				href="https://map.naver.com/p/entry/place/1035148658?lng=126.3012787&lat=33.2904473&placePath=%2Fhome&entry=plt&c=15.00,0,0,0,dh">
				<img alt="광고4.gif" src="<%=root%>/jeju/osung.gif"
				style="width: 200px;">
			</a><br>
			<br>
			<br>
		</div>

		<!-- 사이드바 -->
		<div class="sidebar">
			<button type="button"
				style="margin-left: 15px; margin-top: 20px; border: none;"
				onclick="toggleSidebar()">
				<i class="bi bi-box-arrow-in-right" style="font-size:24px;"></i>
			</button>
			<br>
			<br> &nbsp;&nbsp;<a href="index.jsp">&nbsp;<i
				class="bi bi-house-door"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>홈</b></a><br>
			<br> &nbsp;&nbsp;<a href="#">&nbsp;<i
				class="bi bi-person-lines-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>개인정보</b></a><br>
			<br> &nbsp;&nbsp;<a href="index.jsp?main=myPage/secure.jsp">&nbsp;<i
				class="bi bi-shield-shaded"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>보안</b></a><br>
			<br> &nbsp;&nbsp;<a href="index.jsp?main=admin/adminBoard.jsp">&nbsp;<i
				class="bi bi-telephone-outbound-fill"></i>&nbsp;&nbsp;&nbsp;<b>고객센터</b></a>
			<!-- 로그인상태면 로그아웃 , 로그아웃 상태면 로그인으로 보이게하기 0905 적어둠 -->
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br> &nbsp;&nbsp;<a href="index.jsp?main=login/logoutAction.jsp">&nbsp;<i
				class="bi bi-door-closed-fill"></i>&nbsp;&nbsp;&nbsp;로그아웃
			</a><br>
		</div>


<div class="container">
<h2><b>나만의코스 리스트</b></h2><br>
	<div class="a">
	<% for(int i=0;i<nameList.size();i++) { 
		String name=nameList.get(i);
		List<MyCourseDto>list=dao.myCourseList(myid, name);
		%>
		<table class="table table-bordered" style="width:450px; height:350px;">
		<%
		for(int j=0;j<list.size();j++){
			MyCourseDto dto=list.get(j);
		%>
			<tr>
			<td style="text-align:center;"><b class="name" style="font-size:20px; cursor:pointer;" 
			onclick="location.href='index.jsp?main=myList/detailCourse.jsp?id=<%=myid %>&name=<%=name%>'">나만의코스 이름 : <%=name %></b></td>
			</tr>
			
			<tr>
				<td style="text-align:center;"><img src ="<%=root %>/jeju/<%=dto.getMainPhoto() %>" style="width:400px; height:300px;"></td>
			</tr>
		<%
		break;
		}
		%>
		</table>
		<%
	}
	%>
	</div>
</div>

	<script>
		// 사이드바 열기/닫기 함수
		function toggleSidebar() {
			var sidebar = document.querySelector('.sidebar');
			sidebar.classList.toggle('open');
		}
		
		
		//detailCourse
<%-- 		function detailCourse() {
			
			var myid = '<%=myid %>';
			var name = $(this).text().split(' ');
			alert(name[3]);
		

			var url ="index.jsp?main=myList/detailCourse.jsp?id="+myid+"&name="+name[3];
			location.href = url;
			
		} --%>
		
		
	</script>
</body>
</html>