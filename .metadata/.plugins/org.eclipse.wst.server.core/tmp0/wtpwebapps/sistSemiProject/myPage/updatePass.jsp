<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Diphylleia&family=Dokdo&family=Nanum+Brush+Script&family=Nanum+Gothic+Coding&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>비밀번호 변경 페이지</title>
</head>
<style>
td {
}
</style>
<body>
<form name="frm" action="myPage/updatePassProc.jsp" method="post">
	<table class="table table-bordered" style="position:relative; margin-top:200px; margin-left:200px;">
		<tr align="center">
			<th>&nbsp;&nbsp;<b disabled>현재 아이디 </b></th>
			<td><% %></td>
		</tr>
	
		<tr align="center">
			<th>&nbsp;&nbsp;현재 암호 입력</th>
			<td><input type="password" name="pass1"></td>
		</tr>
		
		<tr align="center">
			<th>&nbsp;&nbsp;새로운 암호 입력</th>
			<td><input type="password" name="pass1"></td>
		</tr>
		
		<tr align="center">
			<th>&nbsp;&nbsp;새로운 암호 재입력</th>
			<td><input type="password" name="pass1"></td>
		</tr>
	</table>
	<div class="button1" style="margin-left:320px;">
	<button type="submit">비밀번호 변경하기</button>
	<button type="button" onclick="later()">나중에 변경하기</button>
	</div>
</form>
<script>
function later() {
	window.close();
	window.loctaion.href='index.jsp?main=myPage/mypage.jsp'
}

</script>



</body>
</html>