<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function openFileInput(){
   document.getElementById('image').click();
}


function readURL(input){
      if(input.files&&input.files[0]){
         var reader=new FileReader();
         reader.onload=function(e){
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
    });
    $("div.over2").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star star2");
       $("i.star3").attr("class","bi bi-star star3");
       $("i.star4").attr("class","bi bi-star star4");
       $("i.star5").attr("class","bi bi-star star5");
    });
    $("div.over3").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star-half star2");
       $("i.star3").attr("class","bi bi-star star3");
       $("i.star4").attr("class","bi bi-star star4");
       $("i.star5").attr("class","bi bi-star star5");
    });
    $("div.over4").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star-fill star2");
       $("i.star3").attr("class","bi bi-star star3");
       $("i.star4").attr("class","bi bi-star star4");
       $("i.star5").attr("class","bi bi-star star5");
    });
    $("div.over5").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star-fill star2");
       $("i.star3").attr("class","bi bi-star-half star3");
       $("i.star4").attr("class","bi bi-star star4");
       $("i.star5").attr("class","bi bi-star star5");
    });
    $("div.over6").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star-fill star2");
       $("i.star3").attr("class","bi bi-star-fill star3");
       $("i.star4").attr("class","bi bi-star star4");
       $("i.star5").attr("class","bi bi-star star5");
    });
    $("div.over7").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star-fill star2");
       $("i.star3").attr("class","bi bi-star-fill star3");
       $("i.star4").attr("class","bi bi-star-half star4");
       $("i.star5").attr("class","bi bi-star star5");
    });
    $("div.over8").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star-fill star2");
       $("i.star3").attr("class","bi bi-star-fill star3");
       $("i.star4").attr("class","bi bi-star-fill star4");
       $("i.star5").attr("class","bi bi-star star5");
    });
    $("div.over9").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star-fill star2");
       $("i.star3").attr("class","bi bi-star-fill star3");
       $("i.star4").attr("class","bi bi-star-fill star4");
       $("i.star5").attr("class","bi bi-star-half star5");
    });
    $("div.over10").click(function(){
       $("i.star1").attr("class","bi bi-star-fill star1");
       $("i.star2").attr("class","bi bi-star-fill star2");
       $("i.star3").attr("class","bi bi-star-fill star3");
       $("i.star4").attr("class","bi bi-star-fill star4");
       $("i.star5").attr("class","bi bi-star-fill star5");
    });
 });
</script>
</head>
<style>

.select {
   display: flex;
}

.photo {
   cursor: pointer;
}


.button {
   margin-left: 900px;
}

.content {
   margin-left: 300px;
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
      left: 350px;
      width: 50px;
      height: 100px;
      opacity: 0;
      z-index: 10;
   }
   div.over9{
      position: absolute;
      top: 0px;
      left: 400px;
      width: 50px;
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
   <form action="index.jsp?main=tourReview/tourSpotReviewAction.jsp" method="post"
      enctype="multipart/form-data">
         <table class="table table-bordered"
         style="width: 1100px; height: 400px; margin-top: 100px; margin-left:180px;">
         <tr>
   <td>
   <img src="../image/이미지.png" id="showing"
   onclick="openFileInput()" alt="" style="width:50px; height:40px; margin-top:10px;" 
   class="photo"> 
   <input type="file" class="image" id="image" style="visibility: hidden;"   onchange="readURL(this)">
            
    <div style="position: relative; cursor:pointer; width: 500px;height: 100px; margin-left:400px;">
      <i class="bi bi-star star1"></i>
      <div class="over over1" value=1></div>
      <div class="over over2" value=2></div>
      <i class="bi bi-star star2"></i>
      <div class="over over3" value=3></div>
      <div class="over over4" value=4></div>
      <i class="bi bi-star star3" ></i>
      <div class="over over5" value=5></div>
      <div class="over over6" value=6></div>
      <i class="bi bi-star star4"></i>
      <div class="over over7" value=7></div>
      <div class="over over8" value=8></div>
      <i class="bi bi-star star5"></i>
      <div class="over over9" value=9></div>
      <div class="over over10" value=10></div>
   </div>
         
               
               <div class="select" style="margin-left: 50px; width: 300px; ">
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


</script>
<%!
   }
%>
         
                  <div id="sel2"></div>
                  
                  <%
                  {
                  }
                  %>
       </div>
               <div class="input-container"
                  style="margin-left:818px; width: 300px;"><br>
               
               </div> <br><input type="text" name="title" class="form-control"
               style="width: 960px; margin-left: 10px" required="required" placeholder="제목">
               <br>
               <textarea style="width: 960px; height: 150px; margin-left: 10px"
                  name="content" required="required" class="form-control"
                  placeholder="리뷰를 작성해주세요"></textarea>


               <button class="btn btn-primary" type="submit"
                  style="margin-top: 10px; width:60px;margin-left: 910px; background-color: #696969; border-color: #696969;">등록</button>
   </td>
   </tr>
   
   </table>
   </form>


</body>
</html>