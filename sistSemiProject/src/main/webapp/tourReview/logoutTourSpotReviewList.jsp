<%@page import="data.dto.TourSpotDto"%>
<%@page import="data.dto.TourReviewDto"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.GuestCommentDto"%>
<%@page import="data.dao.GuestCommentDao"%>
<%@page import="data.dto.GuestCommentDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GuestReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GuestTourSpotReviewDao"%>
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
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script>
$(function(){
$("span.likes").click(function() {
      
      var num=$(this).attr("num");
      //alert(num);
      var tag=$(this);
      
      $.ajax({
         
         type:"get",
         dataType:"json",
         url:"tourReview/likes.jsp",
         data:{"num":num},
         success:function(data){
            
            //alert(data.likes);
            tag.next().text(data.likes);
          
            }
            
            
         });
      });
$("span.answer:eq(0)").click(function() {
    
    // $(this).prev().toggle();
    //$(this).next().toggle()
    $("div.answer:eq(0)").toggle();
    
  });
$("span.answer:eq(1)").click(function() {
    
    // $(this).prev().toggle();
    //$(this).next().toggle()
    $("div.answer:eq(1)").toggle();
    
  });
$("span.answer:eq(2)").click(function() {
    
    // $(this).prev().toggle();
    //$(this).next().toggle()
    $("div.answer:eq(2)").toggle();
    
  });
  
  $("span.answer").click();
  });

   
   /* function showStars(sv,seq){
      for(var i=1;i<sv;i++){
         $("#n"+seq+" i.star"+i+"0").attr("class","bi bi-star-fill star"+i+"0");
      }
      if(sv*2%2==0){
         $("#n"+seq+" i.star"+sv+"0").attr("class","bi bi-star-fill star"+sv+"0");
      }
      else{
         $("#n"+seq+" i.star"+(sv+0.5)+"0").attr("class","bi bi-star-half star"+sv+"0");
      }
   } */
   function showStars(sv){
      var s="";
      var empty="<i class='bi bi-star'>";
      var half="<i class='bi bi-star-half'>";
      var full="<i class='bi bi-star-fill'>"
      if(sv==0){
         s+=empty+empty+empty+empty+empty;
      }
      else if(sv*2%2==0){
         for(var i=1;i<=sv;i++){
            s+=full;
         }
         for(var i=5;i>sv;i--){
            s+=empty;
         }
      }
      else{
         for(var i=1;i<sv;i++){
            s+=full;
         }
         s+=half;
         for(var i=4;i>sv;i--){
            s+=empty;
         }
      }
      return s;
   }
   
</script>
<title>Insert title here</title>
<style type="text/css">
 div.table {
   border: 1px solid gray;
   margin: 20px auto;
   padding: 20px;
}

.title {
   flex-grow: 1;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
}

.photo {
   width: 80px;
   height: 50px;
}

.bi {
   cursor: pointer;
}

body {
   margin: 20px;
}

div.table+* {
   margin-top: 20px;
}

.review-content {
   margin-top: 500px;
   white-space: pre-wrap;
}

   i{
      color: orange;
  }
  </style>
</head>
<%

String loginok = (String) session.getAttribute("loginok");

GuestTourSpotReviewDao dao = new GuestTourSpotReviewDao();
ArrayList<GuestReviewDto> list = dao.getAllGuestReviews();


int totalCount = dao.getTotalCount(); //전체 개수
int totalPage; //총 페이지 수
int startPage; //각 블럭에서 보여질 시작페이지
int endPage; //각 블럭에서 보여질 끝페이지   
int startNum; //db에서 가져올 글의 시작번호 (mysql은 첫글이 0,오라클은 1)
int perPage = 3; //한 페이지당 보여지는 글의 개수
int perBlock = 5; //한 블럭당 보여지는 페이지 개수
int currentPage; //현재 페이지
int no; //각 페이지당 출력할 시작번호

//현재페이지 읽기(단 null일 경우는 1페이지로 준다)계산을 해야하므로 int로 형변환 해줌
if (request.getParameter("currentPage") == null)
   currentPage = 1;
