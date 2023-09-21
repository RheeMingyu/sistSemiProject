<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.LikesDao"%>
<%@page import="data.dto.TourSpotDto"%>
<%@page import="data.dao.TourSpotDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link
   href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dongle&family=Gugi&family=Orbit&display=swap"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
   rel="stylesheet">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>주소로 장소 표시하기</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body * { 
 font-family: 'Jeju Gothic', sans-serif;
 }
#spotContent {
   width: 200px;
}
#spottext{
   padding-left : 10px;
   /* background-color: #FFF0F5; */
}



#map-container {
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
}
#map {
    /* width: 70%; */
    width:700px;
    height: 600px;
}
#placeInfo {
    /* width: 30%; */
    width:500px;
    padding: 10px;
    margin-left: 20px; /* 오른쪽 여백 추가 */
}


.placediv{
   border: 1px solid #ccc;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); 
}

ul.nav-tabs{
   background-color:#fff5ee;
}

/* 기본 li 스타일 */
li.nav-item {
    cursor: pointer;
    transition: color 0.3s; /* 글자 색상 변화를 부드럽게 만들기 위한 트랜지션 설정 */
}

#myCourseMain{
   position: absolute;
   top:150px;
   left:250px;
   width:1400px;
}

#themeTitle{
margin: 0 0 20px;
    font-weight: 800;
    font-size: 22px;
}


p{
color:#2C3E50;
font-size:15px;
}





</style>
<%
      TourSpotDao tourSpotDao = new TourSpotDao(); 
      List<TourSpotDto> list = tourSpotDao.selectTourSpot();
      String root = request.getContextPath();
      
      String myid = (String)session.getAttribute("myid");
      
      MemberDao memberDao = new MemberDao();
      MemberDto memberDto = memberDao.getData(myid);
      
      LikesDao likesDao = new LikesDao();

   %>

<script type="text/javascript">

//메뉴 클릭시 css

$(document).ready(function() {
    // URL에서 selTheme 매개변수 값을 가져옵니다.
    var urlParams = new URLSearchParams(window.location.search);
    var selThemes = urlParams.get("selTheme");
   //alert(selThemes);
    // 가져온 selTheme 값을 사용하여 해당 탭을 활성화합니다.
    if (selThemes) {
        $("#" + selThemes).addClass("active");
    }
    
   $("#btnMap").click(function(){
      location.href="<%=root%>/index.jsp?main=myCourse/myCourseMap.jsp&selTheme=oceanTab";
   });
   $("#btnList").click(function(){
      location.href="<%=root%>/index.jsp?main=myCourse/myCourseList.jsp";
   });
});
</script>


</head>
<body>


<div id="myCourseMain">
<div class="btn-group" style="margin-bottom:20px;"><button type="button" class="btn btn-outline-primary" id="btnMap">지도로 보기</button><button type="button" class="btn btn-outline-primary" id="btnList">리스트로 보기</button></div>
<h4 id="themeTitle"><%=memberDto.getName() %>님 나만의 코스를 만들어 여행을 즐겨보세요.</h4>
<!-- Nav tabs -->
      <ul class="nav nav-tabs" role="tablist">
         <!-- <li class="nav-item"><a class="nav-link active"
            data-bs-toggle="tab" href="#tabs-1" onclick="selTheme('전체')">전체</a></li> -->
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" id="oceanTab" style="color:black;">바다</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" id="olleTab" style="color:black;">올레길</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" id="mountainTab" style="color:black;">산</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" id="experienceTab" style="color:black;">체험</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" id="foodTab" style="color:black;">음식</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" id="lodgeTab" style="color:black;">숙박</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" id="shoppingTab" style="color:black;">쇼핑</a></li>
         <li class="nav-item"><a class="nav-link" data-bs-toggle="tab" id="islandTab" style="color:black;">섬</a></li>
      </ul>



   <div id="map-container">
   <div id="map" style="width: 750px; height: 550px;"></div>

   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1f0da95f6b690783743a6d5efe0a18f&libraries=services"></script>
   <script>
   
   
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.38, 126.65), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();





 

 <%

String selTheme = request.getParameter("selTheme");
 //System.out.println(selTheme);
