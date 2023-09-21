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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

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

   
   $(function(){
         $("div.over1").click(function(){
            $("i.star1").attr("class","bi bi-star-half star1");
            $("i.star2").attr("class","bi bi-star star2");
            $("i.star3").attr("class","bi bi-star star3");
            $("i.star4").attr("class","bi bi-star star4");
            $("i.star5").attr("class","bi bi-star star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
            //alert(sv);
         });
         $("div.over2").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star star2");
            $("i.star3").attr("class","bi bi-star star3");
            $("i.star4").attr("class","bi bi-star star4");
            $("i.star5").attr("class","bi bi-star star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
         $("div.over3").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star-half star2");
            $("i.star3").attr("class","bi bi-star star3");
            $("i.star4").attr("class","bi bi-star star4");
            $("i.star5").attr("class","bi bi-star star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
         $("div.over4").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star-fill star2");
            $("i.star3").attr("class","bi bi-star star3");
            $("i.star4").attr("class","bi bi-star star4");
            $("i.star5").attr("class","bi bi-star star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
         $("div.over5").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star-fill star2");
            $("i.star3").attr("class","bi bi-star-half star3");
            $("i.star4").attr("class","bi bi-star star4");
            $("i.star5").attr("class","bi bi-star star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
         $("div.over6").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star-fill star2");
            $("i.star3").attr("class","bi bi-star-fill star3");
            $("i.star4").attr("class","bi bi-star star4");
            $("i.star5").attr("class","bi bi-star star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
         $("div.over7").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star-fill star2");
            $("i.star3").attr("class","bi bi-star-fill star3");
            $("i.star4").attr("class","bi bi-star-half star4");
            $("i.star5").attr("class","bi bi-star star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
         $("div.over8").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star-fill star2");
            $("i.star3").attr("class","bi bi-star-fill star3");
            $("i.star4").attr("class","bi bi-star-fill star4");
            $("i.star5").attr("class","bi bi-star star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
         $("div.over9").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star-fill star2");
            $("i.star3").attr("class","bi bi-star-fill star3");
            $("i.star4").attr("class","bi bi-star-fill star4");
            $("i.star5").attr("class","bi bi-star-half star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
         $("div.over10").click(function(){
            $("i.star1").attr("class","bi bi-star-fill star1");
            $("i.star2").attr("class","bi bi-star-fill star2");
            $("i.star3").attr("class","bi bi-star-fill star3");
            $("i.star4").attr("class","bi bi-star-fill star4");
            $("i.star5").attr("class","bi bi-star-fill star5");
            var sv=$(this).attr("value");
            $("#starInput").val(sv);
         });
      });

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
 div.over{
      overflow: hidden;
      width: 25px;
      height: 50px;
   }
   i{
      color: orange;
   }
   i.star1{
      width: 50px;
      height: 50px;
      font-size: 50px;
      position: absolute;
      top: 0px;
      left: 0px;
      z-index: 1;
   }
   i.star2{
      width: 50px;
      height: 50px;
      font-size: 50px;
      position: absolute;
      top: 0px;
      left: 50px;
      z-index: 1;
   }
   i.star3{
      width: 50px;
      height: 50px;
      font-size: 50px;
      position: absolute;
      top: 0px;
      left: 100px;
      z-index: 1;
   }
   i.star4{
      width: 50px;
      height: 50px;
      font-size: 50px;
      position: absolute;
      top: 0px;
      left: 150px;
      z-index: 1;
   }
   i.star5{
      width: 50px;
      height: 50px;
      font-size: 50px;
      position: absolute;
      top: 0px;
      left: 200px;
      z-index: 1;
   }
   div.over1{
      position: absolute;
      top: 0px;
      left: 0px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }
   div.over2{
      position: absolute;
      top: 0px;
      left: 25px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }
   div.over3{
      position: absolute;
      top: 0px;
      left: 50px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }
   div.over4{
      position: absolute;
      top: 0px;
      left: 75px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }
   div.over5{
      position: absolute;
      top: 0px;
      left: 100px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }
   div.over6{
      position: absolute;
      top: 0px;
      left: 125px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }
   div.over7{
      position: absolute;
      top: 0px;
      left: 150px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }
   div.over8{
      position: absolute;
      top: 0px;
      left: 175px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }
   div.over9{
      position: absolute;
      top: 0px;
      left: 200px;
      width: 25px;
      height: 100px;
      opacity: 0;
      z-index: 10;
   }
   div.over10{
      position: absolute;
      top: 0px;
      left: 225px;
      width: 25px;
      height: 50px;
      opacity: 0;
      z-index: 10;
   }

</style>

<body>
   <!-- form action 수정 -->
   <form action="tourReview/logoutTourSpotReviewAction.jsp" method="post" enctype="multipart/form-data">
      <input type="hidden" name="stars" value="" id="starInput">
      <table class="table table-bordered"
         style="width: 1100px; height: 400px; margin-top: 100px; margin-left: 180px;">
         <tr>
            <td>
            <img src="<%=root %>/jeju/map.png" id="showing"
               onclick="openFileInput()" alt="" width="50px;" class="image"
               height="40px" margin-top="10px";> <input type="file"
               class="image" id="image" style="visibility: hidden;"
               onchange="readURL(this)"> 
      
         
            <div style="position: relative; cursor:pointer; width: 500px;height: 100px; margin-left:400px;">
      <i class="bi bi-star star1"></i>
      <div class="over over1" value=0.5></div>
      <div class="over over2" value=1></div>
      <i class="bi bi-star star2"></i>
      <div class="over over3" value=1.5></div>
      <div class="over over4" value=2></div>
      <i class="bi bi-star star3" ></i>
      <div class="over over5" value=2.5></div>
      <div class="over over6" value=3></div>
      <i class="bi bi-star star4"></i>
      <div class="over over7" value=3.5></div>
      <div class="over over8" value=4></div>
      <i class="bi bi-star star5"></i>
      <div class="over over9" value=4.5></div>
      <div class="over over10" value=5></div>
   </div>


               <div class="select" style="margin-left: 10px; width: 300px;">
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
      $(function(){            
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
                   $("#op").val(op_val);
                   
                   $.ajax({
                   	type:"get",
                   	url:"tourReview/getPhoto.jsp",
                   	dataType:"json",
                   	data:{"op_val":op_val,"sort":"2"},
                   	success:function(r){
                   		var p="<img src='jeju/"+r.photo+"' style='width:200px;height:200px;border-radius:20px;margin-left:100px'>";
                   		$("#sel3").html(p);
                   		$("#avg").text(r.avg);
                   	}
                   	
                    });
                });
          }
        });
      });
      })

   </script>
<%!
   }
%>
         
                  <div id="sel2"></div><div id="sel3"></div><div id="avg"></div>
                  
                  <%
                  {
                  }
                  %>

               </div>
				    <input type="hidden" name="op_val" value="" id="op">
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
               <button class="btn btn-ouline-dark" type="submit" style="margin-top: 10px; margin-left: 1052px; border-color: #696969;">등록</button>
            </td>
         </tr>
    
      </table>
   </form>

</body>

</html>