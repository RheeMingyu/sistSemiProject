<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

span * {
    font-family: 'OAGothic-ExtraBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/OAGothic-ExtraBold.woff2') format('woff2');
    font-style: normal;
}


#ttop {
	margin-top: -18px;
	height: 80px;
	width: 1690px;
	background-color: white;
}

.topmenu {
	text-decoration: none;
	color: #696969;
	display: block;
	font-size: 20px;
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 30px;
}

.submenu a{
	text-decoration: none;
	color: #696969;
	display: block;
	font-size: 20px;
	font-family: 'Jeju Gothic', sans-serif;
	margin-top: 30px;
}
	
#ttop ul li {
	list-style: none;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
}

.submenu{
	height: 0;
	overflow: hidden;
}

#ttop:hover .submenu {
  height: 250px;
  transition-duration: 1s;
  }
  
.slider{
    width: 640px;
    height: 480px;
    margin: 0 auto;
    top: 700px;
}
.slider input[type=radio]{
    display: none;
}

ul.imgs{
    padding: 0;
    margin: 0;
}
ul.imgs li{
/* 슬라이드가 겹쳐서 모여야 하므로 absolute 속성으로 배치 */
    opacity: 0; /* 체크한 라디오박스 순서의 슬라이드만 표시되도록 기본 투명도 설정 */
    list-style: none;
    padding: 0;
    margin: 0;
}

.bullets{
    position: absolute;
    left: 150px; /* 가로로 가운데 정렬 */
    top: -100px;
    transform: translateX(-50%);
    z-index: 997; /* 슬라이드 위에 보이도록 레이어 순위를 높임 */
}
.bullets label{
    display: inline-block; /* 한 줄로 불릿 나열*/
    border-radius: 50%; /* 원형 불릿으로 처리 */
    background-color: rgba(0,0,0,0.55);
    width: 20px; /* 불릿 너비 */
    height: 20px; /* 불릿 높이 */
    cursor: pointer;
}