if(selTheme == null){
   selTheme = "";
}else if(selTheme.equals("oceanTab")){
   selTheme ="바다";
}else if(selTheme.equals("olleTab")){
   selTheme ="올레길";
}else if(selTheme.equals("mountainTab")){
   selTheme ="산";
}else if(selTheme.equals("experienceTab")){
   selTheme ="체험";
}else if(selTheme.equals("foodTab")){
   selTheme ="음식";
}else if(selTheme.equals("lodgeTab")){
   selTheme ="숙박";
}else if(selTheme.equals("shoppingTab")){
   selTheme ="쇼핑";
}else if(selTheme.equals("islandTab")){
   selTheme ="섬";
}

 
String str=null;
for (int i = 0; i < list.size(); i++) {
   TourSpotDto tourSpotDto = list.get(i);
   if(tourSpotDto.getMain_cat().equals(selTheme)){

      str = tourSpotDto.getAddr();
/*       System.out.println(selectTheme); */

      %>





// 주소로 좌표를 검색합니다
/* geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) { */
geocoder.addressSearch('<%=str%>', function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        
        
        
        var selectedPlace = []; // 선택한 장소 정보를 저장할 배열
        

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: "<div id='spotContent'><img src='<%=root%>/jeju/<%=tourSpotDto.getPhoto()%>' style='width:100%; height:70px'><div id='spottext'><%=tourSpotDto.getName()%><br><%=tourSpotDto.getHp()%></div></div>"
                              });
                        //infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        //map.setCenter(coords);

                        // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
                        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
                        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
                        kakao.maps.event.addListener(marker,
                              'mouseover', makeOverListener(map,
                                    marker, infowindow));
                        kakao.maps.event
                              .addListener(marker, 'mouseout',
                                    makeOutListener(infowindow));

                        // 마커에 click 이벤트를 등록합니다
                         kakao.maps.event.addListener(marker, 'click', function() {
                            
                            var spotName =   '<%=tourSpotDto.getName()%>';
                            var tour_seq = '<%=tourSpotDto.getSeq()%>';
                            var intro = "<%=tourSpotDto.getIntro()%>";
                            var photo = '<%=tourSpotDto.getPhoto()%>';
                            var myid = '<%=myid%>';
                            selectedPlace.push(spotName); // 배열에 선택한 장소 이름 추가

                                  
                              if(<%=likesDao.isLikeCheck(myid, Integer.parseInt(tourSpotDto.getSeq()))==1%>){
                              $("#placeInfo").html("<img src='<%=root%>/jeju/<%=tourSpotDto.getPhoto()%>' style='width:100%; height:400px'><br><b><%=tourSpotDto.getName()%></b>&nbsp;&nbsp;<i class='bi bi-heart-fill like' style='color:red'></i><br><p><%=tourSpotDto.getIntro()%><br><%=tourSpotDto.getAddr()%>&nbsp;/&nbsp;<%=tourSpotDto.getHp()%><br></p>"+
                                    "<button type='button' id='btntouradd' class='btn btn-info'>추가하기</button> ");
                              }else{
                                 $("#placeInfo").html("<img src='<%=root%>/jeju/<%=tourSpotDto.getPhoto()%>' style='width:100%; height:400px'><br><b><%=tourSpotDto.getName()%></b>&nbsp;&nbsp;<i class='bi bi-heart-fill like'></i><br><p><%=tourSpotDto.getIntro()%><br><%=tourSpotDto.getAddr()%>&nbsp;/&nbsp;<%=tourSpotDto.getHp()%><br></p>"+
                                 "<button type='button' id='btntouradd' class='btn btn-info'>추가하기</button> ");
                              }
                               /* $("#placeInfo").addClass("placediv"); */
                              
                              $("#btntouradd").click(function(){
                                 var yes = confirm("장소를 추가하시겠습니까?");
                                  
                                 if(yes){
                                     
                                    //테이블에 장소를 추가하기 위해 db temp테이블에 장소 추가
                                    $.ajax({
                                               type: "POST",
                                               url: "myCourse/insertTemp.jsp", // 서버로 데이터를 전송할 주소 설정
                                               data: {spotName: spotName, tour_seq:tour_seq, intro:intro, photo:photo }, // 선택한 장소 데이터를 전송
                                               success: function(response) {
                                                  //alert("장소가 성공적으로 추가되었습니다.");
                                             console.log("장소가 성공적으로 추가되었습니다.");
                                             location.reload();
                                               },
                                               error: function(error) {
                                                   alert("장소 추가 중 오류가 발생했습니다.");
                                               }
                                           });
                                 // 테이블에 선택한 장소를 추가하는 함수 호출
                                     //updateSelectedPlacesTable(selectedPlace);
                                 }
                              });
                               
                              $(document).on("click", "i.like", function() {
                                   var currentColor = $(this).css("color");
                                   
                                   
                                   if (currentColor === "rgb(255, 0, 0)") {
                                       // 현재 색상이 빨간색인 경우 검은색으로 변경합니다.
                                       $(this).css("color", "black");
                                       $.ajax({
                                          type: "get",
                                         url: "myCourse/likes.jsp",
                                         data: {tour_seq:tour_seq, myid:myid},
                                         success: function(data) {
                                          console.log("좋아요클릭");
                                            
                                         }
                                       })
                                       
                                       
                                   } else {
                                       // 현재 색상이 빨간색이 아닌 경우 빨간색으로 변경합니다.
                                       $(this).css("color", "red");
                                       $.ajax({
                                          type: "get",
                                         url: "myCourse/likes.jsp",
                                         data: {tour_seq:tour_seq, myid:myid},
                                         success: function(data) {
                                          console.log("좋아요클릭");
                                            
                                         }
                                       })
                                   }
                               }); 
                              
                              
                              
                               /* $("#btncourseadd").click(function(){

                                  var courseName = $("#courseName").val();
                                  var cnameText = $("span.cnamesuccess").text();

                                     if(courseName==""){
                                        alert("코스 이름을 입력해주세요!");
                                     }else if(cnameText!="사용 가능한 코스이름입니다"){
                                        alert("중복 체크를 완료해주세요!");
                                     }

                                     else if(courseName!=""&&cnameText=="사용 가능한 코스이름입니다"){
                                        var courseName = $("#courseName").val();
                                       
                                           // 서버로 선택한 장소 데이터를 전송
                                           $.ajax({
                                               type: "POST",
                                               url: "myCourse/insertMap.jsp", // 서버로 데이터를 전송할 주소 설정
                                               data: {courseName: courseName, spotName: spotName }, // 선택한 장소 데이터를 전송
                                               success: function(response) {
                                                  //alert("장소가 성공적으로 추가되었습니다.");
                                       
                                                   var tableBody = document.querySelector('#selectedPlacesTable tbody');
                                                   tableBody.innerHTML = ''; // 기존 테이블 내용 초기화
                                                   
                                                // 코스 저장 후 courseName 입력란을 비움
                                                   $("#courseName").val(""); // 입력란을 비워줍니다.
                                                  
                                               },
                                               error: function(error) {
                                                   alert("장소 추가 중 오류가 발생했습니다.");
                                               }
                                           });
                                     
                                  
                                     }
                             
                              });  */
                              
                              
                            
                         });
                        
                        
                      
                        
                        
                      // 선택한 장소를 테이블에 추가하는 함수
                         /* function updateSelectedPlacesTable(selectedPlaceArray) {
                             var tableBody = document.querySelector('#selectedPlacesTable tbody');
                             //tableBody.innerHTML = ''; // 기존 테이블 내용 초기화

                             for (var i = 0; i < selectedPlaceArray.length; i++) {
                                 var spotName = selectedPlaceArray[i];
                                 var row = tableBody.insertRow(-1); // -1을 사용하여 가장 아래에 행을 추가합니다.
                                 var cell = row.insertCell(0);
                                 cell.textContent = spotName;
                             }
                             
                          
                         } */
                     }
                  });
   <%}}%>  


