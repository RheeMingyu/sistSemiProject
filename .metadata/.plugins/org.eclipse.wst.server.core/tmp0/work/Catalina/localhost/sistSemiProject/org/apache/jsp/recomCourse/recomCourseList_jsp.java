/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.78
 * Generated at: 2023-09-19 06:21:00 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.recomCourse;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import data.dao.RecomCourseDao;
import data.dto.CourseDto;
import java.util.List;

public final class recomCourseList_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("data.dao.RecomCourseDao");
    _jspx_imports_classes.add("data.dto.CourseDto");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
 request.setCharacterEncoding("utf-8"); 
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Dongle:wght@300&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gowun+Dodum&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Orbit&display=swap\" rel=\"stylesheet\">\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css\">\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.7.0.js\"></script>\n");
      out.write("\n");
      out.write("<style type=\"text/css\">\n");
      out.write("@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);\n");
      out.write("\n");
      out.write("body * { \n");
      out.write(" font-family: 'Jeju Gothic', sans-serif;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("	p.hfont{\n");
      out.write("		font-size: 50px;\n");
      out.write("		float: left;\n");
      out.write("		color: gray;\n");
      out.write("		font-family: Bagel Fat One;\n");
      out.write("		align-self: center;\n");
      out.write("	}\n");
      out.write("	img.himg{\n");
      out.write("		margin: 20px 50px;\n");
      out.write("		width: 50px;\n");
      out.write("		height: 50px;\n");
      out.write("		align-self: center;\n");
      out.write("	}\n");
      out.write("	table.tb{\n");
      out.write("		width: 1200px;\n");
      out.write("		padding: 50px;\n");
      out.write("		margin: 50px;\n");
      out.write("		cursor: pointer;\n");
      out.write("	}\n");
      out.write("	.bline{\n");
      out.write("		border-bottom: 2px solid gray;\n");
      out.write("	}\n");
      out.write("	.bg{\n");
      out.write("		position: absolute;\n");
      out.write("		left: 200px;\n");
      out.write("		margin-top: 200px;\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("<title>Insert title here</title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("\n");

String root=request.getContextPath();

RecomCourseDao RecomCourseDao=new RecomCourseDao();

// 추천코스 list 값 불러오기
List<CourseDto> distinctlist=RecomCourseDao.getCourseName();


// 추천코스 name에 따른 목록 값들 불러오기
/* Vector<RecomCourseDto> coslist=RecomCourseDao.getCourseList(name); */

      out.write(" \n");
      out.write("\n");
      out.write("<body>\n");
      out.write("	<div class=\"bg\">\n");
      out.write("		<div class=\"input-group\">\n");
      out.write("			<img class=\"himg\" src=\"");
      out.print(root );
      out.write("/jeju/map.png\">\n");
      out.write("			<p class=\"hfont\">추 천 코 스</p>\n");
      out.write("		</div>\n");
      out.write("		");

		for (CourseDto RecomCourseDto : distinctlist) {
		
      out.write("\n");
      out.write("		<table class=\"table table-bordered tb\" recomname=\"");
      out.print(RecomCourseDto.getName());
      out.write("\">\n");
      out.write("			<tr>\n");
      out.write("				<td rowspan=\"2\" style=\"width: 20px; padding: 20px;\"><img alt=\"\" src=\"");
      out.print(root );
      out.write("/jeju/");
      out.print(RecomCourseDto.getMainphoto() );
      out.write("\" style=\"width: 200px;\"></td>\n");
      out.write("				<td>\n");
      out.write("					<h3>\n");
      out.write("						<b>");
      out.print(RecomCourseDto.getName());
      out.write("</b>\n");
      out.write("					</h3>\n");
      out.write("				</td>\n");
      out.write("			</tr>\n");
      out.write("			<tr class=\"bline\">\n");
      out.write("				<td style=\"padding: 20px;\">\n");
      out.write("					<h5>");
      out.print(RecomCourseDto.getIntro());
      out.write("</h5>\n");
      out.write("				</td>\n");
      out.write("			</tr>\n");
      out.write("		</table>\n");
      out.write("		");
 }
      out.write("\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("	<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("$(\"table.tb\").click(function(){\n");
      out.write("	var name=$(this).attr(\"recomname\");\n");
      out.write("	/* alert(name); */\n");
      out.write("	location.href=\"index.jsp?main=recomCourse/detailRecomCourse.jsp?name=\"+name;\n");
      out.write("	/* location.href=\"../recomCourse/detailRecomCourse.jsp?name=\"+name; */\n");
      out.write("	\n");
      out.write("});\n");
      out.write("\n");
      out.write("	</script>\n");
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