<%@page import="data.dao.RecomCourseDao"%>
<%@page import="data.dto.CourseDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body * { 
 font-family: 'Jeju Gothic', sans-serif;
}


	p.hfont{
		font-size: 50px;
		float: left;
		color: gray;
		font-family: Bagel Fat One;
		align-self: center;
	}
	img.himg{
		margin: 20px 50px;
		width: 50px;
		height: 50px;
		align-self: center;
	}
	table.tb{
		width: 1200px;
		padding: 50px;
		margin: 50px;
		cursor: pointer;
	}
	.bline{
		border-bottom: 2px solid gray;
	}
	.bg{
		position: absolute;
		left: 200px;
		margin-top: 200px;
	}
	
</style>

<title>Insert title here</title>
</head>


<%
String root=request.getContextPath();

RecomCourseDao RecomCourseDao=new RecomCourseDao();

// 추천코스 list 값 불러오기
List<CourseDto> distinctlist=RecomCourseDao.getCourseName();


// 추천코스 name에 따른 목록 값들 불러오기
/* Vector<RecomCourseDto> coslist=RecomCourseDao.getCourseList(name); */
%> 

<body>
	<div class="bg">
		<div class="input-group">
			<img class="himg" src="<%=root %>/jeju/map.png">
			<p class="hfont">추 천 코 스</p>
		</div>
		<%
		for (CourseDto RecomCourseDto : distinctlist) {
		%>
		<table class="table table-bordered tb" recomname="<%=RecomCourseDto.getName()%>">
			<tr>
				<td rowspan="2" style="width: 20px; padding: 20px;"><img alt="" src="<%=root %>/jeju/<%=RecomCourseDto.getMainphoto() %>" style="width: 200px;"></td>
				<td>
					<h3>
						<b><%=RecomCourseDto.getName()%></b>
					</h3>
				</td>
			</tr>
			<tr class="bline">
				<td style="padding: 20px;">
					<h5><%=RecomCourseDto.getIntro()%></h5>
				</td>
			</tr>
		</table>
		<% }%>
	</div>
	
	<script type="text/javascript">

$("table.tb").click(function(){
	var name=$(this).attr("recomname");
	/* alert(name); */
	location.href="index.jsp?main=recomCourse/detailRecomCourse.jsp?name="+name;
	/* location.href="../recomCourse/detailRecomCourse.jsp?name="+name; */
	
});

	</script>
</body>
</html>