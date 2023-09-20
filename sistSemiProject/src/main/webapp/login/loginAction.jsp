<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String cbsave = request.getParameter("cbsave");
String sesave = request.getParameter("sesave");

MemberDao dao = new MemberDao();
boolean Logincheck = dao.isIdPass(id,pass);

if(Logincheck) {
   session.setMaxInactiveInterval(60*60*5);
   session.setAttribute("loginok", "yes");
   session.setAttribute("myid", id);
   session.setAttribute("saveok", cbsave==null?null:"yes");
   //session.setAttribute("sesave", sesave==null?null:"yes");
   
   response.sendRedirect("../index.jsp?main=login/loginMain.jsp");
}

else {
%>

<script>
   alert("아이디와 비번이 맞지 않습니다.");
   history.back();
</script>

<%   
System.out.println(Logincheck);
}
%>