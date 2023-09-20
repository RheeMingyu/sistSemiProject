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
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<% 
	String com_seq = request.getParameter("com_seq");
	String currentPage = request.getParameter("currentPage");
	
	GuestTourSpotReviewDao dao= new GuestTourSpotReviewDao();
	
	dao.deleteGuestReview(com_seq);
	
	response.sendRedirect("../index.jsp?main=tourReview/logoutTourSpotReviewList.jsp?com_seq="+com_seq+"&currentPage="+currentPage);
%>
</body>
</html>