<%@page import="data.dao.StatisticsDao"%>
<%@page import="data.dto.StatisticsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String memId = request.getParameter("memId");
String tour_seq = request.getParameter("tour_seq");

StatisticsDto statisticsDto = new StatisticsDto();

/* int cnt = statisticsDto.getSelected_cnt(); */
int cnt;

statisticsDto.setId(memId);
statisticsDto.setTour_seq(tour_seq);


StatisticsDao statisticsDao = new StatisticsDao();


if(statisticsDao.isDataCheck(tour_seq, memId)==1){
	cnt = statisticsDao.selectCnt(tour_seq, memId);
	cnt++;
	statisticsDao.updateStatistics(tour_seq, memId, cnt);
}else{
	statisticsDao.insertStatistics(statisticsDto);
}

%>