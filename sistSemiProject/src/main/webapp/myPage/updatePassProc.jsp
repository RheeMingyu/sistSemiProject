<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String myid = (String)session.getAttribute("myid");
    
    String pass1 = request.getParameter("pass1");
    String pass2 = request.getParameter("pass2");
    String pass3 = request.getParameter("pass3");
    
    MemberDao dao = new MemberDao();
    boolean psChange = false;
    
    if(pass2!=null && pass3!=null && pass2.equals(pass3)) {
		dao.changePassword(myid, pass1, pass3);
	
    } else {
    	System.out.println("안됌ㅅㄱㅋ");
    }
    System.out.println(pass1);
    System.out.println(pass2);
    System.out.println(pass3);
    %>