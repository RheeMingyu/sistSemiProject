<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.PopularSearchesDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");

	JSONArray arr=new JSONArray();
	JSONObject ob=new JSONObject();

	String ageRange=request.getParameter("age");

	PopularSearchesDao popularSearchDao=new PopularSearchesDao();
	
	List<String> age=popularSearchDao.popularAmongAge(ageRange);
	
	for(String a:age)
	{
		int i=1;
		ob.put("score"+i, a);
		i++;
	}
	arr.add(ob);
%>
<%=arr.toString()%>