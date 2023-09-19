<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}

body {
	min-height: 100vh;
	background-image: url('jeju/update.JPG');
	background-size: 100% 100%;

}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

div.container {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.0);
	margin-left: 400px;
	margin-top: 100px;
}
</style>
</head>
<%
String root =request.getContextPath();

//로그인 시키기
String loginok = (String)session.getAttribute("loginok");

//아이디 얻기
String myid = (String)session.getAttribute("myid");

String id=request.getParameter("id");

//String id =request.getParameter("id");
MemberDto dto = new MemberDto();
MemberDao dao = new MemberDao();
dto = dao.getData(id);

//memberDto dto = new memberDto();


%>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">
				회원정보 수정
				</h4>
				<hr>
				<form class="validation-form" novalidate action="myPage/updateProc.jsp"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="id" value="<%=id %>">
					<div class="row">
						
						<!-- https://iamiet.tistory.com/68 이 사람 블로그에 더 자세한거 있음. -->
						<label for="profile">프로필사진</label>
						<div class="col-md-6 mb-3" id="profile1"
						style="border: 1px solid gray; width: 150px; height: 170px; margin-left: 15px; border-radius:10px;">
						<img src="<%=root %>/save/<%=dto.getProfile() %>" class="rounded-circle" width="140" height="165">
						</div>
						<br>
						<div class="col-md-6 mb-3">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="file" class="form-control" name="profile"
							id="profile" accept="image/*" style="width: 250px;">	
							<!-- 선택한 이미지 파일을 저장하는 숨겨진 입력 필드 -->
						</div>

						<!-- fix : 중복안되게 수정 -->
						<div class="col-md-6 mb-3">
							<label for="id">아이디&nbsp;</label><i class="bi bi-check-all"
								id="btncheck" style="font-size: 1.2em; cursor: pointer;"></i> 
								<input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력하세요"
								 value="<%=dto.getId() %>" required="required"> <span
								class="idsuccess"> </span>
							<div class="invalid-feedback">아이디를 입력하세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" name="name" id="name"
								placeholder="이름을 입력하세요" value="<%=dto.getName() %>" required="required">
							<div class="invalid-feedback">아이디를 입력하세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="gender">성별</label> 
								<select
								class="custom-select d-block w-100" id="gender" name="gender">
								<option>남</option>
								<option>여</option>
							</select>
						</div>

						<div class="col-md-6 mb-3">
							<label for="age">나이</label> <input type="text"
								class="form-control" name="age" id="age" placeholder="나이"
								value="<%=dto.getAge() %>" required="required">
							<div class="invalid-feedback">나이를 입력하세요.</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="mbti">MBTI</label> <input type="text"
								class="form-control" name="mbti" id="mbti"
								placeholder="MBTI를 입력하세요" value="<%=dto.getMbti() %>" required="required">
							<div class="invalid-feedback">MBTI를 입력하세요.</div>
						</div>

					</div>

					<div class="mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" name="email" id="email"
							placeholder="your@example.com" required="required" value="<%=dto.getEmail() %>">
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" name="area" id="area" placeholder="서울특별시"
							required="required" value="<%=dto.getArea() %>">
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="hp">전화번호</label> <input type="text"
							class="form-control" name="hp" id="hp"
							placeholder="010-1234-5678" required="required" value="<%=dto.getHp() %>">
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<hr class="mb-4">
					<div class="mb-4"></div>
					<button class="btn" data-bs-toggle="button" type="submit" style="width:220px; margin-left:190px;"> 나의정보 수정하기</button>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; Sist 2조</p>
		</footer>
	</div>


	<script>
  	/* 입력란이 required 들어간게 안들어가면 회원가입 안되게 유효성검사 */
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
   </script>

	<script>
   
   	//회원가입시 아이디 중복체크 로직
    $("#btncheck").click(function(){
		var id = $("#id").val();
		var id1 = $("span.idsuccess").text();
		//alert(id);
		
		//중복체크 없이 id를 만들어서 회원가입 버튼 누르면 안되게 끔 만들어야함
		
		if(id1=="사용가능한 아이디 입니다.") {
			
		}
		
		$.ajax({
			type : "get",
			url : "member/IdSearch.jsp",
			dataType : "json",
			data : {"id":id},
			success:function(data) {
				
				if(data.count==1) {
					$("span.idsuccess").text("중복된 아이디가 있습니다.");
					$("#id").val("");
				} else {
					$("span.idsuccess").text("사용가능한 아이디 입니다.");
				}
			}
		}); 
	
	}); 
   	
// 파일을 선택하면 프로필 사진 미리보기를 업데이트하는 메서드
$("#profile").change(function() {
    // 파일 인풋에서 선택한 파일 가져오기
    var file = this.files[0];
    
    // 이미지 파일인지 확인 (예: jpg, jpeg, png, gif 등)
    if (file && /\.(jpe?g|png|gif)$/i.test(file.name)) {
        var reader = new FileReader();
        
        reader.onload = function(e) {
            // 선택한 파일을 이미지로 표시하기
            $("#profile1").html('<img src="' + e.target.result + '" alt="프로필 이미지" style="width: 140px; height: 160px; border-radius:10px;">');
        };
        
        // 파일을 읽어오기
        reader.readAsDataURL(file);
    } else {
        alert("올바른 이미지 파일을 선택하세요 (jpg, jpeg, png, gif).");
        $("#profile").val(""); // 파일 선택을 초기화
        $("#profile1").html(""); // 미리보기 삭제
    }
});

   	</script>
</body>

</html>