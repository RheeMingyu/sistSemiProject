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
<script>
$(function(){
	$("img.image").click(function(){
		$("#fileInput").trigger("click");
	})
	
})

function readURL(input){
	if(input.files&&input.files[0]){
		var reader=new FileReader();
		reader.onload = function(e){
			$('#showing').attr('src',e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
<title>Insert title here</title>
</head>

<body>
	<form action="tourReview/tourReviewFormAction.jsp" method="post"
		enctype="multipart/form-data">
		<table class="table table-bordered"
			style="width: 1000px; height: 400px;">
			<tr>
			
				<td>
				<!--<label for="fileInput" style="cursor: pointer;">--> 
				 
				<img src="" alt="" id="showing" class="image"
						style="position:absolute;";>
				<input type="file" class="fileInput" name="fileInput" id="fileInput"	style="visibility: hidden;" onchange="readURL(this)">
			
					<!--</label>-->
				<input class="form-control me-2" type="text"
					style="width: 120px;
					placeholder="비밀번호">
					
				
					<button class="btn btn-primary" type="button"
						style="margin-top: 10px; background-color: #696969; border-color: #696969;">등록</button>
				
				</td>
					
				<td colspan="4">
				<input class="form-control me-2" type="text"
					style="width: 120px; margin-left:800px;"; 
					placeholder="닉네임">
				<textarea
						style="width: 1100px; height: 150px; margin-left: 10px"
						name="content" required="required" class="form-control"></textarea>
				</td>
				<td colspan="4" style="text-align: right;">
					<button type="submit" class="btn btn-outline-info button"
						style="width: 100px; height: 40px; margin-top: 10px; margin-left: 1200px;">등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>