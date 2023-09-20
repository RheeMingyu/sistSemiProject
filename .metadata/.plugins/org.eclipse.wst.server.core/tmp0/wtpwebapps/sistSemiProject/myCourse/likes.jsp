<%@page import="data.dto.LikesDto"%>
<%@page import="data.dao.LikesDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String myid = request.getParameter("myid");
int seq = Integer.parseInt(request.getParameter("tour_seq"));


LikesDto likesdto = new LikesDto();

likesdto.setId(myid);
likesdto.setSeq(seq);


LikesDao likesDao = new LikesDao();


if(likesDao.isLikeCheck(myid, seq)==1){
	likesDao.deleteLike(myid, seq);
}else{
	likesDao.insertLike(likesdto);
}

%>

