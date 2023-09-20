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

String areaSel=request.getParameter("area");

PopularSearchesDao popularSearchDao=new PopularSearchesDao();

List<String> area=popularSearchDao.popularAmongArea(areaSel);

for(String a:area)
{	
	int i=1;
	ob.put("score"+i, a);
	i++;
}
arr.add(ob);
%>
<%=arr.toString()%>