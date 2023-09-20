<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    request.setCharacterEncoding("utf-8");
    
    String realPath = getServletContext().getRealPath("/save"); //webapp에 save폴더 생성해놔야함
   	System.out.println(realPath); //경로 잘 나오나 찍어보기
   	
	int uploadsize = 1024*1024*10; //10mb로 전송
	
	MultipartRequest multi = null;
	
	try {
		multi = new MultipartRequest(request,realPath,uploadsize,"utf-8",new DefaultFileRenamePolicy());
	
		String id = multi.getParameter("id");
		String name = multi.getParameter("name");
		String profile = multi.getFilesystemName("profile"); 
		String pass = multi.getParameter("pass");
		String hp = multi.getParameter("hp");
		String email = multi.getParameter("email");
		String age = multi.getParameter("age");
		String gender = multi.getParameter("gender");
		String area = multi.getParameter("area");
		String mbti = multi.getParameter("mbti");
		
		MemberDao dao =new MemberDao();
		
		//기존 포토 가져오기.
		String preview_photo = dao.getData(id).getProfile();
		
		MemberDto dto =new MemberDto();
		
		dto.setId(id);
		dto.setName(name);
		dto.setProfile(profile==null?preview_photo:profile);
		dto.setPass(pass);
		dto.setHp(hp);
		dto.setEmail(email);
		dto.setAge(age);
		dto.setGender(gender);
		dto.setArea(area);
		dto.setMbti(mbti);
		
		dao.updateMember(dto);
		
		response.sendRedirect("../index.jsp?main=myPage/mypage.jsp?id="+id);
		
	} catch(Exception e ) {
		System.out.println("업로드 오류다 경로 확인해라");
	}
	
	
    %>