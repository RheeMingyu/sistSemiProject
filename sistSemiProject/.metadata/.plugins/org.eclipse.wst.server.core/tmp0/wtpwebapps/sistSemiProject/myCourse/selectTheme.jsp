<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//선택한 테마로 변경하는 jsp파일
String selTheme = request.getParameter("selTheme");
//System.out.println(seltheme);
response.sendRedirect("../index.jsp?main=myCourse/myCourseMap.jsp&selTheme="+selTheme);

%>

