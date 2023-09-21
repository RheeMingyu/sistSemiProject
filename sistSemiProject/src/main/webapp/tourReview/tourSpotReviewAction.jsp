<%@page import="data.dao.TourSpotDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="data.dao.TourSpotReviewDao"%>
<%@page import="data.dto.TourReviewDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	request.setCharacterEncoding("utf-8");
	String id=(String)session.getAttribute("myid");

	String realPath=getServletContext().getRealPath("/save");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*3;
	
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
	
	TourSpotReviewDao dao = new TourSpotReviewDao();
	TourSpotDao tourspotdao = new TourSpotDao();
	
	String op_val=multi.getParameter("op_val");
	System.out.println(op_val);
	String seq = tourspotdao.getSeq(op_val);
	
	
	//String id=multi.getParameter("id");
	String title=multi.getParameter("title");
	String viewcount=multi.getParameter("viewcount");
	String likes=multi.getParameter("likes");
	String photo=multi.getFilesystemName("photo");
	String content=multi.getParameter("content");
	String stars=multi.getParameter("stars");
	

	TourReviewDto dto=new TourReviewDto();
	
	dto.setTour_seq(seq);
	dto.setId(id);
	dto.setContent(content);
	dto.setPhoto(photo);
	dto.setTitle(title);
	dto.setViewcount(viewcount);
	dto.setLikes(likes);
	dto.setStars(stars);
	
	dao.insertTourReview(dto);
	
	response.sendRedirect("../index.jsp?main=tourReview/tourSpotReviewList.jsp");
	}catch(Exception e){
		
		
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