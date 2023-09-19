<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
div.info0 {
	width : 750px;
	height : 150px;
	margin-left:50px;
	border-radius: 20px; /* 원하는 둥글기 정도 설정 */
  	background-color: white; /* 배경색 지정 */
    padding: 20px; 
    margin-top:50px;
}

div.info1 {
	position : relative;
	border : 1px solid gray;
	width : 850px;
	height : 300px;
	border-radius: 10px; /* 원하는 둥글기 정도 설정 */
	padding: 20px; 

}

div.profile {
	margin-right: 600px;	
	margin-top : 20px;
}

div.line {	
  position: absolute;
  border-left: 1px solid gray;
  height : 300px;
  margin-left: 220px; /* 수정: margin-left 값 조정 */
  top: 0px; /* 수정: top 값 추가 */
}

button.btn1 {
	margin-left:700px;
	margin-bottom:100px;
}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}




</style>
<%
String root=request.getContextPath();

String pass=request.getParameter("pass");

MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllData();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

//로그인 세션
String loginok = (String)session.getAttribute("loginok");

//아이디 얻기
String myid = (String)session.getAttribute("myid");
%>
	<!-- 
	info1 -> 기본정보
	info2 -> 연락처 정보
	info3 -> 여행지 리스트 출력 
	
	맨 아래 회원탈퇴 버튼 눌르기.
	 -->
	 <%
	 for(MemberDto dto:list) {
		 if(loginok!=null && myid.equals(dto.getId())) {
	 %>
	 <input type="hidden" name="pass" value="<%=pass %>">
	<br><br>
	<div class="info0">
		<h2><b>개인정보</b></h2>
		<br>
		<h4 style="font-size:18px;">다양한 <b>Jeju 하다</b> 서비스에서 사용되는 나와 내 환경설정에 관한 정보입니다.</h4>	
	</div>
	<br><br>
	
	<table class="table table-bordered" style="width:850px; height:300px;">
		<tr>
			<td width="400" style="cursor:pointer" onclick="reviewgo()"><i class="bi bi-chat-text"></i>&nbsp;&nbsp;나의 후기</td>
			<td width="400" style="cursor:pointer" onclick="coursego()"><i class="bi bi-menu-app-fill"></i>&nbsp;&nbsp;나만의 코스</td>
		</tr>
		
		<tr>
			<td width="400" style="cursor:pointer"><i class="bi bi-chat-heart"></i>&nbsp;&nbsp;좋아요</td>
			<td width="400" style="cursor:pointer" onclick="listgo()"><i class="bi bi-reddit" ></i>&nbsp;&nbsp;나의 일정</td>
		</tr>
		
		<tr>
			<td colspan="2" style="cursor:pointer" onclick="money()" ><i class="bi bi-currency-exchange" ></i>&nbsp;&nbsp;개발자한테 기부하기</td>
		</tr>
	</table><br><br>
	
	<div class="container" style="margin-right:10px;" id="updateFormContainer">	
	<button type="button"  class="btn btn-primary btn-link" 
	 style="margin-left:800px; "onclick="location.href='index.jsp?main=myPage/updateform.jsp?id=<%=myid %>'">수정</button>
	<table class="table table-bordered" style="width:850px; height:300px;">
	
	<td style="border:none;">
	<b style="font-size:24px;">기본정보</b>
	</td>
	
	<tr>
		<td rowspan="5" width="150px">
		<br>
		<img src="<%=root %>/save/<%=dto.getProfile() %>" class="rounded-circle" width="170" height="200">
		</td>
	</tr>

	<tr style="height:75px;">
		<td style="text-align:left; width:100px; vertical-align: middle; font-size:18px;">&nbsp;&nbsp;<b>이름 : </b></td>
		<td style="text-align:center; vertical-align: middle; font-size:18px;"><b><%=dto.getName() %></b></td>
	</tr>
	
	<tr style="height:75px;">
		<td style="text-align:left; vertical-align: middle; font-size:18px;">&nbsp;&nbsp;<b>폰 번호 :</b></td>
		<td style="text-align:center; vertical-align: middle; font-size:18px;"><b><%=dto.getHp() %></b></td>
	</tr>
	
	<tr style="height:75px;">
		<td style="text-align:left; vertical-align: middle; font-size:18px;">&nbsp;&nbsp;<b>나이 : </b></td>
		<td style="text-align:center; vertical-align: middle; font-size:18px;"><b><%=dto.getAge() %></b></td>
	</tr>
	
	<tr style="height:75px;">
		<td style="text-align:left; vertical-align: middle; font-size:18px;">&nbsp;&nbsp;<b>성별 : </b></td>
		<td style="text-align:center; vertical-align: middle; font-size:18px;"><b><%=dto.getGender() %></b></td>
	</tr>
	</table><br><br>
	
	
	<table class="table table-bordered" style="width:850px; height:300px;">
	<td style="border:none; text-align:left;">
	<b style="font-size:24px;">연락처정보</b>
	</td>
	<tr>
	<td style="border:none; text-align:left; vertical-align: middle; font-size:18px;">이메일</td>
	<td style="border:none; text-align:left; vertical-align: middle; font-size:18px;"><%=dto.getEmail() %></td>
	</tr>
	
	<tr>
	<td style="border:none; text-align:left; vertical-align: middle; font-size:18px;">거주지</td>
	<td style="border:none; text-align:left; vertical-align: middle; font-size:18px;"><%=dto.getArea() %></td>
	</tr>
	</table>
	<br><br>
	
	
	<table class="table table-bordered" style="width:850px; height:300px;">
	
	<td style="border:none; text-align:left;">
	<b style="font-size:24px;">기타정보</b>
	</td>
	
	<tr>
	<td style="border:none; text-align:left; vertical-align: middle; font-size:18px;">MBTI</td>
	<td style="border:none; text-align:left; vertical-align: middle; font-size:18px;"><%=dto.getMbti() %></td>
	</tr>
	
	<tr>
	<td style="border:none; text-align:left; vertical-align: middle; font-size:18px;">가입날짜</td>
	<td style="border:none; text-align:left; vertical-align: middle; font-size:18px;"><%=sdf.format(dto.getRegister_day()) %></td>
	</tr>
	
	</table>
	<br><br>
	</div>
	
	<br><br>
	
	<%	 
		 }
	 }
	 %>
	 <% 
	String pw = request.getParameter("pass");
	MemberDto dto = new MemberDto();
	dto.setPass(pw); // 비밀번호 초기화, 실제로는 DB에서 값을 가져와야 합니다.
