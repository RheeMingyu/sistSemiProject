<%@page import="data.dto.TourReviewDto"%>
<%@page import="data.dao.TourSpotDao"%>
<%@page import="data.dao.TourSpotReviewDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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

   request.setCharacterEncoding("utf-8");
   String id=(String)session.getAttribute("id");

   String realPath=getServletContext().getRealPath("/save");
   System.out.println(realPath);
   
   int uploadSize=1024*1024*3;
   
   MultipartRequest multi=null;
   
   try{
   multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
   
   TourSpotReviewDao tourspotreviewdao = new TourSpotReviewDao();
   TourSpotDao tourspotdao = new TourSpotDao();
   
   String com_seq=multi.getParameter("com_seq");
   
   
   /* String id=multi.getParameter("id"); */
   String title=multi.getParameter("title");
   String content=multi.getParameter("content");
   String stars=multi.getParameter("stars");
   
   System.out.println(com_seq+" , "+title+" , "+content+" , "+stars);
   

   TourReviewDto dto=new TourReviewDto();
   
   dto.setTour_seq(com_seq);
   dto.setId(id);
   dto.setContent(content);
   dto.setTitle(title);
   dto.setStars(stars);
   
   tourspotreviewdao.updateTourReview(dto);
   
   response.sendRedirect("../index.jsp?main=tourReview/tourSpotReviewList.jsp");
   }catch(Exception e){
      System.out.println(e.getMessage());
      
   }
   

   
   /* dto.setTitle(multi.getParameter("title"));
   dto.setViewcount(multi.getParameter("viewcount"));
   dto.setContent(multi.getParameter("content"));
   dto.setPhoto("save/"+multi.getParameter("photo"));
   dto.setLikes(multi.getParameter("likes"));
   dto.setStars(multi.getParameter("stars"));
   
   TourSpotReviewDao dao = new TourSpotReviewDao();
   
   dao.insertTourReview(dto);
   
   response.sendRedirect("../index.jsp?main=tourReview/tourReviewList.jsp");
   }catch(Exception e){
      e.printStackTrace();
   } */
   
   
%>
</body>
</html>