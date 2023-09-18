<%@page import="data.dao.TempSaveDao"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.TempSaveDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourSpotDao"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu:wght@700&family=Nanum+Pen+Script&family=Single+Day&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style>
#addCaption{
margin: 0 0 20px;
    font-weight: 800;
    font-size: 22px;
    color:black;
    display:inline-block;
}

#selDay{
	display: inline-block;
	margin-left:50px;
	width:120px;
	height:35px;
}

#courseName::placeholder{
	color:#a9a9a9;
}

</style>
</head>
<body>
<%

	TempSaveDao tempSaveDao = new TempSaveDao();

	List<TempSaveDto> list = tempSaveDao.selectTemp();
	String[] name=new String[list.size()];
	String[] tour_seq = new String[list.size()];
	String[] intro = new String[list.size()];
	int[] num = new int[list.size()];
	String mainPhoto = null;
	
	String myid = (String)session.getAttribute("myid");
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.getData(myid);
%>


<script>
$(function(){
	var s="";
    $("#selDay").change(function(){
        if ($(this).val() == "당일치기") {
            //alert("당일치기가 선택되었습니다.");
            s="";
            s+='<select class="form-select form-select-sm selDayClass" style="width:85px;">';
			s+= '<option value="1" selected>1일차</option>';
			s+= '</select>';
			
			$("td.day").html(s);
		}
        else if($(this).val() == "1박2일"){
        	s="";
        	s+='<select class="form-select form-select-sm selDayClass" style="width:85px;">';
			s+= '<option value="1" selected>1일차</option>';
			s+= '<option value="2">2일차</option>';
			s+= '</select>';
			
			$("td.day").html(s);
        }
        else if($(this).val() == "2박3일"){
        	s="";
        	s+='<select class="form-select form-select-sm selDayClass" style="width:85px;">';
			s+= '<option value="1" selected>1일차</option>';
			s+= '<option value="2">2일차</option>';
			s+= '<option value="3">3일차</option>';
			s+= '</select>';
			
			$("td.day").html(s);
        }
        else if($(this).val() == "3박4일"){
        	s="";
        	s+='<select class="form-select form-select-sm selDayClass" style="width:85px;">';
			s+= '<option value="1" selected>1일차</option>';
			s+= '<option value="2">2일차</option>';
			s+= '<option value="3">3일차</option>';
			s+= '<option value="4">4일차</option>';
			s+= '</select>';
			
			$("td.day").html(s);
        }
        });
    

    });
</script>


<!-- 선택한 관광지 목록이 나타나는 테이블 -->
<table id="selectedPlacesTable" class="table table-bordered" style="width:350px; text-align:center" >
	<caption align="top"><b id="addCaption">추가한 장소</b>
	<select id="selDay" class="form-select form-select-sm">
    <option value="당일치기" selected>당일치기</option>
    <option value="1박2일">1박2일</option>
    <option value="2박3일">2박3일</option>
    <option value="3박4일">3박4일</option>
</select></caption>
	<thead><tr><th colspan="3">코스의 이름을 입력하세요&nbsp;&nbsp;&nbsp;<button type="button" id="btnCname" class="btn btn-danger btn-sm">중복체크</button><br><span class="cnameSuccess"></span><input type="text" class="form-control" id="courseName" name="courseName" placeholder="ex)하하호호 웃음이 나는 코스"></th></tr></thead>
		<tbody><%for (int i=0; i<list.size();i++){ TempSaveDto tempSaveDto = list.get(i);%></tbody>
		<tr>
		<td width="70" class="day"><select class="form-select form-select-sm selDayClass" style="width:85px;">
			<option value="1" selected>1일차</option>
			</select></td>
		<td width="40"><%=i+1%></td>
		<td id="selName"><%=tempSaveDto.getName() %></td>
		</tr>

		<%
		tour_seq[i] = tempSaveDto.getTour_seq();
		name[i] = tempSaveDto.getName();
		intro[i] = tempSaveDto.getIntro();
		num[i] = (i+1);
		mainPhoto = tempSaveDto.getPhoto(); 
		} %>
	<caption align="bottom"><button type="button" id="btncourseadd" class="btn btn-success">나만의 코스 만들기</button></caption>
	</table>
	<input type="hidden" id="memId" value="<%=memberDto.getId()%>">

<script>
//코스이름 중복 체크
$(document).on("click", "#btnCname", function() {
    var courseName = $("#courseName").val();
    var memId = $("#memId").val(); 

    $.ajax({
        type: "get",
        url: "myCourse/cnameSearch.jsp",
        dataType: "json",
        data: { "courseName": courseName, "memId":memId },
        success: function(data) {

           if (data.count >= 1) {
                $("span.cnameSuccess").text("이미 존재하는 코스이름입니다");
                $("#courseName").val("");
            } else {
                $("span.cnameSuccess").text("사용 가능한 코스이름입니다");
            }
        }
    });
});
		
 //나만의 코스 만들기 버튼 클릭시 코스 이름 중복 여부 확인하고 추가
 $("#btncourseadd").click(function(){

	 var courseName = $("#courseName").val();
	 var cnameText = $("span.cnameSuccess").text();
	 var memId = $("#memId").val();
	 var selNum = <%= new Gson().toJson(num) %>;
	 var intro = <%= new Gson().toJson(intro) %>;
	 var tour_seq = <%= new Gson().toJson(tour_seq) %>;
	 var spotName = <%= new Gson().toJson(name) %>;
	 var mainPhoto = "<%= mainPhoto%>";
	 var day = []; // 일차 저장할 배열
	 var length = spotName.length;
	 
	 
	// select 요소의 값을 배열에 추가
     $(".selDayClass").each(function () {
         var value = $(this).val();
         day.push(value);
     });

   
	 
	 //배열로 받기
	 

	    if(courseName==""){
	    	alert("코스 이름을 입력해주세요!");
	    }else if(cnameText!="사용 가능한 코스이름입니다"){
	    	alert("중복 체크를 완료해주세요!");
	    }

	    else if(courseName!=""&&cnameText=="사용 가능한 코스이름입니다"){
	    	var courseName = $("#courseName").val();
	    	for(var i=0; i<length;i++){

           // 서버로 선택한 장소 데이터를 전송
           $.ajax({
               type: "POST",
               url: "myCourse/insertCourse.jsp", // 서버로 데이터를 전송할 주소 설정
               data: {courseName: courseName, memId:memId, spotName: spotName[i], selNum: selNum[i], intro: intro[i], tour_seq: tour_seq[i], mainPhoto:mainPhoto, day:day[i]  }, // 선택한 장소 데이터를 전송
               success: function(response) {
               	//alert("장소가 성공적으로 추가되었습니다.");
					
                   /* var tableBody = document.querySelector('#selectedPlacesTable tbody');
                   tableBody.innerHTML = ''; // 기존 테이블 내용 초기화 */
                   
                // 코스 저장 후 courseName 입력란을 비움
                   $("#courseName").val(""); // 입력란을 비워줍니다.
                  
                  location.reload();
               },
               error: function(error) {
                   alert("장소 추가 중 오류가 발생했습니다.");
               }
           });
           
           
           //통계를 위한 데이터 전송
           $.ajax({
        	   type:"post",
        	   url: "myCourse/statistics.jsp",
        	   data: {memId:memId, tour_seq: tour_seq[i]},
        	   success: function(response){
        		   //alert("통계 데이터 전송 성공!!");
        	   }
           });
		 
	    	}
	    }

});  
 




</script>

</body>
</html>