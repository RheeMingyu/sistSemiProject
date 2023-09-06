<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.dto.SearchResult"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.SearchDao_v3"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Pen+Script&family=Noto+Serif+KR:wght@200&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
</head>
<style>
	ul.left-tab{
		float: left;
	}
	ul.right-tab{
		float: right;
	}
	div.tab-pane{
		position: absolute;
		top: 130px;
		left: 40px;
	}
</style>
<script>
	$(function(){
		$("button.v").click(function(){
			$("div.col-md-6").attr("class","forColMd");
		});
		$("button.h").click(function(){
			$("div.forColMd").attr("class","forColMd col-md-6");
		});
	});
</script>
<body>
	<%!
	public String translation(String table) {
		String tableName="";
		
		if(table.equals("tourspot")){tableName="관광지";}
		else if(table.equals("mycourse")){tableName="나만의코스";}
		else if(table.equals("recomcourse")){tableName="추천코스";}
		else if(table.equals("tourreview")){tableName="리뷰";}
		else{tableName="비회원리뷰";}
		
		return tableName;
	}%>
	<%
	String sortidx=(request.getParameter("sortidx")!=null?request.getParameter("sortidx"):"");
	List<String> tables=new ArrayList<String>();
	
	if(sortidx.equals("0")||sortidx.equals("")){tables.add("tourspot");tables.add("mycourse");tables.add("recomcourse");tables.add("tourreview");tables.add("guestreview");}
	else if(sortidx.equals("1")){tables.add("tourspot");}
	else if(sortidx.equals("2")){tables.add("mycourse");}
	else if(sortidx.equals("3")){tables.add("recomcourse");}
	else if(sortidx.equals("4")){tables.add("tourreview");}
	else if(sortidx.equals("5")){tables.add("guestreview");}

	//String inputWords=(request.getParameter("inputWords")==null?"":request.getParameter("inputWords"));
	String inputWords="좋은 해수욕장 추천";
	SearchDao_v3 searchDao=new SearchDao_v3();
	
	int totalCount=searchDao.getTotalCount(inputWords,tables);
	int totalPage;
	int startPage;
	int endPage;
	int startNum;
	int perPage=3;
	int perBlock=5;
	int currentPage;
	
	if(request.getParameter("currentPage")==null)
		currentPage=1;
	else
		currentPage=Integer.parseInt(request.getParameter("currentPage"));

	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

	startPage=(currentPage-1)/perBlock*perBlock+1;
	     
	endPage=startPage+perBlock-1;

	if(endPage>totalPage)
		endPage=totalPage;

	startNum=(currentPage-1)*perPage;
	%>
	<div>
		<div style="margin: 0px 50px 0px 50px"><br>
			<nav class="navbar navbar-expand-sm bg-light navbar-light">
				<div class="container-fluid">
					<div class="collapse navbar-collapse" id="collapsibleNavbar">
						<ul class="navbar-nav">
							<li class="nav-item">
								<a class="nav-link" href="index.jsp?main=search/searchBoard_3.jsp?sortidx=0&currentPage=<%=currentPage%>">전체</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="index.jsp?main=search/searchBoard_3.jsp?sortidx=1&currentPage=<%=currentPage%>">관광지</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="index.jsp?main=search/searchBoard_3.jsp?sortidx=2&currentPage=<%=currentPage%>">나만의코스</a>
							</li>
							<li class="nav-item">
								<a class="nav-link " href="index.jsp?main=search/searchBoard_3.jsp?sortidx=3&currentPage=<%=currentPage%>">추천코스</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="index.jsp?main=search/searchBoard_3.jsp?sortidx=4&currentPage=<%=currentPage%>">리뷰</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="index.jsp?main=search/searchBoard_3.jsp?sortidx=5&currentPage=<%=currentPage%>">비회원리뷰</a>
							</li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
		
		<div class="container mt-3">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs left-tab">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item">
					<button type="button" class="btn btn-outline-info btn-sm v"><i class="bi bi-arrow-down-up"></i></button>
				</li>&nbsp;
				<li class="nav-item">
					<button type="button" class="btn btn-outline-info btn-sm h"><i class="bi bi-arrow-left-right"></i></button>
				</li>
			</ul>
			<ul class="nav nav-tabs right-tab">
				<li class="nav-item">
					<a class="nav-link active sortBtn1" data-bs-toggle="tab" href="#tabs1">관련도순</a>
				</li>
				<li class="nav-item">
					<a class="nav-link sortBtn2" data-bs-toggle="tab" href="#tabs2">최신순</a>
				</li>
				<li class="nav-item">
					<a class="nav-link sortBtn3" data-bs-toggle="tab" href="#tabs3">인기순</a>
				</li>
			</ul>
		</div>
	</div>
	<div class="tab-content">
		<div id="tabs1" class="container tab-pane fade row"><br>
			<%List<HashMap<String,HashMap<String,String>>> list_relevance=searchDao.searchInputWordsInWholeTablesWithStatistics(inputWords, tables, startNum, perPage, 1);
			for(int i=0;i<list_relevance.size();i++)
			{
				HashMap<String,HashMap<String,String>> tableMap=list_relevance.get(i);
				
				for(String table:tables)
				{
					String columns=searchDao.searchColumnNamesInEachTables(table);
					String [] columnsArr=columns.split(",");
					
					if(tableMap.get(table)==null){continue;}
					else
					{
						HashMap<String,String> map=tableMap.get(table);%>
						<div class="forColMd">
						<table>
							<caption align="top"><%=table %></caption>
							<tr>
								<th>사진</th><th>컬럼</th><th>데이터</th>
							</tr>
							<%String photo="";
							for(String column:columnsArr){
								if(column.equals("photo")){photo=map.get("photo");}
							}
							for(String column:columnsArr)
							{int j=0;%>
								<tr>
									<%if(j==0&&!photo.equals("")){%>
										<td rowspan="<%=columnsArr.length%>"><img src="save/<%=photo %>"></td>
									<%}else if(j==0&&photo.equals("")){%>
										<td rowspan="<%=columnsArr.length%>"><img src="no_image/"></td>
									<%}%>
									<td><%=column %></td>
									<td><%=map.get(column) %></td>
								</tr>	
							<%j++;}%>
					</table>
					</div>
					<%}
				}
			}%>
		</div>
		<div id="tabs2" class="container tab-pane fade"><br>
			<%List<HashMap<String,HashMap<String,String>>> list_latest=searchDao.searchInputWordsInWholeTablesWithStatistics(inputWords, tables, startNum, perPage, 2);
			for(int i=0;i<list_latest.size();i++)
			{
				HashMap<String,HashMap<String,String>> tableMap=list_latest.get(i);
				
				for(String table:tables)
				{
					String columns=searchDao.searchColumnNamesInEachTables(table);
					String [] columnsArr=columns.split(",");
					
					if(tableMap.get(table)==null){continue;}
					else
					{
						HashMap<String,String> map=tableMap.get(table);%>
						<div class="forColMd">
						<table>
							<caption align="top"><%=table %></caption>
							<tr>
								<th>사진</th><th>컬럼</th><th>데이터</th>
							</tr>
							<%String photo="";
							for(String column:columnsArr){
								if(column.equals("photo")){photo=map.get("photo");}
							}
							for(String column:columnsArr)
							{int j=0;%>
								<tr>
									<%if(j==0&&!photo.equals("")){%>
										<td rowspan="<%=columnsArr.length%>"><img src="save/<%=photo %>"></td>
									<%}else if(j==0&&photo.equals("")){%>
										<td rowspan="<%=columnsArr.length%>"><img src="no_image/"></td>
									<%}%>
									<td><%=column %></td>
									<td><%=map.get(column) %></td>
								</tr>	
							<%j++;}%>
					</table>
					</div>
					<%}
				}
			}%>
		</div>
		<div id="tabs3" class="container tab-pane fade"><br>
			<%List<HashMap<String,HashMap<String,String>>> list_popularity=searchDao.searchInputWordsInWholeTablesWithStatistics(inputWords, tables, startNum, perPage, 3);
			for(int i=0;i<list_popularity.size();i++)
			{
				HashMap<String,HashMap<String,String>> tableMap=list_popularity.get(i);
				
				for(String table:tables)
				{
					String columns=searchDao.searchColumnNamesInEachTables(table);
					String [] columnsArr=columns.split(",");
					
					if(tableMap.get(table)==null){continue;}
					else
					{
						HashMap<String,String> map=tableMap.get(table);%>
						<div class="forColMd">
						<table>
							<caption align="top"><%=table %></caption>
							<tr>
								<th>사진</th><th>컬럼</th><th>데이터</th>
							</tr>
							<%String photo="";
							for(String column:columnsArr){
								if(column.equals("photo")){photo=map.get("photo");}
							}
							for(String column:columnsArr)
							{int j=0;%>
								<tr>
									<%if(j==0&&!photo.equals("")){%>
										<td rowspan="<%=columnsArr.length%>"><img src="save/<%=photo %>"></td>
									<%}else if(j==0&&photo.equals("")){%>
										<td rowspan="<%=columnsArr.length%>"><img src="no_image/"></td>
									<%}%>
									<td><%=column %></td>
									<td><%=map.get(column) %></td>
								</tr>	
							<%j++;}%>
					</table>
					</div>
					<%}
				}
			}%>
		</div>
		
		<div style="width: 600px;text-align: center">
			<ul class="pagination justify-content-center">
				<%
				if(startPage>1)
				{%>
					<li>
						<a href="index.jsp?main=search/searchBoard_3.jsp?currentPage=<%=startPage-1%>" class="page-link">이전</a>
					</li>
				<%}			
				for(int pp=startPage;pp<=endPage;pp++)
				{
					if(pp==currentPage)
					{%>
						<li class="page-item active">
							<a href="index.jsp?main=search/searchBoard_3.jsp?currentPage=<%=pp%>" class="page-link"><%=pp %></a>
						</li>
					<%}else
					{%>
						<li>
							<a href="index.jsp?main=search/searchBoard_3.jsp?currentPage=<%=pp%>" class="page-link"><%=pp %></a>
						</li>
					<%}
				}
				if(endPage<totalPage)
				{%>
					<li>
						<a href="index.jsp?main=search/searchBoard_3.jsp?currentPage=<%=endPage+1%>" class="page-link">다음</a>
					</li>
				<%}	
				%>
			</ul>
		</div>
	</div>
</body>
</html>