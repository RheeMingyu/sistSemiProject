<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.TourSpotDto"%>
<%@page import="data.dto.CourseDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourSpotDao"%>
<%@page import="data.dao.RecomCourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Orbit&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<%
// dao 호출
RecomCourseDao RecomCourseDao = new RecomCourseDao();
TourSpotDao TourSpotDao = new TourSpotDao();

String name = request.getParameter("name");

// name값을 받아서 recomCourse 출력
List<CourseDto> recomlist = RecomCourseDao.getRecomCourseName(name);

System.out.println(name);

// 받아온 CourseDto의 name값을 이용하여 tour_seq 가져오기 (RecomCourse table)
// 가져온 tour_ser를 이용하여 TourSpotDto의 자료 가져오기 (RecomCourse table -> TourSpot table)
List<TourSpotDto> spotlist = new ArrayList<TourSpotDto>();

for (int i = 0; i < recomlist.size(); i++) {
	String tour_seq = recomlist.get(i).getTour_seq(); // 순차적으로 name에 해당하는 Tour_seq의 값을 받아온다. 
	TourSpotDto tdto = TourSpotDao.getdata(tour_seq);
	spotlist.add(tdto);

}

String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");

MemberDao MemberDao = new MemberDao();

String root=request.getContextPath();

%>


<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body * { 
 font-family: 'Jeju Gothic', sans-serif;
}


.slick {
	margin-bottom: 20px;
}
/*이전,다음*/
.slick-arrow {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 5
}

.slick-prev {
	left: 0;
}

.slick-next {
	right: 0;
}

.slick-list {
	
}

.list-box {
	position: relative;
	margin: 0 5px;
	display:flex;
	flex-direction: column;
    justify-content:center;
    align-items:center;
    padding: 10px 10px 10px 10px;
}

.image-box1 {
	border-radius: 10px;
	overflow: hidden;
	width: 100%;
	aspect-ratio: 1;
	position: relative;
	display: inline-block;
}

.list-box img {
	width: 100%;
	height: 100%;
}

.slick-prev, .slick-next {
	background: transparent;
	border: 0
}

.slick-prev:after {
	content: '';
	width: 50px;
	height: 50px;
	display: block;
	background-image: url(<%=root%>/jeju/left.svg);
	background-size: 100%;
}

.slick-next:after {
	content: '';
	width: 50px;
	height: 50px;
	display: block;
	background-image: url(<%=root%>/jeju/left.svg);
	background-size: 100%;
	transform: scaleX(-1);
}


.photoname{
	width: 100%;
	text-align: center;
	margin-bottom: 0;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	text-shadow: 2px 2px 2px gray;
	font-size: 20px;
	color: #fff;
	font-weight: bold;
}

.box-style {
	padding: 0 20px 20px;
	box-sizing: border-box;
}

.box-in-style {
	background: #fff;
	border-radius: 10px;
	box-shadow: 2px 3px 9px 3px rgba(87, 88, 89, .25);
	padding: 10px 20px;
	box-sizing: border-box;
	border: 2px solid #1976D2;

}

