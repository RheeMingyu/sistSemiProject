<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.TourSpotDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String op_val=request.getParameter("op_val");
String sort=request.getParameter("sort");

TourSpotDao dao=new TourSpotDao();
String photo=dao.getPhoto(op_val);
double avg=dao.getAverageStars(op_val, sort);

JSONObject ob=new JSONObject();

ob.put("photo", photo);
ob.put("avg", avg);
System.out.println("sort"+avg);
%>
<%=ob.toString()%>