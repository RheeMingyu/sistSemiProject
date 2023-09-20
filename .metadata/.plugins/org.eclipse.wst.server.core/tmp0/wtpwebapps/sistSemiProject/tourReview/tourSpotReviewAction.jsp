<%@page import="data.dao.TourSpotReviewDao"%>
<%@page import="data.dto.TourReviewDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String id=(String)session.getAttribute("id");

	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*3;
	
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8");
	
	String content=multi.getParameter("content");
	String photo=multi.getFilesystemName("photo");
	
	TourReviewDto dto=new TourReviewDto();
	dto.setId(id);
	dto.setContent(content);
	dto.setPhoto(photo);
	
	TourSpotReviewDao dao = new TourSpotReviewDao();
	
	dao.insertTourReview(dto);
	
	response.sendRedirect("../index.jsp?main=tourReview/tourReviewList.jsp");
	}catch(Exception e){
	}
%>
</body>
</html>