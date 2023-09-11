<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.TourSpotDto"%>
<%@page import="data.dto.CourseDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourSpotDao"%>
<%@page import="data.dao.RecomCourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


<%

// dao 호출
RecomCourseDao RecomCourseDao = new RecomCourseDao();
TourSpotDao TourSpotDao=new TourSpotDao();

String name = request.getParameter("name");

// name값을 받아서 recomCourse 출력
List<CourseDto> recomlist = RecomCourseDao.getRecomCourseName(name);

System.out.println(name);

// 받아온 CourseDto의 name값을 이용하여 tour_seq 가져오기 (RecomCourse table)
// 가져온 tour_ser를 이용하여 TourSpotDto의 자료 가져오기 (RecomCourse table -> TourSpot table)
List<TourSpotDto> spotlist=new ArrayList<TourSpotDto>();

for(int i=0;i<recomlist.size();i++){
	String tour_seq=recomlist.get(i).getTour_seq(); // 순차적으로 name에 해당하는 Tour_seq의 값을 받아온다. 
	TourSpotDto tdto= TourSpotDao.getdata(tour_seq);
	spotlist.add(tdto);
	
}

%>


<style type="text/css">
.slick{
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
	
}

.image-box1{
	border-radius: 10px;
	overflow: hidden;
	width:100%;
	aspect-ratio: 1;
	position: relative;
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
	background-image: url(../no_image/left.svg);
	background-size: 100%;
}

.slick-next:after {
	content: '';
	width: 50px;
	height: 50px;
	display: block;
	background-image: url(../no_image/left.svg);
	background-size: 100%;
	transform: scaleX(-1);
}

.photoname {
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

.box-style{
	padding: 0 20px 20px;
	box-sizing: border-box;
}


.box-in-style{
	background:#fff;
	border-radius: 10px;
	box-shadow: 2px 3px 9px 3px rgba(87,88,89,.25);
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

.title > div{
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

div.detailbg{
	width: 1200px;
	background-color: #cfcfcf;
}
div.taddr{
	display: flex;
}

.img-box{
	width: 500px;
	height: 500px;
	background:#eee;
	border-radius: 10px;
	overflow: hideen;
	margin: 30px auto;
}

.img-box > img{
	width: 100%;
	height: 100%;
}

.tag-box{
	display: flex;
	flex-wrap: wrap;
    align-items: center;
}

.tag-box > p{
	margin: 0 8px 0 0;
	font-size: 16px;
	color:#000;
}

div.text-box,div.tag-box{
	padding: 1 20px 10px 20px;

}

</style>



<title>Insert title here</title>
</head>
<body>

	<div class="detailbg">

		<div class="slick">
			<%
			for (int i = 0; i < spotlist.size(); i++) {
				TourSpotDto TourSpotDto = spotlist.get(i);
				//System.out.println(dto.getName());
			%>
			<div class='list-box'>
				<div>
				<%-- <%if() %> --%>
					<p>1일차</p> <!-- 추천코스의 day... -->
					<p>1번</p> <!-- 추천코스의 turn.. -->
				</div>
				<div class='image-box1'>
					<img alt="" src="../no_image/<%=TourSpotDto.getPhoto()%>" class="spotimg" name="<%=TourSpotDto.getSeq()%>">
					<p class="photoname"><%=TourSpotDto.getName()%></p>
				</div>
				
				
			</div>
			<%
			}
			%>
		</div>
		
		
		<div class='box-style'>
			<div class='box-in-style' id="detailcontent">
				 <div class="title">
					<div>
						<div class="tnum">
							<p>1</p>
						</div>
						<p>김녕해수욕장</p>
					</div>
					<div>
						<div class="taddr">
							<p>주소</p>&nbsp;
							<p>|</p>&nbsp;
							<p>hp</p>
						</div>
					</div>
				</div>
				
				<div class='img-box'>
					<img alt="" src="../no_image/김녕해수욕장.jpeg">
				</div>
				<div class="text-box">
					<p>내용</p>
				</div>
				<div class='tag-box'>
					<p>#area</p>
					<p>#theme</p>
					<p>#main_cat</p>
					<p>#sub_cat</p>
				</div> 
			</div>
		</div>



	</div>

	<script type="text/javascript">
 
 /* $('.slick').slick(); */
 
 $(function(){
	 $('.slick').slick({
		  dots: false, // 하부 button, 누를 시 해당 사진으로 이동하는 버튼  
		  infinite: false,
		  speed: 300, // 움직이는 속도
		  slidesToShow: 4, // 한페이지에 보여지는 사진 갯수
		  slidesToScroll: 1, // 버튼 눌렀을 시에 넘어가는 사진 갯수
		  arrow: false,
		  prevArrow:"<button type='button' class='slick-prev pull-left'></button>",
          nextArrow:"<button type='button' class='slick-next pull-right'></button>"
	
		});
	})
 
 </script>
 
 <script type="text/javascript">
	
	$("img.spotimg").click(function(){
		var seq=$(this).attr("name");
		//alert(seq);
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:"ajax.jsp",
			data:{"seq":seq},
			success:function(data){
				 alert(data.seq);
				 alert(data.addr);
				 
					var s = "<div class='title'>";
					s += "<div>";
					s += "<div class='tnum'>";
					s += "<p>1</p>";
					s += "</div>";
					s += "<p>"+data.name+"</p>";
					s += "</div>";
					s += "<div>";
					s += "<div class='taddr'>";
					s += "<p>"+data.addr+"</p>&nbsp;";
					s += "<p>|</p>&nbsp;";
					s += "<p>"+data.hp+"</p>";
					s += "</div>";
					s += "</div>";
					s += "</div>";
					s += "<div class='img-box'>";
					s += "<img alt='' src='../no_image/"+data.photo+"'>";
					s += "</div>";
					s += "<div class='text-box'>";
					s += "<p>"+data.intro+"</p>";
					s += "</div>";
					s += "<div class='tag-box'>";
					s += "<p>"+data.area+"</p>";
					s += "<p>"+data.theme+"</p>";
					s += "<p>"+data.main_cat+"</p>";
					s += "<p>"+data.sub_cat+"</p>";
					s += "</div>";
				
					
					$("#detailcontent").html(s);
				}
				
			});

		});
	</script>

</body>
</html>