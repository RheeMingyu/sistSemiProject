<%@page import="data.dto.AddListDto"%>
<%@page import="data.dao.AddListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    String myid = (String)session.getAttribute("myid");
    
    request.setCharacterEncoding("utf-8");
    
    String content = request.getParameter("content");
    
	AddListDao dao = new AddListDao();
	AddListDto dto = new AddListDto();
	
    //insert할 값 넣어주기.
    dto.setId(myid);
    dto.setContent(content);
    
	//data insert
    dao.insertlist(dto);
    %>