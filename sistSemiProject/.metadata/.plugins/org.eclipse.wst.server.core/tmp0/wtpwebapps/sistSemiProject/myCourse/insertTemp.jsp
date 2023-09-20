<%@page import="data.dao.TempSaveDao"%>
<%@page import="data.dao.TourSpotDao"%>
<%@page import="data.dto.TempSaveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 선택한 관광지 이름을 임시 저장하는 jsp파일
// 클라이언트로부터 전달된 데이터 가져오기
    String spotName = request.getParameter("spotName");
	String tour_seq = request.getParameter("tour_seq");
	//System.out.println(tour_seq);
	String intro = request.getParameter("intro");
	String photo = request.getParameter("photo");
	
	TempSaveDto tempSaveDto = new TempSaveDto();

	tempSaveDto.setName(spotName);
	tempSaveDto.setTour_seq(tour_seq);
	tempSaveDto.setIntro(intro);
	tempSaveDto.setPhoto(photo);
	
	TempSaveDao tempSaveDao = new TempSaveDao();
	tempSaveDao.insertTemp(tempSaveDto);
%>