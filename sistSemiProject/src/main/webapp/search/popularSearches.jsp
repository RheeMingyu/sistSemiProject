<%@page import="java.util.List"%>
<%@page import="data.dao.PopularSearchesDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

	@font-face {
    	font-family: 'OAGothic-ExtraBold';
    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/OAGothic-ExtraBold.woff2') format('woff2');
    	font-style: normal;
	}

	#shape{
		margin: 40px 20px 40px 20px;
		background-color: #EEEEEE;
		padding: 15px 15px 15px 15px;
	}
	div.subject,span.pspan{
		cursor: pointer;
	}
	div.list,div.select,button.btn-success{
		display: none;
	}
	div.ptop{
		font-size: 1.3em;
		margin-bottom: 12px;
	}
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

	body * { 
		font-family: 'Jeju Gothic', sans-serif;
	}
</style>
<script>
	$(function(){
		
		$(subjectDivs[0]).click(function(){
			showList(0);
			console.log("작동완");
		});
		$(subjectDivs[1]).click(function(){
			showList(1);
		});
		$(subjectDivs[2]).click(function(){
			showList(2);
		});
		$(subjectDivs[3]).click(function(){
			showList(3);
		});
		$("i.pback").click(function(){
			hideList();
		});
		
		$(buttonDivs[0]).on("click",function(){
			var age_v=$("#age").val();
			var s="<ol>";
			$.ajax({
				type:"get",
				data:{"age":age_v},
				url:"search/ageListProc.jsp",
				dataType:"json",
				success:function(res){
					$.each(res, function(i,e){s+="<li>"+e+"</li>";});
					s+="</ol>";
					$(listDivs[0]).html(s);
				}
			});
			$("button.cancel").trigger("click");
		});
		$(buttonDivs[1]).on("click",function(){
			var mbti_v=$("#mbti").val();
			var s="<ol>";
			$.ajax({
				type:"get",
				data:{"mbti":mbti_v},
				url:"search/mbtiListProc.jsp",
				dataType:"json",
				success:function(res){
					$.each(res, function(i,e){s+="<li>"+e+"</li>";});
					s+="</ol>";
					$(listDivs[1]).html(s);
				}
			});
			$("button.cancel").trigger("click");
		});
		$(buttonDivs[2]).on("click",function(){
			var gender_v=$("#gender").val();
			var s="<ol>";
			$.ajax({
				type:"get",
				data:{"gender":gender_v},
				url:"search/genderListProc.jsp",
				dataType:"json",
				success:function(res){
					$.each(res, function(i,e){s+="<li>"+e+"</li>";});
					s+="</ol>";
					$(listDivs[2]).html(s);
				}
			});
			$("button.cancel").trigger("click");
		});
		$(buttonDivs[3]).on("click",function(){
			var gender_v=$("#gender").val();
			var s="<ol>";
			$.ajax({
				type:"get",
				data:{"gender":gender_v},
				url:"search/areaListProc.jsp",
				dataType:"json",
				success:function(res){
				    $.each(res, function(i,e){s+="<li>"+e+"</li>";});
					s+="</ol>";
					$(listDivs[3]).html(s);
				}
			});
			$("button.cancel").trigger("click");
		});
	});
	
	var subjectDivs = document.getElementsByClassName("subject");
	
	var listDivs = document.getElementsByClassName("list");
	var selectDivs = document.getElementsByClassName("select");
	var buttonDivs = document.getElementsByClassName("attrsubmit");
	var currentlyDisplayedList = null;
	var currentlyDisplayedSelect = null;
	var currentlyDisplayedButton = null;
	
	function showList(index) {
	
		// Hide the currently displayed list
		if (currentlyDisplayedList !== null) {
		currentlyDisplayedList.style.display = "none";
		}
		if (currentlyDisplayedList !== null) {
		currentlyDisplayedSelect.style.display = "none";
		}
		if (currentlyDisplayedList !== null) {
		currentlyDisplayedButton.style.display = "none";
		}
			  
		// Show the selected list
		listDivs[index].style.display = "block";
		currentlyDisplayedList = listDivs[index];
		selectDivs[index].style.display = "block";
		currentlyDisplayedSelect = selectDivs[index];
		buttonDivs[index].style.display = "block";
		currentlyDisplayedButton = buttonDivs[index];
		
		$("button.modalopen").trigger("click");
	}
	
	function hideList() {
		currentlyDisplayedList.style.display = "none";
		currentlyDisplayedSelect.style.display = "none";
		currentlyDisplayedButton.style.display = "none";
	}
</script>
<body>
	<div id="shape">
		<div class="ptop"><b>인기 검색어</b><span class="pspan" style="float: right"><i class="bi bi-backspace-fill pback"></i></span></div>
		<div class="subject">
			<span class="cat" style="font-weight: 200; color: #9E9E9E;">나이대별</span>
		</div>
		<div class="list">
		안녕하세요
		</div>
		<div class="subject">
			<span class="cat" style="font-weight: 200; color: #9E9E9E;">mbti별</span>
		</div>
		<div class="list">
		2
		</div>
		<div class="subject">
			<span class="cat" style="font-weight: 200; color: #9E9E9E;">성별</span>
		</div>
		<div class="list">
		3
		</div>
		<div class="subject">
			<span class="cat" style="font-weight: 200; color: #9E9E9E;">지역별</span>
		</div>
		<div class="list">
		4
		</div>
	</div>
	
	<div class="container mt-3">
		<button type="button" class="btn btn-primary modalopen" data-bs-toggle="modal" data-bs-target="#myModal" style="visibility: hidden"></button>
	</div>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">선택해주세요~!</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
					<div class="select">
						<select id="age">
							<option value="10" selected>10대</option>
							<option value="20">20대</option>
							<option value="30">30대</option>
							<option value="40">40대</option>
							<option value="50">50대</option>
							<option value="60">60대 이상</option>
						</select>
					</div>
					<div class="select">
						<select id="mbti1">
							<option value="e" selected>E</option>
							<option value="i">I</option>
						</select>
						<select id="mbti2">
							<option value="n" selected>N</option>
							<option value="s">S</option>
						</select>
						<select id="mbti3">
							<option value="t" selected>T</option>
							<option value="f">F</option>
						</select>
						<select id="mbti4">
							<option value="p" selected>P</option>
							<option value="j">J</option>
						</select>
					</div>
					<div class="select">
						<select id="gender">
							<option value="male" selected>남</option>
							<option value="female">여</option>
						</select>
					</div>
					<div class="select">
						<select id="area">
							<option value="서울" selected>서울특별시</option>
							<option value="인천">인천광역시</option>
							<option value="경기">경기도</option>
							<option value="강원">강원도</option>
							<option value="충북">충청북도</option>
							<option value="충남">충청남도</option>
							<option value="광주">광주광역시</option>
							<option value="전북">전라북도</option>
							<option value="전남">전라남도</option>
							<option value="대구">대구광역시</option>
							<option value="부산">부산광역시</option>
							<option value="경북">경상북도</option>
							<option value="경남">경상남도</option>
							<option value="제주">제주도</option>
						</select>
					</div>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-success attrsubmit" id="ageBtn">제출</button>
					<button type="button" class="btn btn-success attrsubmit" id="mbtiBtn">제출</button>
					<button type="button" class="btn btn-success attrsubmit" id="genderBtn">제출</button>
					<button type="button" class="btn btn-success attrsubmit" id="areaBtn">제출</button>
					<button type="button" class="btn btn-danger cancel" data-bs-dismiss="modal">취소</button>
				</div>
			
			</div>
		</div>
	</div>
</body>
</html>