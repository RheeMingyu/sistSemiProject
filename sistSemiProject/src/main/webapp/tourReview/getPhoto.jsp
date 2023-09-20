<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.TourSpotDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String op_val=request.getParameter("op_val");

TourSpotDao dao=new TourSpotDao();
String photo=dao.getPhoto(op_val);

JSONObject ob=new JSONObject();

ob.put("photo", photo);
System.out.println(photo);
%>
<%=ob.toString()%>