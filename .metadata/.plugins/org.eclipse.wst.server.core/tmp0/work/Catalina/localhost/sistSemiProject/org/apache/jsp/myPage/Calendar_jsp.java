/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.78
 * Generated at: 2023-09-19 09:06:39 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.myPage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import data.dto.MemberDto;
import data.dao.MemberDao;
import java.time.format.DateTimeFormatter;
import java.time.LocalTime;
import java.time.LocalDate;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public final class Calendar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("data.dao.MemberDao");
    _jspx_imports_classes.add("java.util.Calendar");
    _jspx_imports_classes.add("java.time.format.DateTimeFormatter");
    _jspx_imports_classes.add("java.time.LocalDate");
    _jspx_imports_classes.add("java.time.LocalTime");
    _jspx_imports_classes.add("data.dto.MemberDto");
    _jspx_imports_classes.add("java.text.SimpleDateFormat");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("  <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.7.0.js\"></script>\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css\">\n");
      out.write("<title>나의 일정</title>\n");

	request.setCharacterEncoding("utf-8");

	Calendar cal = Calendar.getInstance();
	
	// 시스템 오늘날짜
	int ty = cal.get(Calendar.YEAR);
	int tm = cal.get(Calendar.MONTH)+1;
	int td = cal.get(Calendar.DATE);
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1;
	
	// 파라미터 받기
	String sy = request.getParameter("year");
	String sm = request.getParameter("month");
	
	if(sy!=null) { // 넘어온 파라미터가 있으면
		year = Integer.parseInt(sy);
	}
	if(sm!=null) {
		month = Integer.parseInt(sm);
	}
	
	cal.set(year, month-1, 1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH)+1;
	
	int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)

      out.write("<link rel=\"icon\" href=\"data:;base64,iVBORw0KGgo=\">\n");
      out.write("<style type=\"text/css\">\n");
      out.write("\n");
      out.write("*{\n");
      out.write("	margin: 0; padding: 0;\n");
      out.write("    box-sizing: border-box;\n");
      out.write("}\n");
      out.write("\n");
      out.write("body {\n");
      out.write("	font-size: 14px;\n");
      out.write("	font-family: \"맑은 고딕\", 나눔고딕, 돋움, sans-serif;\n");
      out.write("}\n");
      out.write("\n");
      out.write("a {\n");
      out.write("  color: #000;\n");
      out.write("  text-decoration: none;\n");
      out.write("  cursor: pointer;\n");
      out.write("}\n");
      out.write("a:active, a:hover {\n");
      out.write("	text-decoration: underline;\n");
      out.write("	color: #F28011;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar {\n");
      out.write("  width: 250px;\n");
      out.write("  height:250px;\n");
      out.write("  margin-top: 110px;\n");
      out.write("  margin-left: 300px;\n");
      out.write("  \n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .title1{\n");
      out.write("	height: 38px;\n");
      out.write("	line-height: 20px;\n");
      out.write("	text-align: center;\n");
      out.write("	font-size:18px;\n");
      out.write("	font-weight: bold;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .selectField {\n");
      out.write("	border: 1px solid #999;\n");
      out.write("	padding: 2px 7px;\n");
      out.write("	border-radius: 3px;\n");
      out.write("	font-family: \"맑은 고딕\", 나눔고딕, 돋움, sans-serif;\n");
      out.write("	vertical-align: baseline;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar table {\n");
      out.write("	width: 150px;\n");
      out.write("	height:150px;\n");
      out.write("	border-collapse: collapse;\n");
      out.write("	border-spacing: 0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar table thead tr:first-child{\n");
      out.write("	background: #f6f6f6;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar table td{\n");
      out.write("	padding: 10px;\n");
      out.write("	text-align: center;\n");
      out.write("	border: 1px solid #ccc;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar table td:nth-child(7n+1){\n");
      out.write("	color: red;\n");
      out.write("}\n");
      out.write(".calendar table td:nth-child(7n){\n");
      out.write("	color: blue;\n");
      out.write("}\n");
      out.write(".calendar table td.gray {\n");
      out.write("	color: #ccc;\n");
      out.write("}\n");
      out.write(".calendar table td.today{\n");
      out.write("	font-weight:700;\n");
      out.write("	background: #E6FFFF;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".calendar .footer{\n");
      out.write("	height: 25px;\n");
      out.write("	line-height: 25px;\n");
      out.write("	text-align: right;\n");
      out.write("	font-size: 12px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".button {\n");
      out.write("  background: #3D4C53;\n");
      out.write("  margin : 20px auto;\n");
      out.write("  width : 180px;\n");
      out.write("  height : 35px;\n");
      out.write("  overflow: hidden;\n");
      out.write("  text-align : center;\n");
      out.write("  transition : .2s;\n");
      out.write("  cursor : pointer;\n");
      out.write("  border-radius: 3px;\n");
      out.write("  box-shadow: 0px 1px 2px rgba(0,0,0,.2);\n");
      out.write("}\n");
      out.write(".btnTwo {\n");
      out.write("  position : relative;\n");
      out.write("  width : 200px;\n");
      out.write("  height : 100px;\n");
      out.write("  margin-top: -100px;\n");
      out.write("  padding-top: 2px;\n");
      out.write("  background : #26A69A;\n");
      out.write("  left : -250px;\n");
      out.write("  transition : .3s;\n");
      out.write("}\n");
      out.write(".btnText {\n");
      out.write("  color : white;\n");
      out.write("  transition : .3s;\n");
      out.write("}\n");
      out.write(".btnText2 {\n");
      out.write("  margin-top : 63px;\n");
      out.write("  margin-right : -130px;\n");
      out.write("  color : #FFF;\n");
      out.write("}\n");
      out.write(".button:hover .btnTwo{ /*When hovering over .button change .btnTwo*/\n");
      out.write("  left: -130px;\n");
      out.write("}\n");
      out.write(".button:hover .btnText{ /*When hovering over .button change .btnText*/\n");
      out.write("  margin-left : 65px;\n");
      out.write("}\n");
      out.write(".button:active { /*Clicked and held*/\n");
      out.write("  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("\n");

String loginok = (String)session.getAttribute("loginok");
String myid =(String)session.getAttribute("myid");

MemberDao dao = new MemberDao();
String name = dao.getName(myid);


      out.write("<script type=\"text/javascript\">\n");
      out.write("$(function(){\n");
      out.write("	\n");
      out.write("	$(\"#content\").hide();\n");
      out.write("	$(\"#save\").hide();\n");
      out.write("\n");
      out.write("	$(\"#btnadd\").click(function(){\n");
      out.write("		$(\"#content\").toggle();\n");
      out.write("		$(\"#save\").toggle(); \n");
      out.write("	});\n");
      out.write("});\n");
      out.write("\n");
      out.write("function change() {\n");
      out.write("	var f = document.frm;\n");
      out.write("	f.action=\"calendar2.jsp\";\n");
      out.write("	f.submit();\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div class=\"a\" style=\"margin-top:120px; margin-left:300px; width:350px;\">\n");



if(loginok!=null) {

      out.write("<b style=\"font-size: 18px; text-decoration: underline;\">♥");
      out.print(name );
      out.write("♥</b><b> 님이 로그인 중 입니다 </b><br>\n");
	
} else {

      out.write("<li><a href=\"index.jsp?main=login/logoutaction.jsp\" style=\"width: 150px; margin-left: 15px; font-size: 14px;\">로그아웃</a>\n");

}

      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"calendar\">	\n");
      out.write("	<div class=\"title1\">\n");
      out.write("		<a href=\"calendar.jsp?year=");
      out.print(year);
      out.write("&month=");
      out.print(month-1);
      out.write("\">&lt;</a>\n");
      out.write("		<label><i class=\"bi bi-calendar-check\">&nbsp;</i>");
      out.print(year);
      out.write('년');
      out.write(' ');
      out.print(month);
      out.write("월</label>\n");
      out.write("		<a href=\"calendar.jsp?year=");
      out.print(year);
      out.write("&month=");
      out.print(month+1);
      out.write("\">&gt;</a>\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("	<table>\n");
      out.write("		<thead>\n");
      out.write("			<tr>\n");
      out.write("				<td>일</td>\n");
      out.write("				<td>월</td>\n");
      out.write("				<td>화</td>\n");
      out.write("				<td>수</td>\n");
      out.write("				<td>목</td>\n");
      out.write("				<td>금</td>\n");
      out.write("				<td>토</td>\n");
      out.write("			</tr>\n");
      out.write("		</thead>\n");
      out.write("		<tbody>\n");

			// 1일 앞 달
			Calendar preCal = (Calendar)cal.clone();
			preCal.add(Calendar.DATE, -(week-1));
			int preDate = preCal.get(Calendar.DATE);
			
			out.print("<tr>");
			// 1일 앞 부분
			for(int i=1; i<week; i++) {
				//out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>"+(preDate++)+"</td>");
			}
			
			// 1일부터 말일까지 출력
			int lastDay = cal.getActualMaximum(Calendar.DATE);
			String cls;
			for(int i=1; i<=lastDay; i++) {
				cls = year==ty && month==tm && i==td ? "today":"";
				
				out.print("<td class='"+cls+"'>"+i+"</td>");
				if(lastDay != i && (++week)%7 == 1) {
					out.print("</tr><tr>");
				}
			}
			
			// 마지막 주 마지막 일자 다음 처리
			int n = 1;
			for(int i = (week-1)%7; i<6; i++) {
				// out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>"+(n++)+"</td>");
			}
			out.print("</tr>");

      out.write("</tbody>\n");
      out.write("	</table>\n");
      out.write("	\n");
      out.write("	\n");
      out.write("	<div>\n");
      out.write("		<table class=\"table table-bordered addtext\" style=\"width:256px; height:40px;\">\n");
      out.write("			<tr>\n");
      out.write("				<td><button type=\"button\" style=\"width:100px; height:30px; border:none;\" id=\"btnadd\">일정 메모하기</button></td>\n");
      out.write("			</tr>\n");
      out.write("		</table>\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("	");

    LocalDate now = LocalDate.now();
	LocalTime now1 = LocalTime.now();
	
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH시 mm분 ss초");
	String formatednow = now1.format(formatter);
	
	MemberDto dto = new MemberDto();
	
    
      out.write("<input type=\"hidden\" name=\"id\" value=\"");
      out.print(dto.getId() );
      out.write("\">\n");
      out.write("		<textarea style=\"text-align:left; width:256px; height:300px;\" name=\"content\" id=\"content\" style=\"border-radius:20px; font-size:15px;\">\n");
      out.write("		제목 : \n");
      out.write("		</textarea>\n");
      out.write("		<button type=\"submit\" id=\"save\" style=\"width: 80px; height: 40px;\">저장</button>\n");
      out.write("\n");
      out.write("	\n");
      out.write("</div> <!-- Calendar 닫는 div -->\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("$(\"#save\").click(function(){\n");
      out.write("	\n");
      out.write("	var inputData = $(\"#content\").val();\n");
      out.write("	//alert(inputData);\n");
      out.write("	\n");
      out.write("	$.ajax({\n");
      out.write("        type: \"POST\", // HTTP 요청 방식 (POST)\n");
      out.write("        url: \"myList/listinsertProc.jsp\", // 데이터를 처리할 서버 스크립트 경로\n");
      out.write("        dataType:\"html\",\n");
      out.write("        data: { content: inputData },  // 전송할 데이터\n");
      out.write("        success: function(response){\n");
      out.write("        	\n");
      out.write("        	alert(\"나의 일정 추가완료\");\n");
      out.write("        	$(\"#content\").val(\"제목 : \");\n");
      out.write("		} \n");
      out.write("	})\n");
      out.write("});\n");
      out.write("\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
