<%@page import="java.util.ArrayList"%>
<%@page import="data.dao.MemberCommentDao"%>
<%@page import="data.dto.MemberCommentDto"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page
   import="org.eclipse.jdt.internal.compiler.env.NameEnvironmentAnswer"%>
<%@page import="java.util.jar.Attributes.Name"%>
<%@page import="javax.swing.text.html.parser.DTD"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.TourReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourSpotReviewDao"%>
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
<title>Insert title here</title>
<style>
   i{
      color: orange;
   }
</style>
<script>
$(function(){
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
})


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
</head>
<%
//로그인 상태 확인후 입력폼 나타낼것_회원만 보이게
String loginok = (String) session.getAttribute("loginok");
TourSpotReviewDao dao = new TourSpotReviewDao();

// limchard 추가
String myid = (String) session.getAttribute("myid");
MemberDao MemberDao = new MemberDao();



int totalCount = dao.getTotalCount(); //전체갯수
int totalPage; //총 페이지수
int startPage; //각 블럭에서 보여질 시작페이지
int endPage; //각 블럭에서 보여질 끝페이지
int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
int perpage = 3; //한 페이지당 보여질 글의갯수
int perBlock = 5; //한 페이지당 보여질 페이지 갯수
int currentPage; //현재 페이지
int no; //각페이지당 출력할 시작번호
int startNum; //각페이지에서 보여질 시작번호

//현재페이지 읽기(단 null일경우는 1페이지로 준다)계산을 해야하므로 int로 형변환해줌
if (request.getParameter("currentPage") == null)
   currentPage = 1;

else
   currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지수 구하기
//총 글의갯수/한페이지당 보여질 개수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지)
totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);

//각 블럭당 보여야할 시작페이지
//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
//현재페이지 13 시작:11 끝:15
startPage = (currentPage - 1) / perBlock * perBlock + 1; // (12/5)*5 +1=11

endPage = startPage + perBlock - 1;

//총페이지가 23일경우 마지막블럭은 25가아니라 23이다
if (endPage > totalPage)
   endPage = totalPage;

//각페이지에서 보여질 시작번호
//1페이지: 0, 2페이지 :5, 3페이지 :10...
startNum = (currentPage - 1) * perpage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23이면 1페이지 23, 2 페이지 18, 3페이지 13......
//no=totalCount-(currentPage-1)*perPage;
no = totalCount - startNum;

