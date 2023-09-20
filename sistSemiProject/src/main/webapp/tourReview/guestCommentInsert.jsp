<%@page import="data.dao.GuestCommentDao"%>
<%@page import="data.dto.GuestCommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	GuestCommentDto dto = new GuestCommentDto();
	GuestCommentDao dao = new GuestCommentDao();
	
	String com_seq = request.getParameter("com_seq");
	String writer = request.getParameter("writer");
	String pass = request.getParameter("pass");
	String guestcomment = request.getParameter("content");
	
	String currentPage=request.getParameter("currentPage");
	
	dto.setCom_seq(com_seq);
	dto.setWriter(writer);
	dto.setPass(pass);
	dto.setGuestcomment(guestcomment);
	
	dao.insertGuestComment(dto);
	
	response.sendRedirect("../index.jsp?main=tourReview/logoutTourSpotReviewList.jsp?currentPage="+currentPage+"#id"+com_seq);
	
	
%>