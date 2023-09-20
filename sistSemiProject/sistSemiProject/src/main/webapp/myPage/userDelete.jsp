<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	String pass=request.getParameter("pass");

	MemberDto dto = new MemberDto();
	MemberDao dao = new MemberDao();
	dao.findPass(id);
	
	if(pass.equals(dao.findPass(id))) {

		dao.deletePass(pass);
	%>
	<script>
	alert("비밀번호가 일치합니다. 탈퇴를 진행합니다.");
	</script>
		<%
		session.removeAttribute("loginok");
		%>
	<script>
	 window.close();
	</script>
	<%
		response.sendRedirect("../index.jsp");
	} 
	else {
		System.out.println("비밀번호 불일치");
	}
	%>