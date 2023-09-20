<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<style>
@font-face {
    font-family: 'EF_jejudoldam';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-EF@1.0/EF_jejudoldam.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'establishRoomNo703OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/establishRoomNo703OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.div1{
	position: absolute;
	left: 350px;
	top: 200px;
}

.span1{
	position: absolute;
	left: 350px;
	top: 150px;
	width: 500px;
}

.span2{
	position: absolute;
	left: 350px;
	top: 750px;
	width: 180px;
	height: 40px;
	cursor: pointer;
	background: linear-gradient(to top, #B3E5FC 40%, transparent 60%);
}

.div2{
	position: absolute;
	left: 350px;
	top: 800px;
	width: 1000px;
	background-color: #F5F5F5;
}

.span3{
	position: absolute;
	left: 350px;
	top: 900px;
	width: 350px;
	height: 40px;
	cursor: pointer;
	background: linear-gradient(to top, #B3E5FC 40%, transparent 60%);
}


.div3{
	position: absolute;
	left: 350px;
	top: 950px;
	width: 1000px;
	background-color: #F5F5F5;
}

.span4{
	position: absolute;
	left: 350px;
	top: 1170px;
	width: 560px;
	height: 40px;
	cursor: pointer;
	background: linear-gradient(to top, #B3E5FC 40%, transparent 60%);
}

.div4{
	position: absolute;
	left: 350px;
	top: 1230px;
	width: 600px;
}

#jejuair, #sklental, #socar, #yanolja, #yugiuhtte {
	width: 60px;
	height: 30px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".div2").hide();
		$(".div3").hide();
		$(".div4").hide();
		
		$(".span2").click(function(){
			$(".div2").toggle("slow");
		});
		
		$(".span3").click(function(){
			$(".div3").toggle("slow");
		});
		
		$(".span4").click(function(){
			$(".div4").toggle("slow");
		});
		
		$("#jejuair").click(function(){
			window.open("https://www.jejuair.net")
		});
		
		$("#sklental").click(function(){
			window.open("https://www.skcarrental.com")
		});
		
		$("#socar").click(function(){
			window.open("https://www.socar.kr")
		});
		
		$("#yanolja").click(function(){
			window.open("https://www.yanolja.com")
		});
		
		$("#yugiuhtte").click(function(){
			window.open("https://www.goodchoice.kr")
		});
		
	});
</script>
<body>

	<span class="span1"><h2 style="	font-family: 'EF_jejudoldam';">제주도를 소개합니다:)</h2></span>
	
<div class="div1">
	<img src="jeju/introduce.png" style="width: 1000px; height: 500px;">
</div>

	<span class="span2"><h2 style="	font-family: 'EF_jejudoldam';">제주도는요,</h2></span>
	
<div class="div2">
	<h4 style="	font-family: 'establishRoomNo703OTF';">제주도는 3면이 바다로 둘러 쌓여 어느 곳에서든 바다의 아름다움과 자연이 만든 경치를 즐길 수 있는 곳입니다.<pre></pre>
	산과 바다, 자연이 어우러진 아름다운 섬나라, 제주도에서의 행복한 시간을 <b>제주하다</b>와 함께 하세요♡
	</h4>
</div>

	<span class="span3"><h2 style="	font-family: 'EF_jejudoldam';">제주도의 자랑거리는요,</h2></span>
	
<div class="div3">
	<h4 style="	font-family: 'establishRoomNo703OTF';"><b style="color: #A1887F;">관광지</b><pre></pre>
	제주도에는 15개가 넘는 해수욕장과 한라산, 성산일출봉, 우도 등이 있어 다양한 테마의 여행을 즐길 수 있습니다.<pre></pre>
	<b style="color: #A1887F;">음식</b><pre></pre>
	제주 은갈치, 연돈, 제주 흑돼지 등 여행객들의 배를 채워줄 맛집들이 많습니다. 배꼽시계가 울리지 않는, 제주에서의 식도락 여행을 즐겨보세요.
	</h4>
</div>
	
	<span class="span4"><h2 style="	font-family: 'EF_jejudoldam';">제주도 교통편 및 숙박 예약 바로가기</h2></span>
	
<div class="div4">
	<img src="jeju/jejuair.png" id="jejuair">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="jeju/sklental.png" id="sklental">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="jeju/socar.png" id="socar">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="jeju/yanolja.png" id="yanolja">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<img src="jeju/yugiuhtte.png" id="yugiuhtte">
</div>
	
</body>
</html>