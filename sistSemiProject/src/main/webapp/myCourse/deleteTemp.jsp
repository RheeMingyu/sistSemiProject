<%@page import="data.dao.TempSaveDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
TempSaveDao tempSaveDao = new TempSaveDao();
tempSaveDao.deleteTemp();

%>