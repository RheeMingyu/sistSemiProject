<%@page import="data.dao.TourSpotDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.TourSpotDto"%>
<%@page import="data.dto.CourseDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.RecomCourseDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

// dao 호출
TourSpotDao TourSpotDao=new TourSpotDao();

String seq=request.getParameter("seq");
String num=request.getParameter("num");

TourSpotDto tdto=TourSpotDao.getdata(seq);

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

	
	JSONObject ob=new JSONObject();
	
	ob.put("num",num);
	ob.put("seq",tdto.getSeq());
	ob.put("name",tdto.getName());
	ob.put("hp",tdto.getHp());
	ob.put("addr",tdto.getAddr());
	ob.put("photo",tdto.getPhoto());
	ob.put("intro",tdto.getIntro());
	ob.put("area",tdto.getArea());
	ob.put("theme",tdto.getTheme());
	ob.put("main_cat",tdto.getMain_cat());
	ob.put("sub_cat",tdto.getSub_cat());
	ob.put("note",tdto.getNote());
	ob.put("price",tdto.getPrice());
	ob.put("writeday",sdf.format(tdto.getWriteday()));
	
	/* ob.put("writeday",sdf.format(tdto.getWriteday())); */
	
%>

<%=ob.toString() %>