</script>



   

   
   
   <script>
      
      //인포윈도우를 표시하는 클로저를 만드는 함수입니다 
      function makeOverListener(map, marker, infowindow) {
         return function() {
            infowindow.open(map, marker);
         };
      }

      // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
      function makeOutListener(infowindow) {
         return function() {
            infowindow.close();
         };
      }
      
      //코스이름 중복 체크
      /* $(document).on("click", "#btnCname", function() {
          var courseName = $("#courseName").val();

          $.ajax({
              type: "get",
              url: "myCourse/cnameSearch.jsp",
              dataType: "json",
              data: { "courseName": courseName },
              success: function(data) {

                 if (data.count >= 1) {
                      $("span.cnameSuccess").text("이미 존재하는 코스이름입니다");
                      $("#courseName").val("");
                  } else {
                      $("span.cnameSuccess").text("사용 가능한 코스이름입니다");
                  }
              }
          });
      }); */
      


           // 각 탭에 대한 클릭 이벤트 처리


               $(".nav-link").click(function(event) {
                
            
                // 이제 원하는 동작 수행 (예: 페이지 내용 로드 또는 지도 업데이트 등)
                var theme = $(this).attr("id"); // 클릭한 탭의 ID를 가져옴
                
                loadPlaces(theme);
            });


          // 관광지 데이터 불러오기
          function loadPlaces(theme) {
             
             location.href = "myCourse/selectTheme.jsp?selTheme="+theme;

          }
          

          
      
   </script>
   

    <%--클릭한 장소의 정보가 여기에 표시됩니다. --%>
   <div id="placeInfo" class="placediv" style="margin-right:20px;">
      <img src='<%=root%>/jeju/maininfo.png' style='width:100%; height:400px'><br><br><p>제주도의 다양한 관광지를 만나보세요 :)</p>
   </div>
   

   
<jsp:include page="selectTable.jsp"></jsp:include>
</div>
</div>



</body>
</html>