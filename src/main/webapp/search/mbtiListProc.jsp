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

String mbti1=request.getParameter("mbti1");
String mbti2=request.getParameter("mbti2");
String mbti3=request.getParameter("mbti3");
String mbti4=request.getParameter("mbti4");

String mbtiName=mbti1+mbti2+mbti3+mbti4;

PopularSearchesDao popularSearchDao=new PopularSearchesDao();

List<String> mbti=popularSearchDao.popularAmongMbti(mbtiName);

for(String m:mbti)
{	
	int i=1;
	ob.put("score"+i, m);
	i++;
}
arr.add(ob);
%>
<%=arr.toString()%>