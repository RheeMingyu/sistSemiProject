<%@page import="data.dto.AdminBoardDto"%>
<%@page import="data.dao.AdminBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <html>
<head>
</head>

<body>
<%
request.setCharacterEncoding("utf-8");

String myid = (String)session.getAttribute("myid");

String content = request.getParameter("content");
String subject = request.getParameter("subject");

AdminBoardDto dto = new AdminBoardDto();

AdminBoardDao dao = new AdminBoardDao();

dto.setId(myid);
dto.setContent(content);
dto.setSubject(subject);

dao.insertBoard(dto);
%>

<%
response.sendRedirect("../index.jsp?main=admin/adminBoard.jsp");
%>
<script>
	alert("등록이 완료되었습니다.");
</script>
</body>
</html>