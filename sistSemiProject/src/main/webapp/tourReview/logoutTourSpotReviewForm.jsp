<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.TourSpotDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourSpotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="/assets/css/star.css" rel="stylesheet" />

<% 

String seq=request.getParameter("seq");
 TourSpotDao dao = new TourSpotDao();
TourSpotDto tourspotdto=dao.getdata(seq);
List<TourSpotDto> list = dao.selectTourSpot();

String root=request.getContextPath();

%>


<title>Insert title here</title>
<script>
function openFileInput(){
	document.getElementById('image').click();
}

function readURL(input){
	if(input.files && input.files[0]){
		var reader = new FileReader();
		
		reader.onload = function(e)
		{
			$('#showing').attr('src',e.target.result);
		}
		
		reader.readAsDataURL(input.files[0]);
	}
}

/* 
$(document).ready(function(){
    $("#sel2").on("change", "select", function() {
        var selectedValue = $(this).val(); // 선택한 e.name 값
        var theme = $("#theme").val(); // 선택한 theme 값
        $.ajax({
            type: "post",
            dataType: "json",
            url: "", // 데이터를 처리할 서버 스크립트 경로
            data: {
                theme: theme,
                selectedValue: selectedValue // 전달할 데이터
            },
            success: function(response){
                // 서버로부터의 응답을 처리하는 코드 추가
            }
        });
    });
}); */

/* $(document).ready(function(){
	  $("#theme").change(function(){
	    var theme = $(this).val();
	    
	    // 서버로부터 관광지 목록을 가져오는 AJAX 요청을 수행
	    $.ajax({
	      type: "post",
	      dataType: "json",
	      url: "tourReview/logoutTourSpotReviewForm.jsp",
	      data: {theme: theme},
	      success: function(data){
	        alert("a");

	        // 관광지 목록을 받아온 후, 새로운 select 요소 생성 및 옵션 추가
	        var selDay = $("#selDay");
	        selDay.empty();
	        
	        var newSelect = $("<select>").attr("id", "newSelDay").addClass("form-select form-select-sm").css("width", "200px");
	        for(var i=0; i<data.length; i++){
	          newSelect.append('<option value="'+data[i].value+'">'+ data[i].text + '</option>');
	        }

	        // 생성한 새로운 select 요소를 삽입
	        selDay.append(newSelect);
	      }
	    });
	  });
	});
/*  $(document).ready(function(){
	$("#theme").change(function(){
		var theme=$(this).val();
		//alert(seq);
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:"tourReview/logoutTourSpotReviewForm.jsp",
			data:{theme:theme},
			success:function(data){
				  console.log("서버 응답 데이터:", data);
				 
					var selDay = $("#selDay");
					selDay.empty();
					
					for(var i=0;i<data.length;i++){
						selDay.append('<option value="'+data[i].value+'">'+ data[i].text + '</option>');
					}
				}
				
			});

		});
	})  */
</script>
</head>
<style>
.input-container {
	display: flex;
	justify-content: space-between;
	width: 200px;
}

.form-control {
	width: 100px;
}

.photo {
	cursor: pointer;
}

.select {
	display: flex;
}

@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.rate {
	display: inline-block;
	border: 0;
	margin-right: 15px;
}

.rate>input {
	display: none;
}

.rate>label {
	float: right;
	color: #ddd
}

.rate>label:before {
	display: inline-block;
	font-size: 1rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 ";
}

.rate .half:before {
	content: "\f089 ";
	position: absolute;
	padding-right: 0;
}

.rate input:checked ~ label, .rate label:hover, .rate label:hover ~
	label {
	color: #f73c32 !important;
}

.rate input:checked+.rate label:hover, .rate input input:checked ~ label:hover,
	.rate input:checked ~ .rate label:hover ~ label, .rate label:hover ~
	input:checked ~ label {
	color: #f73c32 !important;
}
</style>

