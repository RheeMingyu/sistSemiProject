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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
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
			GuestReviewDto guestreviewdto = list.get(i);
		%>
		<div class="table table-bordered"
			style="width: 1135px; margin-left: 180px; padding: 20px; ">
			<tr>
				<div class="row">
					<div class="col-md-8">
						<%=no--%>
						<a style="font-size: 0.9em">&nbsp;&nbsp;<i
							class="bi bi-person-circle" style="font-size: 30px;"></i>&nbsp;&nbsp;&nbsp;<%=guestreviewdto.getNickname()%></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>&nbsp;&nbsp;<%=guestreviewdto.getTitle()%></b>
					</div>
					<div class="col-md-4 text-end">
						<td>
							<div float="right;">
								<a style="font-size: 0.7em; color: gray;">좋아요</a>&nbsp;<i
									class="bi bi-hand-thumbs-up" style="color: gray;"></i>&nbsp;&nbsp;&nbsp;<span class="likes"><%=guestreviewdto.getLikes()%></span>
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

			<td>내용&nbsp;&nbsp;<%=guestreviewdto.getContent()%></td> <br> <br>
			<br>
		</div>
		<%
					//각 방명록에 달린 댓글 목록 가져오기
					GuestCommentDao guestcommentdao = new GuestCommentDao();
					GuestCommentDto guestcommentdto = new GuestCommentDto();
					List<GuestCommentDto> glist = guestcommentdao.getAllGuestComments(guestcommentdto.getCom_seq());
					String writer = request.getParameter("writer");
					String pass2 = request.getParameter("pass2");
					%>


		<form action="tourReview/guestCommentInsert.jsp" method="post">

			<div class="d-flex">
				<textarea style="width: 1000px; height: 120px; margin-right: 50px;"
					name="content" required="required" class="form-control"></textarea>
				<button type="submit" class="btn btn-success"
					style="width: 70px; background-color: orange; height: 70px; margin-bottom: 40px;">등록</button>
				<!--hidden값 3개-->
			</div>
			<input type="hidden" name="com_seq"
				value="<%=guestcommentdto.getCom_seq()%>"> <input
				type="hidden" name="writer" value="<%=guestcommentdto.getWriter()%>">
			<input type="hidden" name="currentPage" value="<%=currentPage%>">
			</td>
			</tr>
	
		</tr>
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

				<%
				}

				for (int pp = startPage; pp <= endPage; pp++) {
				if (pp == currentPage) {
				%>

				<li class="page-item active"><a class="page-link"
					href="tourReview/logoutTourSpotReviewList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
				<%
				} else {
				%>
				<li class="page-item"><a class="page-link"
					href="tourReview/logoutTourSpotReviewList.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
				<%
				}
				
				if (endPage < totalPage) {
					%>
				<li class="page-item"><a class="page-link" aria-label="Next"
					href="tourReview/logoutTourSpotReviewList.jsp?currentPage=<%=endPage+1 %>">
						<span aria-hidden="true">&raquo;</span>
				</a></li>

				<%}
				}
 %>

			</ul>
		</div>

	</table>
</body>
</html>