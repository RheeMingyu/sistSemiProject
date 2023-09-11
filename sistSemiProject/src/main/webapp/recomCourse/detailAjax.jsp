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

String seq = request.getParameter("seq");

TourSpotDto dto=TourSpotDao.getdata(seq);
 
/* JSONArray arr=new JSONArray(); */

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

/* 
for(TourSpotDto dto:tlist){
	 */
	
	JSONObject ob=new JSONObject();
	
	ob.put("seq",dto.getSeq());
	ob.put("name",dto.getName());
	ob.put("hp",dto.getHp());
	ob.put("addr",dto.getAddr());
	ob.put("photo",dto.getPhoto());
	ob.put("intro",dto.getIntro());
	ob.put("area",dto.getArea());
	ob.put("theme",dto.getTheme());
	ob.put("main_cat",dto.getMain_cat());
	ob.put("sub_cat",dto.getSub_cat());
	ob.put("note",dto.getNote());
	ob.put("price",dto.getPrice());
	ob.put("writeday",sdf.format(dto.getWriteday()));
	
	/* arr.add(ob); */
	
	/* ob.put("seq",spotlist.get(i).getSeq());
	ob.put("name",spotlist.get(i).getName());
	ob.put("hp",spotlist.get(i).getHp());
	ob.put("addr",spotlist.get(i).getAddr());
	ob.put("photo",spotlist.get(i).getPhoto());
	ob.put("intro",spotlist.get(i).getIntro());
	ob.put("area",spotlist.get(i).getArea());
	ob.put("theme",spotlist.get(i).getTheme());
	ob.put("main_cat",spotlist.get(i).getMain_cat());
	ob.put("sub_cat",spotlist.get(i).getSub_cat());
	ob.put("note",spotlist.get(i).getNote());
	ob.put("price",spotlist.get(i).getPrice());
	ob.put("writeday",sdf.format(spotlist.get(i).getWriteday())); */
	
/* } */

%>

<%=ob.toString() %>