<body>
	<!-- form action 수정 -->
	<form action="tourReview/logoutTourSpotReviewAction.jsp" method="post" enctype="multipart/form-data">
		<table class="table table-bordered"
			style="width: 1100px; height: 400px; margin-top: 100px; margin-left: 180px;">
			<tr>

				<td>
				<img src="<%=root %>/jeju/map.png" id="showing"
					onclick="openFileInput()" alt="" width="50px;" class="image"
					height="40px" margin-top="10px";> <input type="file"
					class="image" id="image" style="visibility: hidden;"
					onchange="readURL(this)"> 
				<div>
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i>
					<i class="bi bi-star-fill"></i>
				</div>
				


					<div class="select" style="margin-left: 200px; width: 300px;">
						<br> <select id="theme" class="form-select form-select-sm"
							style="width: 200px;">
							<option value="바다" selected>바다</option>
							<option value="산">산</option>
							<option value="올레길">올레길</option>
							<option value="섬">섬</option>
							<option value="체험">체험</option>
							<option value="음식">음식</option>
							<option value="숙박">숙박</option>
							<option value="쇼핑">쇼핑</option>
						</select> &nbsp;&nbsp;&nbsp;

						<%! 
   // JavaScript 함수 정의
   void clearSelDay() {
   %>
						<script>
						
      $("#selDay").empty();
      
		var op_val="";
      
      $("#theme").on("change",function(){
    	 var main_cat=$(this).val();
    	 var s="<select id='selDay' class='form-select form-select-sm' style='width:200px'>";
    	 $.ajax({
    		type:"get",
    		url:"tourReview/listSpot.jsp",
    		dataType:"json",
    		data:{"main_cat":main_cat},
    		success:function(res){
    			$.each(res,function(i,e){
    				s+="<option value='"+e.name+"'>"+e.name+"</option>";
    			});
    			s+="</select>";
				$("#sel2").html(s);
				
				$("#selDay").on("change",function(){
			    	   op_val=$(this).val();
			    	   alert(op_val);
			    	   "<input type='hidden' name='op_val'>"
			    	   /* $(".h").attr("value",op_val); */
			    	   console.log(op_val);
			    	});
    		}
    	 });
      });
      
      
    
	/*  
		$("#selDay").change(function(){
			var s=$("#selDay option:selected").val();
			alert(s);
	*/
      
      //값을 hidden 처리해서 넘겨서 action처리하는 jsp로 넘겨서 action처리
   </script>
						<%!
   }
%>
						<!-- <select id="selDay" class="form-select form-select-sm" style="width:200px;"> -->
						<%
						/* for(int i=0;i<list.size();i++)
							{
							 String theme=request.getParameter("theme");
							  System.out.println(theme+"테마"); 
							 TourSpotDto tourSpotDto = list.get(i);
								System.out.println(tourSpotDto.getMain_cat());
							if(tourSpotDto.getMain_cat().equals(theme)){
								
							clearSelDay(); */
						%>

						<div id="sel2"></div>
						<%-- <option value="<%=tourSpotDto.getName() %>"><%=tourSpotDto.getName() %></option> --%>
						<%
						{
						}
						%>

						</select>
					</div>

					<div class="input-container" style="margin-left: 818px; width: 300px;">
						<input class="h" type="hidden" name="seq" value=""> <br>
						<input class="form-control me-2" name="nickname" type="text" style="width: 120px;" required="required" placeholder="닉네임">&nbsp;&nbsp;
						<input class="form-control me-2" name="pass" type="password" style="width: 120px;" required="required" placeholder="비밀번호">
						<br>
					</div>
					<br>
					<input type="text" name="title" class="form-control" style="width: 1100px; margin-left: 10px" required="required" placeholder="제목">
					<br>
					<textarea style="width: 1100px; height: 150px; margin-left: 10px" name="content" required="required" class="form-control" placeholder="리뷰를 작성해주세요"></textarea>
					<button class="btn btn-primary" type="submit" style="margin-top: 10px; margin-left: 1052px; background-color: #696969; border-color: #696969;">등록</button>
				</td>
			</tr>
		</table>
	</form>

</body>

</html>