<%@page import="data.dao.SearchDao"%>
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
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
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
         $("div.v_align").show();
         $("div.grid_align").hide();
      });
      $("button.h").click(function(){
         $("div.grid_align").show();
         $("div.v_align").hide();
      });
      
      $("div.grid_align").hide();
   });
</script>
<body>
   <%!
   public String translation(String table) {
      String tableName="";
      
      if(table.equals("TourSpot")){tableName="관광지";}
      else if(table.equals("MyCourse")){tableName="나만의코스";}
      else if(table.equals("RecomCourse")){tableName="추천코스";}
      else if(table.equals("TourReview")){tableName="리뷰";}
      else{tableName="비회원리뷰";}
      
      return tableName;
   }%>
   <%
   request.setCharacterEncoding("utf-8");
   String sortidx=(request.getParameter("sortidx")==null||request.getParameter("sortidx").equals("null")?"":request.getParameter("sortidx"));
   List<String> tables=new ArrayList<String>();
   
   if(sortidx.equals("0")||sortidx.equals(""))
   {tables.add("TourSpot");tables.add("MyCourse");tables.add("RecomCourse");tables.add("TourReview");tables.add("GuestReview");}
   else if(sortidx.equals("1")){tables.add("TourSpot");}
   else if(sortidx.equals("2")){tables.add("MyCourse");}
   else if(sortidx.equals("3")){tables.add("RecomCourse");}
   else if(sortidx.equals("4")){tables.add("TourReview");}
   else if(sortidx.equals("5")){tables.add("GuestReview");}

   String inputWords=(request.getParameter("inputWords")==null||request.getParameter("inputWords").equals("null")?"":request.getParameter("inputWords"));
   
   SearchDao_v3 searchDao=new SearchDao_v3();
   
   int totalCount=searchDao.getTotalCount(inputWords,tables);
   int totalPage;
   int startPage;
   int endPage;
   int startNum;
   int perPage=3;
   int perBlock=5;
   int currentPage;
   
   if(request.getParameter("currentPage")==null||request.getParameter("currentPage").equals("null")) {currentPage=1;}
   else {currentPage=Integer.parseInt(request.getParameter("currentPage"));}

   totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

   startPage=(currentPage-1)/perBlock*perBlock+1;
        
   endPage=startPage+perBlock-1;

   if(endPage>totalPage)
      endPage=totalPage;

   startNum=(currentPage-1)*perPage;
   System.out.println("키워드:"+inputWords+",sidx:"+sortidx+"cp:"+currentPage);
   %>
   <div>
      <div style="margin: 0px 50px 0px 50px"><br>
         <nav class="navbar navbar-expand-sm bg-light navbar-light">
            <div class="container-fluid">
               <div class="collapse navbar-collapse" id="collapsibleNavbar">
                  <ul class="navbar-nav">
                     <li class="nav-item">
                        <a class="nav-link" href="index.jsp?main=search/searchIndex.jsp?sortidx=0&currentPage=<%=currentPage%>&inputWords=<%=inputWords%>">전체</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="index.jsp?main=search/searchIndex.jsp?sortidx=1&currentPage=<%=currentPage%>&inputWords=<%=inputWords%>">관광지</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="index.jsp?main=search/searchIndex.jsp?sortidx=2&currentPage=<%=currentPage%>&inputWords=<%=inputWords%>">나만의코스</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link " href="index.jsp?main=search/searchIndex.jsp?sortidx=3&currentPage=<%=currentPage%>&inputWords=<%=inputWords%>">추천코스</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="index.jsp?main=search/searchIndex.jsp?sortidx=4&currentPage=<%=currentPage%>&inputWords=<%=inputWords%>">리뷰</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="index.jsp?main=search/searchIndex.jsp?sortidx=5&currentPage=<%=currentPage%>&inputWords=<%=inputWords%>">비회원리뷰</a>
                     </li>
                  </ul>
               </div>
            </div>
         </nav>
      </div>
      
      <div class="container mt-3">
         <!-- Nav tabs -->
         <ul class="nav nav-tabs left-tab" style="margin-left: 33px">
            <li class="nav-item">
               <button type="button" class="btn btn-outline-info btn-sm v"><i class="bi bi-justify"></i></button>
            </li>&nbsp;
            <li class="nav-item">
               <button type="button" class="btn btn-outline-info btn-sm h"><i class="bi bi-border-all"></i></button>
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
         <%List<HashMap<String, List<HashMap<String, String>>>> list_relevance=searchDao.searchInputWordsInWholeTablesWithStatistics(inputWords, tables, startNum, perPage, 1);
         for(int i=0;i<list_relevance.size();i++)
         {
            HashMap<String, List<HashMap<String, String>>> tableMap=list_relevance.get(i);
            
            for(String table:tables)
            {
               String columns=searchDao.searchColumnNamesInEachTables(table);
               String [] columnsArr=columns.split(",");
               
               if(tableMap.get(table)==null){continue;}
               else
               {
                  List<HashMap<String, String>> mapList=tableMap.get(table);
                  
                  for(HashMap<String, String> map:mapList)
                  {
                  %>
                  <div class="v_align">
                  <table class="table table-bordered">
                     <caption align="top" style="font-size: 1.2em"><%=translation(table) %></caption>
                     <tr>
                        <th>사진</th><th>컬럼</th><th>데이터</th>
                     </tr>
                     <%String photo="";
                     for(String column:columnsArr){
                        if(column.equals("photo")){photo=(map.get("photo")==null?"":map.get("photo"));}
                        else if(column.equals("mainphoto")){photo=(map.get("mainphoto")==null?"":map.get("mainphoto"));}
                     }
                     int j=0;
                     for(String column:columnsArr)
                     {%>
                        <tr>
                           <%if(j==0&&!photo.equals("")){%>
                              <td rowspan="<%=columnsArr.length%>"><img src="save/<%=photo %>"></td>
                           <%}else if(j==0&&photo.equals("")){%>
                              <td rowspan="<%=columnsArr.length%>"><img src="no_image/"></td>
                           <%}
                           if(!column.equals("photo")&&!column.equals("mainphoto")){%>
                           <td><%=column %></td>
                           <td><%=map.get(column) %></td><%} %>
                        </tr>
                     <%j++;}%>
               </table>
               </div>
               <div class="grid_align col-md-6" style="float: left">
                  <table class="table table-bordered">
                     <caption align="top" style="font-size: 1.2em"><%=translation(table) %></caption>
                     <tr>
                        <td colspan="2"><img src="save/<%=photo %>"></td>
                     </tr>
                     <%for(String column:columnsArr)
                     {
                        if(!column.equals("photo")&&!column.equals("mainphoto")){%>
                        <tr>
                           <td><%=column %></td><td><%=map.get(column) %></td>
                        </tr>
                     <%}}%>
                  </table>
               </div>
               <%}
               }
            }
         }%>
      </div>
      <div id="tabs2" class="container tab-pane fade"><br>
         <%List<HashMap<String, List<HashMap<String, String>>>> list_latest=searchDao.searchInputWordsInWholeTablesWithStatistics(inputWords, tables, startNum, perPage, 2);
         for(int i=0;i<list_latest.size();i++)
         {
            HashMap<String, List<HashMap<String, String>>> tableMap=list_latest.get(i);
            
            for(String table:tables)
            {
               String columns=searchDao.searchColumnNamesInEachTables(table);
               String [] columnsArr=columns.split(",");
               
               if(tableMap.get(table)==null){continue;}
               else
               {
                  List<HashMap<String, String>> mapList=tableMap.get(table);
                  
                  for(HashMap<String, String> map:mapList)
                  {
                  %>
                  <div class="v_align">
                  <table class="table table-bordered">
                     <caption align="top" style="font-size: 1.2em"><%=translation(table) %></caption>
                     <tr>
                        <th>사진</th><th>컬럼</th><th>데이터</th>
                     </tr>
                     <%String photo="";
                     for(String column:columnsArr){
                        if(column.equals("photo")){photo=(map.get("photo")==null?"":map.get("photo"));}
                        else if(column.equals("mainphoto")){photo=(map.get("mainphoto")==null?"":map.get("mainphoto"));}
                     }
                     int j=0;
                     for(String column:columnsArr)
                     {%>
                        <tr>
                           <%if(j==0&&!photo.equals("")){%>
                              <td rowspan="<%=columnsArr.length%>"><img src="save/<%=photo %>"></td>
                           <%}else if(j==0&&photo.equals("")){%>
                              <td rowspan="<%=columnsArr.length%>"><img src="no_image/"></td>
                           <%}
                           if(!column.equals("photo")&&!column.equals("mainphoto")){%>
                           <td><%=column %></td>
                           <td><%=map.get(column) %></td><%} %>
                        </tr>
                     <%j++;}%>
               </table>
               </div>
               <div class="grid_align col-md-6" style="float: left">
                  <table class="table table-bordered">
                     <caption align="top" style="font-size: 1.2em"><%=translation(table) %></caption>
                     <tr>
                        <td colspan="2"><img src="save/<%=photo %>"></td>
                     </tr>
                     <%for(String column:columnsArr)
                     {
                        if(!column.equals("photo")&&!column.equals("mainphoto")){%>
                        <tr>
                           <td><%=column %></td><td><%=map.get(column) %></td>
                        </tr>
                     <%}}%>
                  </table>
               </div>
               <%}
               }
            }
         }%>
      </div>
      <div id="tabs3" class="container tab-pane fade"><br>
         <%List<HashMap<String, List<HashMap<String, String>>>> list_popularity=searchDao.searchInputWordsInWholeTablesWithStatistics(inputWords, tables, startNum, perPage, 3);
         for(int i=0;i<list_popularity.size();i++)
         {
            HashMap<String, List<HashMap<String, String>>> tableMap=list_popularity.get(i);
            
            for(String table:tables)
            {
               String columns=searchDao.searchColumnNamesInEachTables(table);
               String [] columnsArr=columns.split(",");
               
               if(tableMap.get(table)==null){continue;}
               else
               {
                  List<HashMap<String, String>> mapList=tableMap.get(table);
                  
                  for(HashMap<String, String> map:mapList)
                  {
                  %>
                  <div class="v_align">
                  <table class="table table-bordered">
                     <caption align="top" style="font-size: 1.2em"><%=translation(table) %></caption>
                     <tr>
                        <th>사진</th><th>컬럼</th><th>데이터</th>
                     </tr>
                     <%String photo="";
                     for(String column:columnsArr){
                        if(column.equals("photo")){photo=(map.get("photo")==null?"":map.get("photo"));}
                        else if(column.equals("mainphoto")){photo=(map.get("mainphoto")==null?"":map.get("mainphoto"));}
                     }
                     int j=0;
                     for(String column:columnsArr)
                     {%>
                        <tr>
                           <%if(j==0&&!photo.equals("")){%>
                              <td rowspan="<%=columnsArr.length%>"><img src="save/<%=photo %>"></td>
                           <%}else if(j==0&&photo.equals("")){%>
                              <td rowspan="<%=columnsArr.length%>"><img src="no_image/"></td>
                           <%}
                           if(!column.equals("photo")&&!column.equals("mainphoto")){%>
                           <td><%=column %></td>
                           <td><%=map.get(column) %></td><%} %>
                        </tr>
                     <%j++;}%>
               </table>
               </div>
               <div class="grid_align col-md-6" style="float: left">
                  <table class="table table-bordered">
                     <caption align="top" style="font-size: 1.2em"><%=translation(table) %></caption>
                     <tr>
                        <td colspan="2"><img src="save/<%=photo %>"></td>
                     </tr>
                     <%for(String column:columnsArr)
                     {
                        if(!column.equals("photo")&&!column.equals("mainphoto")){%>
                        <tr>
                           <td><%=column %></td><td><%=map.get(column) %></td>
                        </tr>
                     <%}}%>
                  </table>
               </div>
               <%}
               }
            }
         }%>
      </div>
      
      <div style="width: 600px;text-align: center" class="container mt-3">
         <ul class="pagination justify-content-center">
            <%
            if(startPage>1)
            {%>
               <li class="page-item">
                  <a href="index.jsp?main=search/searchIndex.jsp?currentPage=<%=startPage-1%>&sortidx=<%=sortidx %>&inputWords=<%=inputWords %>" class="page-link">이전</a>
               </li>
            <%}         
            for(int pp=startPage;pp<=endPage;pp++)
            {
               if(pp==currentPage)
               {%>
                  <li class="page-item active">
                     <a href="index.jsp?main=search/searchIndex.jsp?currentPage=<%=pp%>&sortidx=<%=sortidx %>&inputWords=<%=inputWords %>" class="page-link"><%=pp %></a>
                  </li>
               <%}else
               {%>
                  <li class="page-item">
                     <a href="index.jsp?main=search/searchIndex.jsp?currentPage=<%=pp%>&sortidx=<%=sortidx %>&inputWords=<%=inputWords %>" class="page-link"><%=pp %></a>
                  </li>
               <%}
            }
            if(endPage<totalPage)
            {%>
               <li class="page-item">
                  <a href="index.jsp?main=search/searchIndex.jsp?currentPage=<%=endPage+1%>&sortidx=<%=sortidx %>&inputWords=<%=inputWords %>" class="page-link">다음</a>
               </li>
            <%}   
            %>
         </ul>
      </div>
   </div>
</body>
</html>