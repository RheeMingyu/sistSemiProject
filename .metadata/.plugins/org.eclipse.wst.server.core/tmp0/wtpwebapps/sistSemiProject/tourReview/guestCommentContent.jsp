<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestCommentDao"%>
<%@page import="data.dto.GuestCommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String com_seq = request.getParameter("com_seq");
	GuestCommentDao dao= new GuestCommentDao();
	String content = dao.getContent(com_seq);
	
	JSONObject ob = new JSONObject();
	ob.put("com_seq", com_seq);
	ob.put("content", content);
%>
<%=ob.toString()%>