%>
<input type="button" class="btn btn-primary btn-link" value="회원탈퇴" style="float:right;" onclick="byeform()">

<script>
 function byeform() {
	
    var userId = '<%=myid %>'; // JSP 변수를 JavaScript 변수에 할당
    
    var url = "index.jsp?main=myPage/deleteform.jsp?id=" + userId;
    
    window.open(url, "회원탈퇴", "width=1000,height=500");
} 
 
 function money() {
	 let a= "여러분의 소중한 후원이 여러명의 개발자를 살립니다 감사합니다."; 
	 let b = "후원계좌 : 카카오뱅크 3333050489678 진현규\n";
	 let c = "후원계좌 : 카카오뱅크 1234567890123 위시온\n";
	 let d = "후원계좌 : 카카오뱅크 7979 25 81760 임형준";

	 alert(a);
	 alert(b+c+d);
 }
 
 function listgo() {
	 var userId = '<%=myid %>';
	 var url = "index.jsp?main=myList/myList.jsp?id="+userId;
	 location.href=url;
 }
 
 function reviewgo() {
	 var userId = '<%=myid %>';
	 var url = "index.jsp?main=myList/myreview.jsp?id="+userId;
	 location.href=url;
 
 }
 
 function coursego() {
	 var userId = '<%=myid %>';
	 var url = "index.jsp?main=myList/myCourse.jsp?id="+userId;
	 location.href=url;
 
 }
 
 

//a가 yes이고 , 프롬프트에서 입력한 값이, dto.getpass랑 같으면 아래 코드 진행
/* $("#del").click(function(){
var a = confirm("회원탈퇴를 진행하시겠습니까?");

if (a) {
    var password = prompt("비밀번호를 입력해주세요");
    
    if (password !== null) {
        // 입력한 비밀번호를 서버로 전달하여 확인
        var pass = password; // 비밀번호 변수에 저장
        //비밀번호 체크하는 로직 하나 만들어야함
        
        $.ajax({
            type: "POST",
            dataType: "html",
            url: "MyPage/userDelete.jsp",
            data: { "pass": pass }, // 비밀번호 데이터 전송
            success: function(res) {
                if (res === "success") {
                    alert("회원탈퇴가 완료되었습니다.");
                } else {
                    alert("비밀번호가 일치하지 않습니다.");
                }
            },
        });
    } else {
        alert("비밀번호를 입력해주세요.");
    }
}
});  */

// 수정 버튼을 눌렀을 때 이벤트 핸들러
function loadUpdateForm() {
    // AJAX를 사용하여 updateform 페이지를 가져오고 지정한 div에 삽입합니다.
    $.ajax({
        type: 'GET',
        url: 'MyPage/updateform.jsp', // updateform.jsp의 경로를 적절하게 수정
        success: function(response) {
            $('#updateFormContainer').html(response);
        },
        error: function() {
            alert('페이지 로드에 실패했습니다.');
        }
    });
}

// 수정 버튼 클릭 시 loadUpdateForm 함수 호출
$(document).ready(function() {
    $('#updateButton').click(function() {
        loadUpdateForm();
    });
});
</script>

	
	
	
</body>
</html>