<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>나의 일정</title>
<%
	request.setCharacterEncoding("utf-8");

	Calendar cal = Calendar.getInstance();
	
	// 시스템 오늘날짜
	int ty = cal.get(Calendar.YEAR);
	int tm = cal.get(Calendar.MONTH)+1;
	int td = cal.get(Calendar.DATE);
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	// 파라미터 받기
	String sy = request.getParameter("year");
	String sm = request.getParameter("month");
	
	if(sy!=null) { // 넘어온 파라미터가 있으면
		year = Integer.parseInt(sy);
	}
	if(sm!=null) {
		month = Integer.parseInt(sm);
	}
	
	cal.set(year, month-1, 1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	
	int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)
%>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
body * { 
 font-family: 'Jeju Gothic', sans-serif;
 background-color: 
}

*{
	margin: 0; padding: 0;
    box-sizing: border-box;
}

body {
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}

a {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: #F28011;
}

.calendar {
  width: 250px;
  height:250px;
  margin-top: 110px;
  margin-left: 300px;
  
}

.calendar .title1{
	height: 38px;
	line-height: 20px;
	text-align: center;
	font-size:18px;
	font-weight: bold;
}

.calendar .selectField {
	border: 1px solid #999;
	padding: 2px 7px;
	border-radius: 3px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}

.calendar table {
	width: 150px;
	height:150px;
	border-collapse: collapse;
	border-spacing: 0;
}

.calendar table thead tr:first-child{
	background: #f6f6f6;
}

.calendar table td{
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
}

.calendar table td:nth-child(7n+1){
	color: red;
}
.calendar table td:nth-child(7n){
	color: blue;
}
.calendar table td.gray {
	color: #ccc;
}
.calendar table td.today{
	font-weight:700;
	background: #E6FFFF;
}

.calendar .footer{
	height: 25px;
	line-height: 25px;
	text-align: right;
	font-size: 12px;
}

.button {
  background: #3D4C53;
  margin : 20px auto;
  width : 180px;
  height : 35px;
  overflow: hidden;
  text-align : center;
  transition : .2s;
  cursor : pointer;
  border-radius: 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,.2);
}
.btnTwo {
  position : relative;
  width : 200px;
  height : 100px;
  margin-top: -100px;
  padding-top: 2px;
  background : #26A69A;
  left : -250px;
  transition : .3s;
}
.btnText {
  color : white;
  transition : .3s;
}
.btnText2 {
  margin-top : 63px;
  margin-right : -130px;
  color : #FFF;
}
.button:hover .btnTwo{ /*When hovering over .button change .btnTwo*/
  left: -130px;
}
.button:hover .btnText{ /*When hovering over .button change .btnText*/
  margin-left : 65px;
}
.button:active { /*Clicked and held*/
  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
}
</style>

<%
String loginok = (String)session.getAttribute("loginok");
String myid =(String)session.getAttribute("myid");

MemberDao dao = new MemberDao();
String name = dao.getName(myid);

%>

<script type="text/javascript">
$(function(){
	
	$("#content").hide();
	$("#save").hide();

	$("#btnadd").click(function(){
		$("#content").toggle();
		$("#save").toggle(); 
	});
});

function change() {
	var f = document.frm;
	f.action="calendar2.jsp";
	f.submit();
}
</script>

</head>
<body>

<div class="a" style="margin-top:120px; margin-left:300px; width:350px;">
<%


if(loginok!=null) {
%>
	<b style="font-size: 18px; text-decoration: underline;">♥<%=name %>♥</b><b> 님이 로그인 중 입니다 </b><br>
<%	
} else {
%>	
<li><a href="index.jsp?main=login/logoutaction.jsp" style="width: 150px; margin-left: 15px; font-size: 14px;">로그아웃</a>
<%
}
%>	
</div>

<div class="calendar">	
	<div class="title1">
		<a href="calendar.jsp?year=<%=year%>&month=<%=month-1%>">&lt;</a>
		<label><i class="bi bi-calendar-check">&nbsp;</i><%=year%>년 <%=month%>월</label>
		<a href="calendar.jsp?year=<%=year%>&month=<%=month+1%>">&gt;</a>
	</div>
	
	<table>
		<thead>
			<tr>
				<td>일</td>
				<td>월</td>
				<td>화</td>
				<td>수</td>
				<td>목</td>
				<td>금</td>
				<td>토</td>
			</tr>
		</thead>
		<tbody>
<%
			// 1일 앞 달
			Calendar preCal = (Calendar)cal.clone();
			preCal.add(Calendar.DATE, -(week-1));
			int preDate = preCal.get(Calendar.DATE);
			
			out.print("<tr>");
			// 1일 앞 부분
			for(int i=1; i<week; i++) {
				//out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>"+(preDate++)+"</td>");
			}
			
			// 1일부터 말일까지 출력
			int lastDay = cal.getActualMaximum(Calendar.DATE);
			String cls;
			for(int i=1; i<=lastDay; i++) {
				cls = year==ty && month==tm && i==td ? "today":"";
				
				out.print("<td class='"+cls+"'>"+i+"</td>");
				if(lastDay != i && (++week)%7 == 1) {
					out.print("</tr><tr>");
				}
			}
			
			// 마지막 주 마지막 일자 다음 처리
			int n = 1;
			for(int i = (week-1)%7; i<6; i++) {
				// out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>"+(n++)+"</td>");
			}
			out.print("</tr>");
%>		
		</tbody>
	</table>
	
	
	<div>
		<table class="table table-bordered addtext" style="width:256px; height:40px;">
			<tr>
				<td><button type="button" class="btn btn-outline-dark" style="width:100px; height:30px; border:none;" id="btnadd">일정 메모</button></td>
			</tr>
		</table>
	</div>
	
	<%
    LocalDate now = LocalDate.now();
	LocalTime now1 = LocalTime.now();
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH시 mm분 ss초");
	String formatednow = now1.format(formatter);
	
	MemberDto dto = new MemberDto();
	
    %>
		<input type="hidden" name="id" value="<%=dto.getId() %>">
		<textarea style="text-align:left; width:256px; height:300px;" name="content" id="content" style="border-radius:20px; font-size:15px;">
		제목 : 
		</textarea>
		<button type="submit" id="save"  class="btn btn-outline-dark" style="width: 80px; height: 40px;">저장</button>

	
</div> <!-- Calendar 닫는 div -->

<script>
$("#save").click(function(){
	
	var inputData = $("#content").val();
	//alert(inputData);
	
	$.ajax({
        type: "POST", // HTTP 요청 방식 (POST)
        url: "myList/listinsertproc.jsp", // 데이터를 처리할 서버 스크립트 경로
        dataType:"html",
        data: { content: inputData },  // 전송할 데이터
        success: function(response){
        	
        	alert("나의 일정 추가완료");
        	$("#content").val("제목 : ");
		} 
	})
});


</script>

</body>
</html>