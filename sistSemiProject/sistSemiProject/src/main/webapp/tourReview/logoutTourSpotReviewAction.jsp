<%@page import="data.dao.TourSpotDao"%>
<%@page import="data.dto.TourSpotDto"%>
<%@page import="data.dao.GuestTourSpotReviewDao"%>
<%@page import="data.dto.GuestReviewDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<% 


request.setCharacterEncoding("utf-8");


String realPath=getServletContext().getRealPath("/save");
System.out.println(realPath);


int uploadSize=1024*1024*5;

MultipartRequest multi=null;


 try{
multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());

//
GuestTourSpotReviewDao dao = new GuestTourSpotReviewDao();
TourSpotDao tourspotdao = new TourSpotDao();

String op_val=multi.getParameter("op_val");
System.out.println(op_val);
String seq = tourspotdao.getSeq(op_val);

String nickname=multi.getParameter("nickname");
System.out.println(nickname);
//
String pass = multi.getParameter("pass");
System.out.println(pass);
String photo = multi.getFilesystemName("photo");
// System.out.println(photo);
String title = multi.getParameter("title");
// System.out.println(title);
String viewcount=multi.getParameter("viewcount");
// System.out.println(viewcount);
String likes=multi.getParameter("likes");
// System.out.println(likes);
String stars=multi.getParameter("stars");
// System.out.println(stars);
String content=multi.getParameter("content");
// System.out.println(content);

// multi 에서는 int가 안되는듯...
// Dto 모두 String 으로 변경했음..
// 이에 맞게 Dao 도 수정함 
/* int stars=Integer.parseInt(multi.getParameter("stars"));
System.out.println(stars); */
/* int viewcount=Integer.parseInt(multi.getParameter("viewcount"));
System.out.println(viewcount);

int likes=Integer.parseInt(multi.getParameter("likes"));
System.out.println(likes);  */

GuestReviewDto dto=new GuestReviewDto();


dto.setTour_seq(seq);
dto.setNickname(nickname);
dto.setPass(pass);
dto.setPhoto(photo);
dto.setTitle(title);
dto.setViewcount(viewcount);
dto.setLikes(likes);
dto.setContent(content);
dto.setStars(stars);


dao.insertGuestReview(dto);

response.sendRedirect("../index.jsp?main=tourReview/logoutTourSpotReviewList.jsp");


 } catch(Exception e){
		
	} 
 
%>

</body>
</html>