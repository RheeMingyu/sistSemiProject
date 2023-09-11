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
		color: gray;
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
</style>

<title>Insert title here</title>
</head>


<%

RecomCourseDao RecomCourseDao=new RecomCourseDao();

//페이징처리하기
int totalCount=RecomCourseDao.getTotalCount(); // 전체 갯수
int totalPage; // 총 페이지 수
int startPage; // 각 블럭에서 보여질 시작 페이지
int endPage; // 각 블럭에서 보여질 끝 페이지
int startNum; // db에서 가져올 글의 시작번호 (MySQL에서는 첫 글이 0번, Oracle에서는 1번)
int perPage=3; // 한페이지당 몇개의 게시글을 보여줄 것인가? // 선생님 표현 : 한페이지당 몇개의 글을 보여줄 것인가? 
int perBlock=5; // 한 페이지당 몇개의 블락 no을 보여줄 것인가? //선생님 표현 : 한 블럭당 몇개의 페이지를 보여줄 것인가? 보통 페이지 아래에 1~숫자... 다음 페이지  
int currentPage; // 현재페이지 -> 몇번 block No에 있는가? 
int no; // 각페이지당 출력할 시작번호


//현재 페이지에대한 설정
//현재 페이지 읽기(단 null일 경우는 1페이지로 준다)
if(request.getParameter("currentPage")==null||request.getParameter("currentPage").equals("null")){
   	currentPage=1;
}  else {
      currentPage=Integer.parseInt(request.getParameter("currentPage")); // getParameter로 받을때에는 무조건 문자열로 불러온다. 계산을 해야하기 때문에 형변환 해준다.
}     
// 총페이지수 구하기
// 총 글의 갯수/한페이지당 보여질 갯수로 나눔(7/5=1) -> 나머지가 1개라도 있으면 1page를 추가한다는 의미다.
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	
// 각 블럭당 보여야 할 시작페이지 
// perBlock=5일 경우는 현재페이지가 1~5 까지, 시작이 1, 끝이 5라는 뜻!
// 현재페이지가 13일경우 시작이 11, 끝이 15 라는 것을 지정해주는 수식! // block 넘버를 뜻한다. 
	startPage=(currentPage-1)/perBlock*perBlock+1; // 현재 페이지에 표현되는 시작 block number	

	endPage=startPage+perBlock-1; // 현재 페이지에 표현되는 끝 block number

// 만약에 총page가 23까지 있으면 마지막 블럭은 25가 아니라 23이다. 
 if(endPage>totalPage)
   	endPage=totalPage;

// 각 페이지에서 보여질 시작번호
// 1페이지 : 0, 2페이지 : 5, 3페이지 : 10....
startNum=(currentPage-1)*perPage;

// 각 페이지당 출력할 시작번호 구하기 no	
// 예) 총 글 갯수가 23이면, 1페이지 넘버링 시작은 23이다. 2페이지는 18, 3페이지는 13...
	// 출력시 1 감소하면서 출력
	no=totalCount-(currentPage-1)*perPage; // 내림차순이기때문에 쓴 것이다.	

// 페이지에서 보여질 글만 가져오기
List<CourseDto> RecomCourseList=RecomCourseDao.getPagingList(startNum, perPage);
// 여기까지 페이징 처리
 

// 추천코스 list 값 불러오기
List<CourseDto> distinctlist=RecomCourseDao.getCourseName();


// 추천코스 name에 따른 목록 값들 불러오기
/* Vector<RecomCourseDto> coslist=RecomCourseDao.getCourseList(name); */
%>

<body>
	<div>
	<figure class="input-group ">
	<img class="himg" src="../no_image/map.png">
	<p class="hfont"> 추 천 코 스</p>
	</figure>
	
	<%for(CourseDto RecomCourseDto:distinctlist){ %> 
	<table class="table table-bordered tb" recomname="<%=RecomCourseDto.getName()%>">
		<tr>
			<td rowspan="2" style="width: 200px; padding: 20px;">
				<img alt="" src="../no_image/sample.jpeg" style="width: 200px;">
			</td>
			<td>
				<h3><b><%=RecomCourseDto.getName() %></b></h3>
			</td>
		</tr>
 		<tr class="bline">
			<td style="padding: 20px;">
				<h5><%=RecomCourseDto.getIntro() %></h5>
			</td>
		</tr>
	</table>

	<% }%>
 
		<!-- 페이징하기 -->
		<div>
			<ul class="pagination justify-content-center">
				<%
		  		// 이전
		  		if(startPage>1){ %>
				<li class="page-item"><a class="page-link"
					href="index.jsp?main=MyCourse/myCourseList.jsp?currentPage=<%=startPage-1%>"><<</a>
				</li>
				<%}
		  		
		  		for(int pp=startPage;pp<=endPage;pp++){
		  			if(pp==currentPage){ // css를 추가하기 위해서 if문 추가하는 것이다. 
		  				%>
				<li class="page-item active"><a class="page-link"
					href="index.jsp?main=MyCourse/myCourseList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
				<%} else{
		  				%>
				<li class="page-item"><a class="page-link"
					href="index.jsp?main=MyCourse/myCourseList.jsp?currentPage=<%=pp%>"><%=pp %></a>
				</li>
				<%}
		  		}
		  		
		  		// 다음
		  		if(totalPage>endPage){
		  			%>
				<li class="page-item"><a class="page-link"
					href="boardlist.jsp?currentPage=<%=endPage+1%>">>></a></li>

				<%}
		  		%>
			</ul>
		</div>
	</div> 

<script type="text/javascript">

$("table.tb").click(function(){
	var name=$(this).attr("recomname");
	alert(name);
	location.href="../recomCourse/detailRecomCourse.jsp?name="+name;
	/* location.href="../r ecomCourse/detailRecomCourse.jsp?name="+name; */
	
});

</script>
</body>
</html>