<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>JejuDo_Hada</title>
<style>
	div.layout{
		border: 0px solid gray;
		position: absolute;
	}
</style>
<%
	//절대 경로 잡기
	//이거를 모든 파일에 복사해서 쓰면 되는 것
	String root=request.getContextPath();
%>
<link rel="icon" href="<%=root%>/jeju/android-icon-96x96.png"/> 
<link rel="apple-touch-icon" href="<%=root%>/jeju/android-icon-96x96.png"/>
</head>
<%
	//mainPage(기본 페이지) 정의
	String mainPage="layout/main.jsp";
	
	//url을 통해서 main값을 얻은 뒤 메인 웹페이지에 출력한다
	if(request.getParameter("main")!=null)
	{
		mainPage=request.getParameter("main");
	}

%>
<body>
	<div class="layout menu">
		<jsp:include page="layout/menu.jsp"/>
	</div>
	
	<div class="layout main">
		<jsp:include page="<%=mainPage%>"/>
	</div>
<audio autoplay loop>
        <source src="<%=root %>/audio/bgm.mp3">
    </audio>	
</body>
</html>