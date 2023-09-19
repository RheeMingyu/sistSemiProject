<%@page import="data.dao.TourSpotReviewDao"%>
<%@page import="data.dto.TourReviewDto"%>
<%@page import="data.dto.GuestReviewDto"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestTourSpotReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	/* String numString = request.getParameter("num");

	
	if(numString != null && !numString.isEmpty()){
		
		//dao
		GuestTourSpotReviewDao dao=new GuestTourSpotReviewDao();
		
		// numString을 인수로 사용하여 updateLikes 메서드 호출
		dao.updateLikes(numString);
		
		 // numString을 다시 정수로 변환
        int num = Integer.parseInt(numString);
		 
        // 증가된 likes값을 json형식으로 변환
        GuestReviewDto review=dao.getData(Integer.toString(num));
       String likes = review.getLikes();
        
        JSONObject ob = new JSONObject();
        ob.put("likes", likes);
        
        // JSON 응답 출력
        response.setContentType("application/json");
        response.getWriter().write(ob.toString());
    } else {
        // numString이 유효하지 않은 경우 오류 처리
        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        response.getWriter().write("Invalid num parameter");
		
	
	}
	
	  // 'ob' 변수를 'if' 블록 외부에서도 사용하려면 여기서 정의해야 함
    JSONObject ob = new JSONObject();
    ob.put("likes", 0);  */
	
	String num=request.getParameter("num");
	 //dao
	GuestTourSpotReviewDao dao=new GuestTourSpotReviewDao();
	TourSpotReviewDao tourspotreviewdao = new TourSpotReviewDao();
	
	dao.updateLikes(num);
	
	/* int likes=dao.getData(num).getLikes(); */
	int likes=Integer.parseInt(tourspotreviewdao.getData(num).getLikes());
	
	
	JSONObject ob=new JSONObject();
	ob.put("likes",likes);
	
	
%>
<%=ob.toString() %> 