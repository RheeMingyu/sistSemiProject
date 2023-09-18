<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String root=request.getContextPath();
	String myid=(String)session.getAttribute("myid");
%>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="<%=root%>/menu/js/jquery.js"></script>
<script type="text/javascript" src="<%=root%>/menu/js/function.js"></script>
<title>Insert title here</title>
<%
   String loginok = (String)session.getAttribute("loginok");

   MemberDao dao = new MemberDao();
   String name = dao.getName(myid);
%>
<meta charset="UTF-8">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=root%>/menu/js/jquery.js"></script>
<script type="text/javascript" src="<%=root%>/menu/js/function.js"></script>
<title>Jeju do it</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);

span * {
    font-family: 'OAGothic-ExtraBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/OAGothic-ExtraBold.woff2') format('woff2');
    font-style: normal;
}


#ttop {
   margin-top: -18px;
   height: 80px;
   width: 1690px;
   background-color: white;
}

.topmenu {
   text-decoration: none;
   color: #696969;
   display: block;
   font-size: 20px;
   font-family: 'Jeju Gothic', sans-serif;
   margin-top: 30px;
}

.submenu a{
   text-decoration: none;
   color: #696969;
   display: block;
   font-size: 20px;
   font-family: 'Jeju Gothic', sans-serif;
   margin-top: 30px;
}

.submenu a:hover{
	background-color: gray;
	color: white;
	text-decoration: none;
}
   
#ttop ul li {
   list-style: none;
   float: left;
   line-height: 30px;
   vertical-align: middle;
   text-align: center;
}

.submenu{
   height: 0;
   overflow: hidden;
}

#ttop:hover .submenu {
  height: 250px;
  transition-duration: 1s;
  }

nav ul li a:hover{
	text-decoration: none;
}
</style>

<script>
   $(function(){
      
      $("#ttop").mouseover(function(){
         $(".dv1").css("height","400px").css("background-color","#F5F5F5").css("transition","all 0.5s ease-in-out");
      });
      
      $("#ttop").mouseout(function(){
         $(".dv1").css("height","0px").css("background-color","white").css("transition","all 0.5s ease-in-out");
      });
      
      $("#myCourseMenu").click(function(){
          if(<%=loginok%>==null){
             var confirmLogin = confirm("로그인이 필요한 페이지입니다. 로그인하시겠습니까?");
             if (confirmLogin) {
                // 사용자가 확인을 클릭한 경우 로그인 페이지로 이동
                window.location.href = "<%=root %>/index.jsp?main=login/loginForm.jsp";
             } else {
                // 사용자가 취소를 클릭한 경우 현재 페이지에 머물도록 함
             }
          }
       });
   });
   

</script>
</head>
<body>
<header>
<div class="dv1" style="position: fixed; z-index:999; height: 0px; background-color: white;opacity: 0.97">
   <nav id="ttop" style="">
   <ul class="t1">
      <li><img src="jeju/logo.png" style="width: 130px; height: 50px; margin-left: 40px; margin-top: 10px; cursor: pointer;" onclick="location.href='<%=root%>/index.jsp'"></li>
      <li><a href="#" class="topmenu" style="width: 200px; margin-left: 80px;">ABOUT 제주</a>
         <ul class="submenu" style="margin-left: 40px;">
         <a href="<%=root%>/index.jsp?main=about/introduce.jsp" style="font-size: 15px;">제주 소개</a>
         </ul>
      </li>
      <li><a href="#" class="topmenu" style="width: 150px; margin-left: 10px;">추천 코스</a>
         <ul class="submenu" style="margin-left: -20px;">
         <a href="index.jsp?main=recomCourse/recomCourseList.jsp" style="font-size: 15px;">테마</a>
         <a href="" style="font-size: 15px;">지역</a>
         </ul></li>

     <li id="myCourseMenu"><a href='<%= (loginok != null) ? (root + "/index.jsp?main=myCourse/myCourseMap.jsp&selTheme=oceanTab") : '#' %>' 
     class="topmenu" style="width: 150px; margin-left: 20px;">나만의 코스</a></li>

      <li><a href="#" class="topmenu" style="width: 150px; margin-left: 10px;">리뷰</a>
         <ul class="submenu" style="margin-left: -10px;">
         <a href="" style="font-size: 15px;">코스 리뷰</a>
         <a href="" style="font-size: 15px;">관광지 리뷰</a>
         </ul>
      </li>
      <li><a href="#" class="topmenu" style="width: 150px; margin-left: 5px;">이벤트</a>
         <ul class="submenu" style="margin-left: -20px;">
         <a href="" style="font-size: 15px;">진행중 이벤트</a>
         <a href="" style="font-size: 15px;">종료 이벤트</a>
         </ul>
      </li>
         <% if(loginok==null) {
         
         %>
         
         <% } else if(loginok!=null) {
         %>   
          <li><a href="#" class="topmenu" style="width: 150px; margin-left: 15px;">마이페이지</a>
         <ul  class="submenu" style="margin-left: -10px;">
         <a href="index.jsp?main=myPage/mypage.jsp" style="font-size: 15px;">나의 정보</a>
         <a href="index.jsp?main=myList/myList.jsp" style="font-size: 15px;">MY LIST</a>
         </ul>
         <%
         }
         %>
         
      <%
      if(loginok==null) {
      %>
      </li>
      <li><a href="<%=root %>/index.jsp?main=login/loginForm.jsp" class="topmenu" style="width: 150px; margin-left: 15px; font-size: 14px;">로그인</a>
      </li>
      
      <% } else if(loginok!=null) {
      %>
      <li>
      <a href="<%=root %>/index.jsp?main=login/logoutAction.jsp" class="topmenu" style="width: 150px; margin-left: 15px; font-size: 14px;">로그아웃</a>
      </li>
      <%     
      }
      %>
     
   </ul>
    <form class="d-flex" action="index.jsp?main=search/searchIndex.jsp" method="post">
        <input class="form-control me-2" type="text"  style="width: 120px; margin-left: 30px; margin-top: 20px;" name="inputWords" placeholder="Search">
        <button class="btn btn-primary" type="submit" style="margin-top: 20px; background-color: #696969; border-color: #696969;">Search</button>
      </form>
   </nav>
</div>
</header>


	
</body>
</html>