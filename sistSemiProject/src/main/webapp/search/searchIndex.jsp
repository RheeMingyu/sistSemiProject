<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
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
      border: 0px solid gray;
   }
   div.search_main{
      width: 1200px;
      height: 775px;
      left: 120px;
      margin-top: 90px;
   }
   div.popular{
      width: 250px;
      height: 570px;
      left: 1323px;
      margin-top: 90px;
   }
   div.commercial{
      width: 250px;
      height: 200px;
      top: 667px;
      left: 1323px;
   }
   #com{
   	text-decoration: none;
   	color: black;
   }
</style>
<%
String currentPage=request.getParameter("currentPage");
String sortidx=request.getParameter("sortidx");
String inputWords=request.getParameter("inputWords");
%>
<body>
	<div class="search_layout search_main">
		<jsp:include page="searchBoard_3.jsp">
			<jsp:param value="<%=currentPage %>" name="currentPage"/>
			<jsp:param value="<%=sortidx %>" name="sortidx"/>
			<jsp:param value="<%=inputWords %>" name="inputWords"/>
		</jsp:include>
	</div>
	<div class="search_layout popular">
		<jsp:include page="popularSearches.jsp"/>
	</div>
	<div class="search_layout commercial">
		<h5><a href="https://instagram.com/0ij0_22?igshid=MzRlODBiNWFlZA==" id="com">광고 문의<br><br>010-5257-1503<br>(송주영 과장) 쌍용 카리나<br>신한 110-418-213111</a></h5>
	</div>
</body>
</html>