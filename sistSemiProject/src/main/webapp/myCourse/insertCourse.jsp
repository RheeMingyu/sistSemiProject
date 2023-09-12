<%@page import="data.dto.MyCourseDto"%>
<%@page import="data.dao.MyCourseDao"%>
<%@page import="data.dao.TempSaveDao"%>
<%@page import="data.dao.TourSpotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	// 나만의 코스에 데이터 추가하는 jsp파일
    // 클라이언트로부터 전달된 데이터 가져오기
    //String spotName = request.getParameter("spotName");
    String courseName = request.getParameter("courseName");
    String selNum = request.getParameter("selNum");
    String memId = request.getParameter("memId");
    String intro = request.getParameter("intro");
    String tour_seq = request.getParameter("tour_seq");
    String mainPhoto = request.getParameter("mainPhoto");
    String day = request.getParameter("day");
    //System.out.println(selNum);
    
    
	MyCourseDto myCourseDto = new MyCourseDto();
	
	
	//myCourseDto.setName(spotName);
	myCourseDto.setName(courseName);
	myCourseDto.setTurn(selNum);
	myCourseDto.setId(memId);
	myCourseDto.setIntro(intro);
	myCourseDto.setTour_seq(tour_seq);
	myCourseDto.setMainPhoto(mainPhoto);
	myCourseDto.setDay(day);
	
	
	MyCourseDao myCourseDao = new MyCourseDao();
	myCourseDao.insertMyCourse(myCourseDto);
	
	
	TempSaveDao tempSaveDao = new TempSaveDao();
	/*  나만의 코스 만들기 누르면 화면에 있는 테이블 비우기 */
	tempSaveDao.deleteTemp();
    
%>