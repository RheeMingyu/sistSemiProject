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

<title>Insert title here</title>

<style>

body {

  padding-bottom: 30px;

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
String myid = (String)session.getAttribute("myid");
%>
   <article>

      <div class="container" role="main">
			<br>
         <h2><b>고객센터 문의</b></h2><br>

         <form name="form" id="form" role="form" method="post" action="admin/insertProc.jsp" onsubmit="al()">

            <div class="mb-3">

               <label for="title">제목</label>

               <input type="text" class="form-control" name="subject" id="title" placeholder="제목을 입력해 주세요" style="width:600px;" required="required">

            </div>

            

            <div class="mb-3">

               <label for="reg_id">작성자</label>

               <input type="text" class="form-control" name="id" id="reg_id" placeholder="이름을 입력해 주세요" style="width:600px" value="<%=myid%>" required="required">

            </div>

            

            <div class="mb-3">

               <label for="content">내용</label>

               <textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요" style="width:700px; height:200px;" required="required"></textarea>

            </div>

			<input type="submit" class="btn btn-sm btn-primary" id="btnSave" value="저장">
            <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="list()">목록</button>
         </form>

         <div>

            

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
   
   </script>

</body>
</html>