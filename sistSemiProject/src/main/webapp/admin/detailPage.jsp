<%@page import="data.dto.AdminBoardDto"%>
<%@page import="data.dao.AdminBoardDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu:wght@700&family=Nanum+Pen+Script&family=Single+Day&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<title>관리자 문의 답글 페이지</title>

<style>

body {

  padding-bottom: 30px;

}
div.a1 {
 width:600px;	
 height:700px;
 border : 0px solid gray;
 margin-left :100px;

}

div.b {
 border : 0px solid gray;

}

#content {

}

@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}

</style>

</head>

<body>
<%
String num = request.getParameter("num");

String myid = (String)session.getAttribute("myid");
String id = request.getParameter("id");

AdminBoardDao dao = new AdminBoardDao();
AdminBoardDto dto = dao.getDto(num);


%>
   <article>
		
      <div class="a1" id="a1">
      <div class="b">
			<br>
         <h2><b>고객센터 문의</b></h2><br>

         <form name="form" id="form" role="form" method="post" action="admin/insertProc.jsp" onsubmit="al()">

            <div class="mb-3">

               <label for="title">제목</label>

               <input type="text" class="form-control" name="subject" id="title" placeholder="제목을 입력해 주세요" style="width:400px;" value="<%=dto.getSubject() %>" required="required" disabled>

            </div>

            <div class="mb-3">

              <label for="reg_id">작성자</label>

               <input type="text" class="form-control" name="id" id="reg_id" placeholder="이름을 입력해 주세요" style="width:400px" value="<%=dto.getId()%>" required="required" disabled>

            </div>

            <div class="mb-3">

               <label for="content">내용</label>

              <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" style="width:500px; height:150px;" required="required" disabled>
               <%=dto.getContent() %>
               </textarea>

            </div>
			<%
			System.out.println(myid);
			System.out.println(id);
			
			//지금로그인한 사람이 작성자와 아이디가 같으면 수정,삭제 버튼이 뜨게 해야함.
			if(myid.equals(id)){
			%>
			<input type="submit" class="btn btn-sm btn-primary" id="btnSave" value="수정">
			<button type="button" style="width:48px; height:30px;" class="btn btn-sm btn-primary" id="btndel" value="삭제" onclick="del()">삭제</button>
			<%	
			}
			%>
            <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="list()">목록</button>
         </form>
		<br><br>
		
		<!-- 댓글을 달 수 있는 창은 관리자만 보일 수 있게 한다. 그대시 다른 사람들은 댓글을 볼 수는 있게 만들 것 이다. -->
		<%
		if(myid.equals("admin")) {
		%>	
		
				<div class="aform">
					<table>
					<tr>
					<td><b><i class="bi bi-reddit"></i>&nbsp;관리자</b></td>
					</tr>
					
					<tr>
					<td><textarea style="width:700px; height:300px;"></textarea></td>
					</tr>
					</table>
					<button type="button" style="float:center;" onclick="content()">답글달기</button>
				</div>
		<%
		}
		%>
       </div>
       <div id="Content" style="margin-left:40px; margin-top: -30px; width:450px; height:200px; border:0px solid gray;">
       <p><b><i class="bi bi-android"></i>&nbsp;관리자</b></p>
       <textarea style="width:430px; height:150px;"></textarea>
	  </div>
       
</div> 


   </article>
   
   <script>
   function list() {
	   location.href="index.jsp?main=admin/boardList.jsp";
   }
   
   function al() {
	   alert("등록이 완료되었습니다.");
   }
   
   function del() {
	   
	   var del = confirm("문의를 삭제하시겠습니까?");
	   
	   if(del) {
		   alert("삭제되었습니다.");
		   locatin.href="admin/deleteContent.jsp?myid="+myid+"&currentPage="+currentPage;
	   }
	   
   }
   
   function content() {
   	
       $.ajax({
           url: 'admin/contentBoard.jsp', 
           type: 'POST', 
           dataType: 'html', // 데이터 형식은 HTML
           success: function(response) {
               // AJAX 요청이 성공하면 내용을 questionContent div에 삽입
               if($('#Content').html()=="") {
               	$('#Content').html(response);
               } else {
               	$('#Content').html("");
               }
               
           },
           error: function() {
               alert('데이터를 불러오는 데 실패했습니다.');
           }
       });
   }
   
   </script>

</body>
</html>