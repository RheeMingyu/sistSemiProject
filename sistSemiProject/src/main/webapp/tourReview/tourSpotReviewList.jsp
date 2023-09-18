<%@page import="data.dao.MemberCommentDao"%>
<%@page import="data.dto.MemberCommentDto"%>
<%@page import="data.dto.MemberDto"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page
	import="org.eclipse.jdt.internal.compiler.env.NameEnvironmentAnswer"%>
<%@page import="java.util.jar.Attributes.Name"%>
<%@page import="javax.swing.text.html.parser.DTD"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.TourReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.TourSpotReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Dongle:wght@300&family=Gamja+Flower&family=Gowun+Batang&family=Gowun+Dodum&family=Hi+Melody&family=Nanum+Gothic&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Poor+Story&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<%


//로그인 상태 확인후 입력폼 나타낼것_회원만 보이게
String loginok = (String) session.getAttribute("loginok");
TourSpotReviewDao dao = new TourSpotReviewDao();

int totalCount = dao.getTotalCount(); //전체갯수
int totalPage; //총 페이지수
int startPage; //각 블럭에서 보여질 시작페이지
int endPage; //각 블럭에서 보여질 끝페이지
int start; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
int perpage = 3; //한 페이지당 보여질 글의갯수
int perBlock = 5; //한 페이지당 보여질 페이지 갯수
int currentPage; //현재 페이지
int no; //각페이지당 출력할 시작번호
int startNum; //각페이지에서 보여질 시작번호

//현재페이지 읽기(단 null일경우는 1페이지로 준다)계산을 해야하므로 int로 형변환해줌
if (request.getParameter("currentPage") == null)
	currentPage = 1;

else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지수 구하기
//총 글의갯수/한페이지당 보여질 개수로 나눔(7/5=1)
//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지)
totalPage = totalCount / perpage + (totalCount % perpage == 0 ? 0 : 1);

//각 블럭당 보여야할 시작페이지
//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
//현재페이지 13 시작:11 끝:15
startPage = (currentPage - 1) / perBlock * perBlock + 1; // (12/5)*5 +1=11

endPage = startPage + perBlock - 1;

//총페이지가 23일경우 마지막블럭은 25가아니라 23이다
if (endPage > totalPage)
	endPage = totalPage;

//각페이지에서 보여질 시작번호
//1페이지: 0, 2페이지 :5, 3페이지 :10...
startNum = (currentPage - 1) * perpage;

//각페이지당 출력할 시작번호 구하기
//총글개수가 23이면 1페이지 23, 2 페이지 18, 3페이지 13......
//no=totalCount-(currentPage-1)*perPage;
no = totalCount - startNum;

//각페이지 필요한 게시글 자겨오기
List<TourReviewDto> list = dao.getList(startNum, perpage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

//마지막 페이지 남은 한개글 지우면 빈페이지만 남는다.(해결책)이전페이지로간다

if (list.size() == 0 && currentPage != 1) {
%>
<script type="text/javascript">
location.href="index.jsp?main=tourReview/tourReviewList.jsp?currentPage=<%=currentPage -1%>
	";
</script>
<%


}
%>
<body>
	<%


		if(loginok!=null)
		{
	%>
	<jsp:include page="tourSpotReviewForm.jsp" />
	<hr align="left" width="700px;">
	<%
	

		}else{
	%>
	<jsp:include page="logoutTourSpotReviewForm.jsp" />
	<hr align="left" width="700px;">
	<%
	

		}
	%>
	<div>
		<b>총 <%=totalCount %>개의 게시글이 있습니다
		</b> <br> <br> <br>
		<%
		

			MemberDao memberdao = new MemberDao();
			for(TourReviewDto dto:list)
			{
				String name = memberdao.getName(dto.getId());
		%>
		<table class="table table-bordered" style="width: 1200px;">
			<tr>
				<td><b><i class="bi bi-person-square"></i><%=name%>(<%=dto.getId()%>)</b>
					<%
										//로그인한 아이디
										String id=(String)session.getAttribute("id");
									
									//로그인한 아이디와 글쓴아이디가 같을 경우에만 수정, 삭제
									if(loginok!=null&&dto.getId().equals(id)||loginok!=null&&id.equals("admin")){
					%> <a
					href="index.jsp?main=tourReview/tourSpotReviewUpdateForm.jsp?seq=<%=dto.getTour_seq()%>&currentPage=<%=currentPage%>"
					style="coler: green"><i class="bi bi-pencil-square"></i></a> <a
					href="tourReview/tourSpotReviewDelete.jsp?num=<%=dto.getTour_seq()%>&currentPage=<%=currentPage%>"
					style="color: red"><i class="bi bi-trash-fill"></i></a> <%
 
   
  	}
 %> <span class="day"><%=sdf.format(dto.getWriteday())%></span></td>
			</tr>

			<tr>
				<td>
		<%
	

			MemberCommentDao Dao = new MemberCommentDao();
			List<MemberCommentDto> memberCommentlist=Dao.getAllMemberComments(dto.getTour_seq());		
		%> 
		
<%
if(loginok!=null){
%>
					<div class="tourspotreviewform">
						<form action="tourReview/memberCommentInsert.jsp" method="post">
							<table class="table table-bordered" style="width:1000px;">
								<tr>
									<td><textarea style="width: 800px; height: 100px"
											name="content" required="required" class="form-control"></textarea>
									</td>
									<td>
										<button type="submit" class="btn btn-success">등록</button> <input
										type="hidden" name="tour_seq" value="<%=dto.getTour_seq() %>">
										<input type="hidden" name="id" value="<%=dto.getId() %>">
										<input type="hidden" name="currentPage"
										value="<%=currentPage %>">
									</td>
								</tr>
							</table>
						</form>
					</div> 
					<%
					}
					%>
				</td>
			</tr>
		</table>
		<%} 
		%>
	</div>


</div>
</body>
</html>