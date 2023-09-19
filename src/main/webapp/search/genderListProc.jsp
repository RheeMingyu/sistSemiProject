<%@page import="java.util.List"%>
<%@page import="data.dao.PopularSearchesDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("utf-8");

JSONArray arr=new JSONArray();
JSONObject ob=new JSONObject();

String genderSel=request.getParameter("gender");

PopularSearchesDao popularSearchDao=new PopularSearchesDao();

List<String> gender=popularSearchDao.popularAmongMbti(genderSel);

for(String g:gender)
{	
	int i=1;
	ob.put("score"+i, g);
	i++;
}
arr.add(ob);
%>
<%=arr.toString()%>