.title {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.title>div {
	display: flex;
	align-items: center;
	justify-content: center;
}

div.title>div p {
	margin-bottom: 0;
}

div.tnum {
	border-radius: 100px;
	background-color: #1976D2;
	width: 20px;
	height: 20px;
	margin-right: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

div.detailbg {
	width: 1200px;
	background-color: #cfcfcf;
	margin: 0 auto;
	border-radius:20px; 
}

div.taddr {
	display: flex;
}

.img-box {
	width: 500px;
	height: 500px;
	background: #eee;
	border-radius: 10px;
	overflow: hideen;
	margin: 30px auto;
}

.img-boxclick{
	background-color: blue;
	opacity: 0.4;

}

.img-box>img {
	width: 100%;
	height: 100%;
}

.tag-box {
	display: flex;
	flex-wrap: wrap;
	align-items: center;
}

.tag-box>p {
	margin: 0 8px 0 0;
	font-size: 16px;
	color: #000;
}

div.text-box, div.tag-box {
	padding: 1 20px 10px 20px;
}

div.container {
	align-content: center;
}

div.backgound {
	width: 100%;
	top: 100px;
	left: 200px;
}

.heartBtn {
	position: fixed;
	right: 10%;
	bottom: 10%;
	border: transparent;
	background-color: transparent;
}

.bi-heart {
	font-size: 30px;
}

.bi-heart-fill {
	font-size: 30px;
	color: red;	
}

div.bg{
	margin: 100px 100px 100px 100px;
}

.t-order{
	border: 2px solid #1976D2;
	background-color: white;
	border-radius: 30px;
	width: 30px;
	height: 30px;
	font-size: 16px;
	color: black;
	display: flex;
	justify-content: center;
	margin: 0 auto;
	margin-bottom: 10px;
}

</style>


<title>Insert title here</title>
</head>
<body>

	<div class="likes">
		<button class="heartBtn" name="<%=name%>">
			<i class="bi bi-heart"></i>
		</button>
	</div>

	<div class="bg">
		<div class="detailbg">

			<div class="slick">
				<%
				for (int i=0;i<spotlist.size();i++) {
					TourSpotDto TourSpotDto = spotlist.get(i);
					//System.out.println(dto.getName());
				%>
				<div class='list-box'>
					<div class="t-order">
						<p><%=i+1 %></p>
					</div>					
					<div class='image-box1'>
						<img alt="" src="<%=root %>/jeju/<%=TourSpotDto.getPhoto()%>" class="spotimg" seq="<%=TourSpotDto.getSeq()%>" num=<%=i+1 %>>
						<p class="photoname"><%=TourSpotDto.getName()%></p>
					</div>
				</div>
				<%
				}
				%>
			</div>
<%
				for (int i = 0; i < 1; i++) {
					TourSpotDto TourSpotDto = spotlist.get(i);
					//System.out.println(dto.getName());
				%>
			<div class='box-style'>
				<div class='box-in-style' id="detailcontent">
					<div class="title">
						<div>
							<div class="tnum">
								<p><%=i+1 %></p>
							</div>
							<p><%=TourSpotDto.getName() %></p>
						</div>
						<div>
							<div class="taddr">
								<p>주소: <%=TourSpotDto.getAddr() %></p>
								&nbsp;
								<p>|</p>
								&nbsp;
								<p>hp: <%=TourSpotDto.getHp() %></p>
							</div>
						</div>
					</div>

					<div class='img-box'>
						<img alt="" src="<%=root %>/jeju/<%=TourSpotDto.getPhoto()%>">
					</div>
					<div class="text-box">
						<p><%=TourSpotDto.getIntro() %></p>
					</div>
					<div class='tag-box'>
						<p>#<%=TourSpotDto.getArea() %></p>
						<p>#<%=TourSpotDto.getTheme() %></p>
						<p>#<%=TourSpotDto.getMain_cat() %></p>
						<p>#<%=TourSpotDto.getSub_cat() %></p>
					</div>
				</div>
			</div>
		
<%				}
				%>
		</div>
	</div>
	<script type="text/javascript">
		/* $('.slick').slick(); */

		$(function() {
			$('.slick').slick({
				dots : false, // 하부 button, 누를 시 해당 사진으로 이동하는 버튼  
				infinite : false,
				speed : 300, // 움직이는 속도
				slidesToShow : 4, // 한페이지에 보여지는 사진 갯수
				slidesToScroll : 1, // 버튼 눌렀을 시에 넘어가는 사진 갯수
				arrow : false,
				prevArrow : "<button type='button' class='slick-prev pull-left'></button>",
				nextArrow : "<button type='button' class='slick-next pull-right'></button>"
			});
		

		$(".heartBtn").click(function() {
			var name = $(this).attr("name");
			var loginok="<%=loginok%>";
			/* alert(loginok); */
			if(loginok=="null") {
				var confirmLogin = confirm("로그인이 필요한 페이지입니다. 로그인하시겠습니까?");
				if (confirmLogin) {
					// 사용자가 확인을 클릭한 경우 로그인 페이지로 이동
					window.location.href = "index.jsp?main=recomCourse/recomLoginForm.jsp?name="+name;
				} else {
					// 사용자가 취소를 클릭한 경우 현재 페이지에 머물도록 함
				} s
			} else {
				if($(this).find(".bi-heart")){
					$(this).find("i").removeClass("bi-heart");
					$(this).find("i").addClass("bi-heart-fill");
				} else {
					$(this).find("i").addClass("bi-heart");
					$(this).find("i").removeClass("bi-heart-fill");
				}
				/* location.href="likesAjax.jsp?name="+name; */
			} 
		});
		
		});
		var previousClickedElement = null;

		$("img.spotimg").click(function() {
			var seq = $(this).attr("seq");
			var num = $(this).attr("num");
			
			 
				var currentClickedElement = $(this);

				// 이전 클릭된 요소와 현재 클릭된 요소의 값을 비교
				if (previousClickedElement !== null && previousClickedElement[0] !== currentClickedElement[0]) {
				// 이전 클릭된 요소와 현재 클릭된 요소의 값이 다를 때 class 제거
				previousClickedElement.removeClass("img-boxclick");
				}

				// 현재 클릭된 요소에 class 추가
				currentClickedElement.addClass("img-boxclick");

				// 현재 클릭된 요소를 이전 클릭된 요소로 설정
				previousClickedElement = currentClickedElement;
				
			
			
			/* $(this).parent().parent().find(".image-box1").addClass("img-boxclick"); */
			// alert(seq);
			// alert(num);

			$.ajax({
				type:"post",
				dataType:"json",
				url:"<%=root%>/recomCourse/detailAjax.jsp",
				data:{"seq":seq,"num":num},
				success:function(data){
					// alert(data.seq);
					
					var s="<div class='title'>";
					s+="<div>";
					s+="<div class='tnum'>";
					s+="<p>"+data.num+"</p>";
					s+="</div>";
					s+="<p>"+data.name+"</p>";
					s+="</div>";
					s+="<div>";
					s+="<div class='taddr'>";
					s+="<p>주소: "+data.addr+"</p>&nbsp;";
					s+="<p>|</p>&nbsp;";
					s+="<p>hp: "+data.hp+"</p>";
					s+="</div>";
					s+="</div>";
					s+="</div>";
					s+="<div class='img-box'>";
					s+="<img alt='' src='<%=root%>/jeju/"+data.photo+"'>";
					s+="</div>";
					s+="<div class='text-box'>";
					s+="<p>"+data.intro+"</p>";
					s+="</div>";
					s+="<div class='tag-box'>";
					s+="<p>#"+data.area+"</p>";
					s+="<p>#"+data.theme+"</p>";
					s+="<p>#"+data.main_cat+"</p>";
					s+="<p>#"+data.sub_cat+"</p>";
					s+="</div>";

					$("#detailcontent").html(s); 
				}

			});

		});

	</script>

</body>
</html>