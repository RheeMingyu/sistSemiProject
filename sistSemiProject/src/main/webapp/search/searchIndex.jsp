<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<%
response.setCharacterEncoding("utf-8");
%>
<style>
	div.search_layout{
		position: absolute;
		border: 1px solid gray;
	}
	div.search_main{
		width: 61.5%;
		height: 98.3%;
		left: 10%;
	}
	div.popular{
		width: 17%;
		height: 65%;
		left: 72%;
		background-color: #f6f6f6;
	}
	div.commercial{
		width: 17%;
		height: 32.3%;
		top: 66%;
		left: 72%;
	}
</style>
<body>
	<div class="search_layout search_main">
		<jsp:include page="searchBoard_3.jsp"/>
	</div>
	<div class="search_layout popular">
		<jsp:include page="popularSearches.jsp"/>
	</div>
	<div class="search_layout commercial">
		<h5>광고 문의</h5>
	</div>
</body>
</html>