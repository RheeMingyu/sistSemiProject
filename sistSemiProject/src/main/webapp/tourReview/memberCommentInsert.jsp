<%@page import="data.dao.MemberCommentDao"%>
<%@page import="data.dto.MemberCommentDto"%>
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
</head>
<body>
<% 
	request.setCharacterEncoding("utf-8");

	MemberCommentDto dto = new MemberCommentDto();
	MemberCommentDao dao = new MemberCommentDao();
	
	String com_seq = request.getParameter("com_seq");
	String id = request.getParameter("id");
	String membercomment = request.getParameter("content");
	
	String currentPage=request.getParameter("currentPage");
	
	dto.setCom_seq(com_seq);
	dto.setId(id);
	dto.setMembercomment(membercomment);
	
	dao.insertMemberComment(dto);
	
	response.sendRedirect("../index.jsp?main=tourReview/tourSpotReviewList.jsp?currentPage="+currentPage+"#id"+com_seq);
	
	
%>
</body>
</html>