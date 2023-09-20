<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourSpotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String main_cat=request.getParameter("main_cat");

TourSpotDao dao=new TourSpotDao();
List<String> list=dao.getSpotFromTheme(main_cat);


JSONArray arr=new JSONArray();

int i=0;
for(String l:list)
{
	
	JSONObject ob=new JSONObject();
	ob.put("idx",i);
	ob.put("name",l);
	
	System.out.println("ddd:"+l);
	arr.add(i, ob);
	i++;
}

%>
<%=arr.toString() %>