//각페이지 필요한 게시글 자겨오기
List<TourReviewDto> list = dao.getList(startNum, perpage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

//마지막 페이지 남은 한개글 지우면 빈페이지만 남는다.(해결책)이전페이지로간다

if (list.size() == 0 && currentPage != 1) {
   
   response.sendRedirect("index.jsp?main=tourReview/tourReviewList.jsp?currentPage="+(currentPage-1));
}
%>
<body>
   <%
      if(loginok!=null)
      {
   %>
   <jsp:include page="tourSpotReviewForm.jsp" />
   <hr align="left" style="margin-left: 230px; width:1000px;">
   <%
      }else{
   %>
   <jsp:include page="logoutTourSpotReviewForm.jsp" />
   
   <hr align="left" width="700px;">
   <%
      }
   %>
   
   <%
   TourSpotReviewDao tourspotreviewdao = new TourSpotReviewDao();
   List<TourReviewDto> tourreviewlist = dao.getAllTourReviews();
   if (tourreviewlist.size() == 0) {
   %>
   <br>
      <br>
      <br>
      <br>
   <div style="margin-left: 600px;">
      <b>게시글이 없습니다.</b>
       <br> <br> <br>
      
            
            <table class="table table-bordered" style="margin-top: 300px; ">
            <%
            } else {
            %>
            <div style="margin-top: 150px;"></div>
            <%
            for (int i = 0; i < list.size(); i++) {
               TourReviewDto tourreviewdto = list.get(i);
            %>
            <div class="table table-bordered"
               style="width: 1135px; margin-left: 180px; padding: 20px; ">
               <tr>
                  <div class="row">
                     <div class="col-md-8">
                        <%=no--%>
                        <a style="font-size: 0.9em">&nbsp;&nbsp;<i
                           class="bi bi-person-circle" style="font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;<%=tourreviewdto.getId()%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a><b>&nbsp;&nbsp;<%=tourreviewdto.getTitle()%></b></a>
                        <%double sv=tourreviewdto.getStars()!=null?Double.parseDouble(tourreviewdto.getStars()):0;%>
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
                     </div>
                     </div>
                     <div class="col-md-4 text-end">
                        <td>
                           <div float="right;">
                            <%
                        //수정 삭제는 로그인 중이면서 로그인한 아이디와 같은 경우만 보이게
                        if(loginok!=null&&tourreviewdto.getId().equals(myid)){%> 
                         <a href="tourReview/tourSpotReviewDelete.jsp?num=<%=tourreviewdto.getCom_seq()%>&currentPage=<%=currentPage%>"
                       style="color: red"><i class="bi bi-trash3 del" style="color: red; cursor: pointer; float:right; font-size:20px" com_seq=<%=tourreviewdto.getCom_seq() %>></i></a>
                     <a href="index.jsp?main=tourReview/tourSpotReviewUpdateForm.jsp?num=<%=tourreviewdto.getCom_seq()%>&currentPage=<%=currentPage%>"
                     style="color: green"><i class="bi bi-pencil-square up"  style="color: green; cursor: pointer; float:right; font-size:20px" com_seq=<%=tourreviewdto.getCom_seq() %>></i></a>
                      <%}%>
                              <span class="likes"><a style="font-size: 0.7em; color: gray;">좋아요</a>&nbsp;<i
                                 class="bi bi-hand-thumbs-up" style="color: gray;"></i>&nbsp;&nbsp;&nbsp;<%=tourreviewdto.getLikes()%></span>
                              <a style="font-size: 0.7em; color: gray;">작성일&nbsp;<%=sdf.format(tourreviewdto.getWriteday())%></a>&nbsp;&nbsp;
                              <a style="font-size: 0.7em; color: gray;">조회수&nbsp;<%=tourreviewdto.getViewcount()%></a>
                           </div>
                        </td>
                     </div>

                     <br>
                        <tr class="photo">
                        <td><%=tourreviewdto.getPhoto()%></td>
                        </tr>
                     <br>
                     <td>내용&nbsp;&nbsp;<%=tourreviewdto.getContent()%></td> <br> <br>
                     <br>
                     </div>
            </tr>
            </div>
           
            
               <tr>
            <td>
      <%   String com_seq = tourreviewdto.getCom_seq();
         MemberCommentDao Dao = new MemberCommentDao();
         List<MemberCommentDto> memberCommentlist=Dao.getAllMemberComments(com_seq);
      %> 
      
<%
if(loginok!=null){
%>
               <div class="commentform" style="margin-left: 180px">
                  <form action="tourReview/memberCommentInsert.jsp" method="post">
                     <table class="table table-bordered" style="width:1000px;" id="id<%=com_seq%>">
                        <tr>
                           <td><textarea style="width: 1000px; height: 100px"
                                 name="content" required="required" class="form-control"></textarea>
                           </td>
                           <td>
                              <button type="submit" class="btn btn-outline-dark" style="width: 100px;height: 100px">등록</button> <input
                              type="hidden" name="com_seq" value="<%=tourreviewdto.getCom_seq() %>">
                              <input type="hidden" name="id" value="<%=myid %>">
                              <input type="hidden" name="currentPage" value="<%=currentPage %>">
                           </td>
                        </tr>
                     </table>
                  </form>
                  <span class="answer" style="cursor: pointer;"
               num=<%=tourreviewdto.getCom_seq()%>>&nbsp;&nbsp;&nbsp;
      <i class="bi bi-chat-dots-fill" id="id<%=tourreviewdto.getCom_seq() %>" style=""></i>&nbsp;&nbsp;댓글 <%=memberCommentlist.size() %></span>
               </div> 
               
               <%
            }
               %>
               
            </td>
         </tr>

         <tr>
         <td>
         
            <%MemberCommentDao memberCommentDao = new MemberCommentDao();
               List<MemberCommentDto> mcList = memberCommentDao.getAllMemberComments(com_seq);
               MemberDao memberDao = new MemberDao();
               System.out.println(com_seq);
               System.out.println(mcList.size());%>
               
               <div class="answer" style="margin-left: 180px">
            <table class="table" style="width:1118px;">
               <%
                  for(MemberCommentDto m : mcList){ %>
                     <tr>
                     <!-- <td width="60">
                     <i class="bi bi-person-circle"></i>
                     </td> -->
                     <td>
                     <i class="bi bi-person-circle"></i>
                     <%
                     
                     //작성자명
                     String name = memberDao.getName(myid);
                     System.out.println(myid);
                     System.out.println(name);
                     %>
                     
                     <b><%=memberDao.getName(m.getId())  %></b>
                     &nbsp;
                     <%
                     //글쓴이와 댓글 쓴이가 같을 경우 [작성자]
                     if(myid.equals(m.getId())){      
                     %>
                     <b><span style="color:red; border:1px solid red; border-radius:20px; font-size:8pt">작성자</span></b>
                     <%} %>
                     
                     <span style="font-size:9pt;color:gray;margin-left:20px"><%=sdf.format(m.getWriteday()) %></span>
                     <br>
                     <span class="scontent"><%=m.getMembercomment().replace("\n","<br>") %></span>
                     <%
                        //수정 삭제는 로그인 중이면서 로그인한 아이디와 같은 경우만 보이게
                        if(loginok!=null&&m.getId().equals(myid)){%>
                        <i class="bi bi-trash3 adel" style="color: red; cursor: pointer; float:right; font-size:20px" com_seq=<%=m.getCom_seq() %>></i>
                        <i class="bi bi-pencil-square aup" data-bs-toggle="modal" style="color: green; cursor: pointer; float:right; font-size:20px" com_seq=<%=m.getCom_seq() %>></i>
                     <%}%>
                     </td>
                     </tr>
                  <%}
               %>
            </table>
            </div>
         
</td>
</tr>
            <% 
            }
            }
   %>
   <%
   
                        TourReviewDto tourreviewdto = new TourReviewDto();
                        String com_seq=request.getParameter("com_seq");
                              //로그인한 아이디
                              /* String id=(String)session.getAttribute("id"); */
                              String reviewId = tourspotreviewdao.getId(com_seq);
                           
                           //로그인한 아이디와 글쓴아이디가 같을 경우에만 수정, 삭제
                           if(reviewId!=null&&myid.equals("admin"))
                           {  /* reviewId.equals(id)|| */
               %>
               <% 
                             }
 %> <%-- <span class="day"><%=sdf.format(tourreviewdto.getWriteday())%></span></td>  --%>
         </tr>

      
         <!--페이지번호 출력-->
      <br>
      <br>
      <br>
      <div align="bottom">
         <ul class="pagination justify-content-center">
            <li class="page-item"><a class="page-link"
               href="index.jsp?main=tourReview/tourSpotReviewList.jsp?currentPage=<%=startPage - 1%>"
               aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
            </a></li>
            <%
            //이전
            if (startPage > 1) {
            %>
         <li class="page-item active">
             <a class="page-link" href="index.jsp?main=tourReview/tourSpotReviewList.jsp?currentPage=<%=currentPage-1%>"><span aria-hidden="true">&laquo;</span></a>
               <%
            }

            for (int pp = startPage; pp <= endPage; pp++) 
            {
            if (pp == currentPage) {
            %>

            <li class="page-item active"><a class="page-link"
               href="index.jsp?main=tourReview/tourSpotReviewList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
            <%
            } else {
            %>
            <li class="page-item"><a class="page-link"
               href="index.jsp?main=tourReview/tourSpotReviewList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
            <%
            }
            }
            if (endPage < totalPage) {
               %>
            <li class="page-item">
            <a class="page-link" aria-label="Next"
               href="index.jsp?main=tourReview/tourSpotReviewList.jsp?currentPage=<%=endPage+1 %>"><span aria-hidden="true">&raquo;</span></a>
            </li>

            <%
            }
 %>

         </ul>
      </div>
  
   
</body>
</html>