.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(5):checked~.bullets>label:nth-child(5){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(6):checked~.bullets>label:nth-child(6){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(7):checked~.bullets>label:nth-child(7){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(8):checked~.bullets>label:nth-child(8){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(9):checked~.bullets>label:nth-child(9){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(10):checked~.bullets>label:nth-child(10){
    background-color: #fff;
}

.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(5):checked~ul.imgs>li:nth-child(5){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(6):checked~ul.imgs>li:nth-child(6){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(7):checked~ul.imgs>li:nth-child(7){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(8):checked~ul.imgs>li:nth-child(8){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(9):checked~ul.imgs>li:nth-child(9){
    opacity: 1;
    z-index: 998;
}
.slider input[type=radio]:nth-child(10):checked~ul.imgs>li:nth-child(10){
    opacity: 1;
    z-index: 998;
}

ul.imgs li{
    position: absolute;
    opacity: 0;
    list-style: none;
    padding: 0;
    margin: 0;
}

@font-face {
    font-family: 'Cafe24Supermagic-Bold-v1.0';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/Cafe24Supermagic-Bold-v1.0.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

</style>

<script>
	$(function(){
		
		$("#ttop").mouseover(function(){
			$(".dv1").css("height","400px").css("background-color","#F5F5F5").css("transition","all 0.5s ease-in-out")
		});
		
		$("#ttop").mouseout(function(){
			$(".dv1").css("height","0px").css("background-color","white").css("transition","all 0.5s ease-in-out")
		});
		
		$("#slide1").click(function(){
			$(".dv2").css("background-color","#90CAF9").css("z-index","2")
			$(".dv3").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv10").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide2").click(function(){
			$(".dv3").css("background-color","#B2DFDB").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv10").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide3").click(function(){
			$(".dv4").css("background-color","#FFECB3").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv3").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv10").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide4").click(function(){
			$(".dv5").css("background-color","#80DEEA").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv3").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv10").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide5").click(function(){
			$(".dv6").css("background-color","#FFF59D").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv3").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv10").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide6").click(function(){
			$(".dv7").css("background-color","#E0E0E0").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv3").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv10").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide7").click(function(){
			$(".dv8").css("background-color","#80CBC4").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv3").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv10").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide8").click(function(){
			$(".dv9").css("background-color","#D7CCC8").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv3").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv10").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide9").click(function(){
			$(".dv10").css("background-color","#B3E5FC").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv3").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv11").css("z-index","0")
		})
		
		$("#slide10").click(function(){
			$(".dv11").css("background-color","#A5D6A7").css("z-index","2")
			$(".dv2").css("z-index","0")
			$(".dv3").css("z-index","0")
			$(".dv4").css("z-index","0")
			$(".dv5").css("z-index","0")
			$(".dv6").css("z-index","0")
			$(".dv7").css("z-index","0")
			$(".dv8").css("z-index","0")
			$(".dv9").css("z-index","0")
			$(".dv10").css("z-index","0")
		})
		
		$("#im1").mouseover(function(){
			$("#im1").css("width","49%").css("transition","0.5s ease-in-out")
			$("#im2").css("width","16.3%").css("transition","0.5s ease-in-out")
			$("#im3").css("width","16.3%").css("transition","0.5s ease-in-out")
			$("#im4").css("width","16.3%").css("transition","0.5s ease-in-out")
		})
		
		$("#im2").mouseover(function(){
			$("#im2").css("width","49%").css("transition","0.5s ease-in-out")
			$("#im1").css("width","16.3%").css("transition","0.5s ease-in-out")
			$("#im3").css("width","16.3%").css("transition","0.5s ease-in-out")
			$("#im4").css("width","16.3%").css("transition","0.5s ease-in-out")
		})
		
		$("#im3").mouseover(function(){
			$("#im3").css("width","49%").css("transition","0.5s ease-in-out")
			$("#im1").css("width","16.3%").css("transition","0.5s ease-in-out")
			$("#im2").css("width","16.3%").css("transition","0.5s ease-in-out")
			$("#im4").css("width","16.3%").css("transition","0.5s ease-in-out")
		})
		
		$("#im4").mouseover(function(){
			$("#im4").css("width","49%").css("transition","0.5s ease-in-out")
			$("#im1").css("width","16.3%").css("transition","0.5s ease-in-out")
			$("#im2").css("width","16.3%").css("transition","0.5s ease-in-out")
			$("#im3").css("width","16.3%").css("transition","0.5s ease-in-out")
		});
		
	});
	

</script>
</head>
<body>

<header>
<div class="dv1" style="position: fixed; z-index:999; height: 0px; background-color: white">
	<nav id="ttop" style="">
	<ul class="t1">
		<li><img src="jeju/ㄹㄹ.png" style="width: 130px; height: 80px; margin-left: 40px;"></li>
		<li><a href="#" class="topmenu" style="width: 200px; margin-left: 100px;">ABOUT 제주</a>
			<ul class="submenu">
			<a href="" style="font-size: 15px;">제주 소개</a>
			<a href="" style="font-size: 15px;">교통편</a>
			</ul>
		</li>
		<li><a href="#" class="topmenu" style="width: 150px; margin-left: 10px;">추천 코스</a>
			<ul class="submenu">
			<a href="" style="font-size: 15px;">테마</a>
			<a href="" style="font-size: 15px;">지역</a>
			</ul></li>
		<li><a href="#" class="topmenu" style="width: 150px; margin-left: 20px;">나만의 코스</a></li>
		<li><a href="#" class="topmenu" style="width: 150px; margin-left: 10px;">리뷰</a>
			<ul class="submenu">
			<a href="" style="font-size: 15px;">코스 리뷰</a>
			<a href="" style="font-size: 15px;">관광지 리뷰</a>
			</ul>
		</li>
		<li><a href="#" class="topmenu" style="width: 150px; margin-left: 5px;">이벤트</a>
			<ul class="submenu">
			<a href="" style="font-size: 15px;">진행중 이벤트</a>
			<a href="" style="font-size: 15px;">종료 이벤트</a>
			</ul>
		</li>
		<li><a href="#" class="topmenu" style="width: 150px; margin-left: 25px;">마이페이지</a>
			<ul  class="submenu">
			<a href="" style="font-size: 15px;">나의 정보</a>
			<a href="" style="font-size: 15px;">MYLIST</a>
			</ul>
		</li>
	</ul>
	 <form class="d-flex">
        <input class="form-control me-2" type="text"  style="width: 120px; margin-left: 150px; margin-top: 20px;" placeholder="Search">
        <button class="btn btn-primary" type="button" style="margin-top: 20px; background-color: #696969; border-color: #696969;">Search</button>
      </form>
	</nav>
</div>
</header>

<div class="dv2" style="position: absolute; z-index: 1; background-color: #90CAF9; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 180px; height: 30px; font-weight: 300;">제주 숨은 물놀이 맛집</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">여름 더위는 여기서
	<pre>[함덕 해수욕장]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv3" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주의 랜드마크</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">자연이 만든 신비
	<pre>[한라산]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv4" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주 속 해수욕장</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">한국의 하와이
	<pre>[금농 해수욕장]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv5" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주 속 숨은 섬</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">섬 안에 또 다른 섬
	<pre>[우도]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv6" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주 포토 스팟</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">봄 냄새 물씬, 노란 빛
	<pre>[유채꽃 축제]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv7" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주의 모든 것</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">제주의 모든 것!
	<pre>[국립 제주 박물관]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv8" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주 WALK</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">걷다 보면 만나는 아름다움
	<pre>[한담마을]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv9" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주 BREATH</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">숲의 맑은 공기로 ReFresh!
	<pre>[사려니숲]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv10" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주의 바다빛</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">바다빛 향연
	<pre>[협재 해수욕장]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div class="dv11" style="position: absolute; z-index: 0; height: 560px; top: 78px; width: 1690px;">
	<span style= "position: absolute; border-radius:20px 20px 20px 0px; padding-left:8px; background-color: black; color: white; padding-top: 3px; margin-left: 380px; margin-top: 150px; width: 140px; height: 30px; font-weight: 300;">제주 WALK</span>
	<span style= "position: absolute; padding-left:8px; color: #424242; padding-top: 5px; margin-left: 380px; margin-top: 230px; font-weight: 800;font-size: 35px;">올레길 걸으러 올래?
	<pre>[올레길]<pre><a href="" style="font-weight: 300; font-size: 14px; text-decoration: underline; color: #757575">자세히 보기</a>
	</span>
</div>

<div  class="slider" style="position: relative;">
 	<input type="radio" name="slide" id="slide1" checked>
    <input type="radio" name="slide" id="slide2">
    <input type="radio" name="slide" id="slide3">
    <input type="radio" name="slide" id="slide4">
    <input type="radio" name="slide" id="slide5">
    <input type="radio" name="slide" id="slide6">
    <input type="radio" name="slide" id="slide7">
    <input type="radio" name="slide" id="slide8">
    <input type="radio" name="slide" id="slide9">
    <input type="radio" name="slide" id="slide10">
    <ul id="imgholder" class="imgs">
        <li><img src="jeju/hamduk.png" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/halla.jpg" style="position: absolute;  border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/geumnong.jpg" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/woodo.jpg" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/yuchae.jpg" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/museum.jpg" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/handam.jpg" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/forest.jpg" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/hyupjae.jpg" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
        <li><img src="jeju/olleh.jpg" style="position: absolute; border-radius: 10px 10px; width: 820px; height: 550px; right: -1165px; top: -550px;"></li>
    </ul>
    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
        <label for="slide4">&nbsp;</label>
        <label for="slide5">&nbsp;</label>
        <label for="slide6">&nbsp;</label>
        <label for="slide7">&nbsp;</label>
        <label for="slide8">&nbsp;</label>
        <label for="slide9">&nbsp;</label>
        <label for="slide10">&nbsp;</label>
    </div>
</div>

<div class="dv12" style="width: 845px; height: 20px; margin-top: 300px; margin-left: 380px;">
	<img src="jeju/whale.png" style="width: 40px; height: 40px;">
	<span style="color: #1976D2; font-weight: 800; vertical-align: middle;">제주하다 PICK! ||</span>
	<span style="font-size:35px; font-weight: 800; color: #2962FF; vertical-align: middle;"><b style="font-family: 'Cafe24Supermagic-Bold-v1.0'">제주도 대표 관광지</b></span>
</div>

<div class="dv13" style="position: absolute; width: 1000px; height: 400px; margin-top: 40px; margin-left: 350px;">
	<ul>
			<img src="jeju/aquaplanet.jpg" style="width: 24.5%; height: 300px; cursor: pointer;" id="im1">
			<img src="jeju/manjang.jpg" style="width: 24.5%; height: 300px; cursor: pointer;" id="im2">
			<img src="jeju/sungsan.jpg" style="width: 24.5%; height: 300px; cursor: pointer;" id="im3">
			<img src="jeju/racing.png" style="width: 24.5%; height: 300px; cursor: pointer;" id="im4">
	</ul>
</div>


	
</body>
</html>