<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.TourSpotDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourSpotDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu:wght@700&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

body * { 
 font-family: 'Jeju Gothic', sans-serif;
 }


#myCourseList{
   position: absolute;
   top:150px;
   left:250px;
   width:1400px;

   
}

#list-container {

    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
}

.tourList{
cursor: pointer;
}

#themeTitle{
margin: 0 0 20px;
    font-weight: 800;
    font-size: 22px;
}

#selectTable{
margin-left:40px;
}


#mainCat{
   float:right;
   font-size:13px;
}

p{
color:#2C3E50;
font-size:15px;
}

img{
height:140px;
margin-top:25px;
}
</style>
<title>Insert title here</title>
<%
   TourSpotDao tourSpotDao = new TourSpotDao();
   //List<TourSpotDto> list = tourSpotDao.selectTourSpot();
   
   String myid = (String)session.getAttribute("myid");
   
   MemberDao memberDao = new MemberDao();
   MemberDto memberDto = memberDao.getData(myid);
   String root = request.getContextPath();
   
   
   
   int totalCount = tourSpotDao.getTotalCount(); //전체 개수
   int totalPage; //총 페이지 수
   int startPage; //각 블럭에서 보여질 시작페이지
   int endPage; //각 블럭에서 보여질 끝페이지
   int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0, oracle은 1)
   int perPage = 4; //한페이지당 보여질 글 개수
   int perBlock = 5; //한 블럭당 보여질 페이지 개수
   int currentPage; //현재페이지
   int no; //각 페이지 당 출력할 시작번호

   //현제페이지 읽기(단 null일경우는 1페이지로 준다)계산을 해야하므로 int로 형변환
   if (request.getParameter("currentPage") == null || request.getParameter("currentPage").equals("null"))
      currentPage = 1;
   else
      //getParameter의 반환값이 String이라 int로 형변환
      currentPage = Integer.parseInt(request.getParameter("currentPage"));

   //총 페이지수 구하기
   //총 글의 개수/한 페이지당 보여질 개수로 나눔   ex)7/5=2페이지
   totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

   //각 블럭당 보여야할 시작페이지
   //perBlock=5일경우는 현제페이지 1~5 시작:1 끝:5
   //현재페이지 13      시작:11  끝:15
   startPage = (currentPage - 1) / perBlock * perBlock + 1;

   //한 블럭당 보이는 마지막페이지
   //ex) 현제페이지 6페이지, perblock 5일경우 - endPage:10
   endPage = startPage + perBlock - 1;

   //총 페이지가 23일경우 마지막블럭은 25가 아니라 23이다
   if (endPage > totalPage)
      endPage = totalPage;

   //각 페이지에서 보여질 시작번호
   //1페이지: 0,2페이지:5, 3페이지:10...0부터 시작 perPage 5일경우
   startNum = (currentPage - 1) * perPage;

   //각페이지당 출력할 시작번호 구하기
   //ex) 총 글개수가 23이면 1페이지 23, 2페이지 18, 3페이지 13...
   no = totalCount - (currentPage - 1) * perPage;

   //페이지에서 보여질 글만 가져오기
   List<TourSpotDto> list = tourSpotDao.getPagingList(startNum, perPage);



   //마지막 페이지 남은 글 지우면 빈페이지만 남는다 -> 해결: 이번페이지로 이동
   if (list.size() == 0 && currentPage != 1) {
   %>
   <script type="text/javascript">
         location.href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=currentPage - 1%>;
      </script>
   <%
   }


   
%>
<script type="text/javascript">
$(function(){
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
<div id="myCourseList">
<div class="btn-group" style="margin-bottom:20px;"><button type="button" class="btn btn-outline-primary" id="btnMap">지도로 보기</button><button type="button" class="btn btn-outline-primary" id="btnList">리스트로 보기</button></div>
<h4 id="themeTitle"><%=memberDto.getName() %>님 나만의 코스를 만들어 여행을 즐겨보세요.</h4>
<div id="list-container">
<table class="table table-bordered" style="width:900px">
<caption align="top"><b>총 <%=totalCount %>건</b></caption>
   <%for(int i=0; i<list.size(); i++){ 
      TourSpotDto tourSpotDto = list.get(i);   %>
   <tr class="tourList" style="height:200px">
      <td style="width:200px;"><img src="<%=root %>/jeju/<%=tourSpotDto.getPhoto() %>" id="tourImg" style="width:100%"></td>
      <td style="width:700px;"><b id="tourName"><%=tourSpotDto.getName()%></b><p id="mainCat"><%=tourSpotDto.getMain_cat() %></p>&nbsp;&nbsp;&nbsp;&nbsp;<p><%=tourSpotDto.getAddr()%>&nbsp;/&nbsp;<%=tourSpotDto.getHp()%></p><p id="tourIntro"><%=tourSpotDto.getIntro() %></p>
      <input type="hidden" value="<%=tourSpotDto.getSeq() %>" id="tourSeq"></td>
   </tr>
<%} %>
</table>
<div id="selectTable">
<jsp:include page="selectTable.jsp"></jsp:include>
</div>
</div>




<!-- 페이지번호 출력 -->
   <div>
      <ul class="pagination justify-content-center">

         <%
         //이전
         if (startPage > 1) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=startPage - perBlock%>"><<</a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=startPage%>"><<</a></li>

         <%
         }
         %>

         <%
         if (currentPage > 1) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=currentPage - 1%>"><</a></li>

         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=startPage%>"><</a></li>

         <%
         }
         %>





         <%
         for (int pp = startPage; pp <= endPage; pp++) {
            if (pp == currentPage) {
         %>
         <li class="page-item active"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
         <%
         }
         }
         %>



         <!-- 다음버튼 -->
         <%
         if (currentPage < totalPage) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=currentPage + 1%>">></a></li>

         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=endPage%>">></a></li>

         <%
         }
         %>

         <%
         if (totalPage > (endPage + 1)) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=endPage + 1%>">>></a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=endPage%>">>></a></li>

         <%
         }
         %>
      </ul>
   </div>



</div>

<script>

/* //코스이름 중복 체크
$(document).on("click", "#btnCname", function() {
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



$(document).on("click","tr.tourList",function(){
   var yes = confirm("장소를 추가하시겠습니까?");
   
   if(yes){
       
      var photo = $(this).find("#tourImg").attr("src");
      var spotName = $(this).find("#tourName").text();
      var intro = $(this).find("#tourIntro").text();
      var tour_seq = $(this).find("#tourSeq").val();
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
   }
});
</script>
</body>
</html>