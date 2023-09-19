<%@page import="data.dao.MyCourseDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    

<%
//코스 이름 중복 체크하는 jsp파일
String courseName = request.getParameter("courseName");
String memId = request.getParameter("memId");
MyCourseDao myCourseDao = new MyCourseDao(); 
int count = myCourseDao.isNameCheck(courseName, memId);

JSONObject ob = new JSONObject();
ob.put("count", count);

%>

<%=ob.toString()%>