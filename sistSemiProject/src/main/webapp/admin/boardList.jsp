<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.AdminBoardDao"%>
<%@page import="data.dto.AdminBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>고객센터 문의</title>
</head>
<style>
   .sidebar {
    height: 800px;
    width: 220px;
    position: fixed;
    top: 100px;
    left: -250px; /* 초기에는 화면 밖에 위치 */
    background-color: wheat;
    transition: left 0.3s ease;
    z-index: 999; /* 이 부분을 추가해서 sidebar가 다른 요소 위에 나타나도록 설정 */
}

        /* 사이드바 링크 스타일 (마우스 호버 시) */
.sidebar a:hover {
            background-color: #555;
        }

        /* 내용 부분 스타일 */
.content {
            margin-left: 0; /* 사이드바가 열릴 때 내용 부분을 옮기기 위한 여백 */
            padding: 20px;
        }

        /* 사이드바 열릴 때 애니메이션 */
.sidebar.open {
   left: 0;
        }
.a {
   margin-left:360px;
   border : 0px solid black;
   display:flex;
   margin-top:100px;
}
#tb1 {
   width:800px;
}

#a1 {
}
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}
</style>
<%
String root= request.getContextPath();
String myid=(String)session.getAttribute("myid");
AdminBoardDao AdminBoardDao = new AdminBoardDao();

   int totalCount = AdminBoardDao.getTotalCount(); //전체 개수
   int totalPage; //총 페이지 수
   int startPage; //각 블럭에서 보여질 시작페이지
   int endPage; //각 블럭에서 보여질 끝페이지
   int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0, oracle은 1)
   int perPage = 5; //한페이지당 보여질 글 개수
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
   List<AdminBoardDto> list = AdminBoardDao.getPagingList(startNum, perPage);

   SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd월");

   //마지막 페이지 남은 글 지우면 빈페이지만 남는다 -> 해결: 이번페이지로 이동
   if (list.size() == 0 && currentPage != 1) {
   %>
   <script type="text/javascript">
         location.href="index.jsp?main=myCourse/myCourseList.jsp?currentPage=<%=currentPage - 1%>;
      </script>
   <%
   }


   
%>

<body>
&nbsp;&nbsp;<button id="a1" onclick="toggleSidebar()"><i class="bi bi-menu-app" style="font-size:20px; border:none;"></i></button><br><br>

<div class="a">
<div class="b1">
<table class="table" id="tb1">
<tr>
<td><b style="float:left; font-size:22px;"><</b></td>
<td align="center"><b style="align:center; font-size:24px;">&nbsp;&nbsp;문의사항 리스트</b></td>
<td><b style="float:right; font-size:22px;">></b>
</tr>

<tr>
<td width="80">
<b>전체</b>
</td>
<td><b>공지사항</b></td>
<td></td>
</tr>
</table><br>

<input type="hidden" name="id" value="<%=myid %>">

<table class="table table-bordered" style="width:800px;">
<caption align="top"><b>총 <%=totalCount %>건</b></caption>

   <%for(int i=0; i<list.size(); i++){ 
      AdminBoardDto adminboardDto = list.get(i);   %>
   <tr class="tourList" style="height:25px">
        <td width="50px" style="algin:center;"><input type="checkbox" class="chk"></td>
      <td style="width:700px;">
      <b class="subject" style="font-size:24px;">
      <%-- <a href="index.jsp?main=admin/detailPage.jsp?num=<%=adminboardDto.getNum() %>&currentPage=<%=currentPage%>&id=<%=myid %>"> --%>
      제목 : <%=adminboardDto.getSubject()%></b><br>
      <p style="font-size:12px;"id="writeday" disabled>작성날짜 : <%=sdf.format(adminboardDto.getWriteday()) %></p>
      </td>
   </tr>
<%} %>
</table>





<!-- 페이지번호 출력 -->
   <div>
   <button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true" style="float:right;">글쓰기</button>
   <button type="button" class="btn active" data-bs-toggle="button" aria-pressed="true">목록</button>
      <ul class="pagination justify-content-center">
   
         <%
         //이전
         if (startPage > 1) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=startPage - perBlock%>"><<</a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=startPage%>"><<</a></li>

         <%
         }
         %>

         <%
         if (currentPage > 1) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=currentPage - 1%>"><</a></li>

         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=startPage%>"><</a></li>

         <%
         }
         %>





         <%
         for (int pp = startPage; pp <= endPage; pp++) {
            if (pp == currentPage) {
         %>
         <li class="page-item active"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
         <%
         }
         }
         %>



         <!-- 다음버튼 -->
         <%
         if (currentPage < totalPage) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=currentPage + 1%>">></a></li>

         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=endPage%>">></a></li>

         <%
         }
         %>

         <%
         if (totalPage > (endPage + 1)) {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=endPage + 1%>">>></a></li>
         <%
         } else {
         %>
         <li class="page-item"><a class="page-link"
            href="index.jsp?main=admin/boardList.jsp?currentPage=<%=endPage%>">>></a></li>

         <%
         }
         %>
      </ul>
   </div>
   </div>
    <div id="detail1">
   
   
   </div>
</div>

<div class="sidebar open">
   <button type="button" style="margin-left:15px; margin-top:20px; border:none;" onclick="toggleSidebar()">
   <i class="bi bi-menu-app" style="font-size:20px;"></i></button>
   <br><br>
    &nbsp;&nbsp;<a href="index.jsp">&nbsp;<i class="bi bi-house-door"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>홈</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=myPage/mypage.jsp">&nbsp;<i class="bi bi-person-lines-fill"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>개인정보</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=myPage/secure.jsp">&nbsp;<i class="bi bi-shield-shaded"></i>&nbsp;&nbsp;&nbsp;&nbsp;<b>보안</b></a><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=admin/adminBoard.jsp">&nbsp;<i class="bi bi-telephone-outbound-fill"></i>&nbsp;&nbsp;&nbsp;<b>고객센터</b></a>
    <!-- 로그인상태면 로그아웃 , 로그아웃 상태면 로그인으로 보이게하기 0905 적어둠 -->
    <br><br><br><br><br><br><br><br><br><br>
    &nbsp;&nbsp;<a href="index.jsp?main=login/logoutAction.jsp">&nbsp;<i class="bi bi-door-closed-fill"></i>&nbsp;&nbsp;&nbsp;로그아웃</a><br>
    
    <%
      // 관리자 로그인하면 메뉴바 하나 더 뜨게 만들기 0905 적어둠
      AdminBoardDto dto = new AdminBoardDto();
    %>
</div>



<script>
    // 사이드바 열기/닫기 함수
    function toggleSidebar() {
        var sidebar = document.querySelector('.sidebar');
        sidebar.classList.toggle('open');
    }
    
    var num = '<%=dto.getNum()%>';
    var currentpage = '<%=currentPage %>';
    var id = '<%=myid %>';
    
   
    $(document).on('click', '.subject', function () {
        $.ajax({
            url: 'admin/detailPage.jsp',
            type: 'POST',
            data: { "num": num, "currentpage": currentpage, "id": id },
            dataType: 'html', // 데이터 형식은 HTML
            success: function (response) {
                // AJAX 요청이 성공하면 내용을 questionContent div에 삽입
                if ($('#detail1').html() == "") {
                    $('#detail1').html(response);
                    $('#detail1').html(response);
                    $('#detail1').html(response);
                    
                } else {
                    $('#detail1').html("");
                }
            },
            error: function () {
                alert('데이터를 불러오는 데 실패했습니다.');
            }
        });
    });
</script>

</body>
</html>