else
   currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지수 구하기
//총 글의 개수 / 한 페이지당 보여질 개수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)

totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
//예)  7개 = 전체 글 20개 / 한페이지당 보이는 개수 3  + ( )
//각 블럭당 보여야 할 시작페이지
//perBlock=5일 경우는 현재 페이지 1~5 시작:1 끝:5
//현재페이지 13  시작:11 끝:15
startPage = (currentPage - 1) / perBlock * perBlock + 1;
//     

endPage = startPage + perBlock - 1;

//총페이지가 23일 경우 마지막블럭은 25가 아니라 23이다     
if (endPage > totalPage)
   endPage = totalPage;

//각 페이지에서 보여질 시작번호
//1페이지:0, 2페이지:5 3페이지:10...
startNum = (currentPage - 1) * perPage;

//각페이지당 출력할 시작번호 구하기 no
//총 글개수가 23이면 1페이지 23, 2페이지는 18, 3페이지:13...
no = totalCount - (currentPage - 1) * perPage;

//페이지에서 보여질 글만 가져오기
List<GuestReviewDto> guestreviewlist = dao.getPagingList(startNum, perPage);


%>

<body>
   <jsp:include page="logoutTourSpotReviewForm.jsp" />

   <%
   if (guestreviewlist.size() == 0) {
   %>
   <tr>
      <br>
      <br>
      <br>
      <a style="margin-left: 650px;"><b>등록된 게시글이 없습니다</b></a>
   </tr>
   <table class="table table-bordered" style="margin-top: 300px; ">
      <%
      } else {

      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      %>
      <div style="margin-top: 150px;"></div>

      <%
      for (int i = 0; i < guestreviewlist.size(); i++) {
         GuestReviewDto guestreviewdto = guestreviewlist.get(i);
      %>
      <div class="table table-bordered" style="width: 1135px; margin-left: 180px; padding: 20px; ">
         <tr>
            <div class="row">
               <div class="col-md-8">
                  <%=no--%>
                  <a style="font-size: 0.9em">&nbsp;&nbsp;
                  <i class="bi bi-person-circle" style="font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;<%=guestreviewdto.getNickname()%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a><b>&nbsp;&nbsp;<%=guestreviewdto.getTitle()%></b></a>
                  <%double sv=guestreviewdto.getStars()!=null?Double.parseDouble(guestreviewdto.getStars()):0;%>
                  <div data-index="<%= i %>" class="d">
               <script>
               var starsHtml = showStars(<%=sv%>);
               var divs = document.querySelectorAll('div.d');
                  divs.forEach(function(div) {
                      var dataIndex = div.getAttribute('data-index');
                      if (dataIndex == <%=i%>) {
                         div.innerHTML = starsHtml;
                      }
                      });
               </script>
               <%=sv %>
                  </div>
               </div>
               <div class="col-md-4 text-end">
                  <td>
                     <div float="right;">
                        <span class="likes"><a style="font-size: 0.7em; color: gray;">좋아요</a>&nbsp;
                        <i class="bi bi-hand-thumbs-up" style="color: gray;"></i>&nbsp;&nbsp;&nbsp;<%=guestreviewdto.getLikes()%></span>
                        <a style="font-size: 0.7em; color: gray;">작성일&nbsp;<%=sdf.format(guestreviewdto.getWriteday())%></a>&nbsp;&nbsp;
                        <a style="font-size: 0.7em; color: gray;">조회수&nbsp;<%=guestreviewdto.getViewcount()%></a>
                     </div>
                  </td>
               </div>

               <br>
            <tr class="photo">
            <td><%=guestreviewdto.getPhoto()%></td>
         </tr>
         <br>
         <td>내용&nbsp;&nbsp;<%=guestreviewdto.getContent()%></td> 
         <br> 
         <br>
         <br>
      </div>
      <%      
               //각 방명록에 달린 댓글 목록 가져오기
               GuestCommentDao guestcommentdao = new GuestCommentDao();
              
               List<GuestCommentDto> glist = guestcommentdao.getAllGuestComments(guestreviewdto.getCom_seq());
               String writer = request.getParameter("writer");
               String pass2 = request.getParameter("pass2");
               %>


      <form action="tourReview/guestCommentInsert.jsp" method="post">
      
         <div class="d-flex">
         <input type="text" name="writer" class="form-control">
         <input type="password" name="pass" class="form-control">
            <textarea style="width: 1000px; height: 120px; margin-right: 50px;"
               name="content"  class="form-control"></textarea>
            <button type="submit" class="btn btn-outline-dark"
               style="width: 100px; height: 100px; margin-bottom: 40px;">등록</button>
   
         </div>
         <input type="hidden" name="com_seq"   value="<%=guestreviewdto.getCom_seq()%>"> 
         
         <input type="hidden" name="currentPage" value="<%=currentPage%>">
         </form>
         </td>
         </tr>
      <span class="answer" style="cursor: pointer;"
               num=<%=guestreviewdto.getCom_seq()%>>&nbsp;&nbsp;&nbsp;
      <i class="bi bi-chat-dots-fill" id="id<%=guestreviewdto.getCom_seq() %>" style=""></i>&nbsp;&nbsp;댓글 <%=glist.size() %></span>
 

      </tr>
      </table>
      </div>
      <%
      

      String com_seq = guestreviewdto.getCom_seq();
         GuestCommentDao guestCommentDao = new GuestCommentDao();
            List<GuestCommentDto> gcList = guestcommentdao.getAllGuestComments(com_seq);
            MemberDao memberDao = new MemberDao();%>
            
         <div class="answer">
            <table class="table" style="width:1118px;margin-left: 180px;">
               <%
                  for(GuestCommentDto g : gcList){ %>
                     <tr>
                     <!-- <td width="60">
                     <i class="bi bi-person-circle"></i>
                     </td> -->
                     <td>
                     <i class="bi bi-person-circle"></i>

                     
                     <b><%=g.getWriter() %></b>
                     &nbsp;
                     

                     <span style="font-size:9pt;color:gray;margin-left:20px"><%=sdf.format(g.getWriteday()) %></span>
                     <br>
                     <span class="scontent"><%=g.getGuestcomment().replace("\n","<br>") %></span>

                        <i class="bi bi-trash3 adel" style="color: red; cursor: pointer; float:right; font-size:20px" com_seq=<%=g.getCom_seq() %>></i>
                        <i class="bi bi-pencil-square aup" data-bs-toggle="modal" style="color: green; cursor: pointer; float:right; font-size:20px" com_seq=<%=g.getCom_seq() %>></i>

                     </td>
                     </tr>
                  <%}
               %>
            </table>
</div>
         
<%
      
      }

      }
  
      %>


      <!--페이지번호 출력-->
      <br>
      <br>
      <br>
      <div align="bottom">
         <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link"
               href="tourReview/logoutTourSpotReviewList.jsp?currentPage=<%=startPage - 1%>"
               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
            </a></li>
            <%
            //이전
            if (startPage > 1) {
            %>
         <li class="page-item active">
             <a class="page-link" href="index.jsp?main=tourReview/logoutTourSpotReviewList.jsp?currentPage=<%=currentPage-1%>"><span aria-hidden="true">&laquo;</span></a>
               <%
            }

            for (int pp = startPage; pp <= endPage; pp++) 
            {
            if (pp == currentPage) {
            %>

            <li class="page-item active"><a class="page-link"
               href="index.jsp?main=tourReview/logoutTourSpotReviewList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
            <%
            } else {
            %>
            <li class="page-item"><a class="page-link"
               href="index.jsp?main=tourReview/logoutTourSpotReviewList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
            <%
            }
            }
            if (endPage < totalPage) {
               %>
            <li class="page-item">
            <a class="page-link" aria-label="Next"
               href="index.jsp?main=tourReview/logoutTourSpotReviewList.jsp?currentPage=<%=endPage+1 %>"><span aria-hidden="true">&raquo;</span></a>
            </li>

            <%
            }
            
 %>

         </ul>
      </div>

   
</body>
</html>