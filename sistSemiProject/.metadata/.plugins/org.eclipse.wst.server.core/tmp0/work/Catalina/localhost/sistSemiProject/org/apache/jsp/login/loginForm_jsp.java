/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.78
 * Generated at: 2023-09-19 08:36:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.login;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class loginForm_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>로그인 페이지</title>\n");

String root=request.getContextPath();

      out.write("\n");
      out.write("<style>\n");
      out.write("html {\n");
      out.write("  height: 100%;\n");
      out.write("}\n");
      out.write("body {\n");
      out.write("  margin:0;\n");
      out.write("  padding:0;\n");
      out.write("  font-family: sans-serif;\n");
      out.write("  background: #fff;\n");
      out.write("  min-height: 100vh; \n");
      out.write("  background-image: url('");
      out.print(root);
      out.write("/jeju/b1.JPG');\n");
      out.write("  background-size:100% 100%;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box {\n");
      out.write("  width: 400px;\n");
      out.write("  margin-top : 460px;\n");
      out.write("  margin-left : 920px;\n");
      out.write("  padding: 40px;\n");
      out.write("  transform: translate(-50%, -50%);\n");
      out.write("  background: rgba(0,0,0,.5);\n");
      out.write("  box-sizing: border-box;\n");
      out.write("  box-shadow: 0 15px 25px rgba(0,0,0,0.5);\n");
      out.write("  border-radius: 10px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box h2 {\n");
      out.write("  margin: 0 0 30px;\n");
      out.write("  padding: 0;\n");
      out.write("  color: #fff;\n");
      out.write("  text-align: center;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box .user-box {\n");
      out.write("  position: relative;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box .user-box input {\n");
      out.write("  width: 100%;\n");
      out.write("  padding: 10px 0;\n");
      out.write("  font-size: 16px;\n");
      out.write("  color: #fff;\n");
      out.write("  margin-bottom: 30px;\n");
      out.write("  border: none;\n");
      out.write("  border-bottom: 1px solid #fff;\n");
      out.write("  outline: none;\n");
      out.write("  background: transparent;\n");
      out.write("}\n");
      out.write(".login-box .user-box label {\n");
      out.write("  position: absolute;\n");
      out.write("  top:0;\n");
      out.write("  left: 0;\n");
      out.write("  padding: 10px 0;\n");
      out.write("  font-size: 16px;\n");
      out.write("  color: #fff;\n");
      out.write("  pointer-events: none;\n");
      out.write("  transition: .5s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box .user-box input:focus ~ label,\n");
      out.write(".login-box .user-box input:valid ~ label {\n");
      out.write("  top: -20px;\n");
      out.write("  left: 0;\n");
      out.write("  color: #03e9f4;\n");
      out.write("  font-size: 12px;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box form a {\n");
      out.write("  position: relative;\n");
      out.write("  display: inline-block;\n");
      out.write("  padding: 10px 20px;\n");
      out.write("  color: black;\n");
      out.write("  font-size: 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  overflow: hidden;\n");
      out.write("  transition: .5s;\n");
      out.write("  margin-top: 40px;\n");
      out.write("  letter-spacing: 4px;\n");
      out.write("  width: 140px; \n");
      out.write("  height: 40px; \n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box a:hover {\n");
      out.write("  background: #03e9f4;\n");
      out.write("  color: #fff;\n");
      out.write("  border-radius: 5px;\n");
      out.write("  box-shadow: 0 0 5px #03e9f4,\n");
      out.write("              0 0 25px #03e9f4,\n");
      out.write("              0 0 50px #03e9f4,\n");
      out.write("              0 0 100px #03e9f4;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".login-box a span:nth-child(1) {\n");
      out.write("  top: 0;\n");
      out.write("  left: -100%;\n");
      out.write("  width: 50px;\n");
      out.write("  height: 2px;\n");
      out.write("  background: linear-gradient(90deg, transparent, #03e9f4);\n");
      out.write("  animation: btn-anim1 1s linear infinite;\n");
      out.write("}\n");
      out.write("\n");
      out.write("@keyframes btn-anim1 {\n");
      out.write("  0% {\n");
      out.write("    left: -100%;\n");
      out.write("  }\n");
      out.write("  50%,100% {\n");
      out.write("    left: 100%;\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box a.button-signup {\n");
      out.write("  position: absolute;\n");
      out.write("  right: 10px; /* 수정: 오른쪽 정렬 */\n");
      out.write("  bottom: 10px; /* 수정: 아래 정렬 */\n");
      out.write("  display: inline-block;\n");
      out.write("  padding: 10px 20px;\n");
      out.write("  color: #03e9f4;\n");
      out.write("  font-size: 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  overflow: hidden;\n");
      out.write("  transition: .5s;\n");
      out.write("  margin-top: 20px;\n");
      out.write("  letter-spacing: 4px;\n");
      out.write("  width: 140px; \n");
      out.write("  height: 40px; \n");
      out.write("  display: flex;\n");
      out.write("  align-items: center;\n");
      out.write("  justify-content: center;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write(".login-box a.button-signup:hover {\n");
      out.write("  background: #03e9f4;\n");
      out.write("  color: #fff;\n");
      out.write("  border-radius: 5px;\n");
      out.write("  box-shadow: 0 0 5px #03e9f4,\n");
      out.write("              0 0 25px #03e9f4,\n");
      out.write("              0 0 50px #03e9f4,\n");
      out.write("              0 0 100px #03e9f4;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box a.button-signup span {\n");
      out.write("  display: block;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box a.button-signup span:nth-child(1) {\n");
      out.write("  top: 0;\n");
      out.write("  left: -100%;\n");
      out.write("  width: 100%;\n");
      out.write("  height: 2px;\n");
      out.write("  background: linear-gradient(90deg, transparent, #03e9f4);\n");
      out.write("  animation: btn-anim1 1s linear infinite;\n");
      out.write("}\n");
      out.write("\n");
      out.write("@keyframes btn-anim1 {\n");
      out.write("  0% {\n");
      out.write("    left: -100%;\n");
      out.write("  }\n");
      out.write("  50%,100% {\n");
      out.write("    left: 100%;\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box a.button-signup span:nth-child(2) {\n");
      out.write("  top: -100%;\n");
      out.write("  right: 0;\n");
      out.write("  width: 2px;\n");
      out.write("  height: 100%;\n");
      out.write("  background: linear-gradient(180deg, transparent, #03e9f4);\n");
      out.write("  animation: btn-anim2 1s linear infinite;\n");
      out.write("  animation-delay: .25s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box button.button-login {\n");
      out.write("  display: inline-block;\n");
      out.write("  padding: 10px 20px;\n");
      out.write("  color: #03e9f4;\n");
      out.write("  font-size: 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  background: transparent;\n");
      out.write("  border: 2px solid #03e9f4;\n");
      out.write("  border-radius: 5px;\n");
      out.write("  transition: .5s;\n");
      out.write("  margin-top: 20px; /* Adjust the margin as needed */\n");
      out.write("  margin-right: 10px; /* Adjust the margin as needed */\n");
      out.write("  cursor: pointer;\n");
      out.write("  outline: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box button.button-login {\n");
      out.write("  display: inline-block;\n");
      out.write("  padding: 10px 20px;\n");
      out.write("  color: #03e9f4;\n");
      out.write("  font-size: 16px;\n");
      out.write("  text-decoration: none;\n");
      out.write("  text-transform: uppercase;\n");
      out.write("  background: transparent;\n");
      out.write("  border: 2px solid transparent; /* Transparent border initially */\n");
      out.write("  border-radius: 5px;\n");
      out.write("  transition: .5s;\n");
      out.write("  margin-top: 20px; /* Adjust the margin as needed */\n");
      out.write("  margin-right: 10px; /* Adjust the margin as needed */\n");
      out.write("  cursor: pointer;\n");
      out.write("  outline: none;\n");
      out.write("  position: relative;\n");
      out.write("  overflow: hidden;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box button.button-login:hover {\n");
      out.write("  background: #03e9f4;\n");
      out.write("  color: #fff;\n");
      out.write("  border: 2px solid #03e9f4; /* Add border color on hover */\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box button.button-login::before {\n");
      out.write("  content: \"\";\n");
      out.write("  position: absolute;\n");
      out.write("  top: 0;\n");
      out.write("  left: 0;\n");
      out.write("  width: 100%;\n");
      out.write("  height: 100%;\n");
      out.write("  background: transparent;\n");
      out.write("  border: 2px solid #03e9f4; /* Border color to match hover state */\n");
      out.write("  border-radius: 5px;\n");
      out.write("  transform: scale(0.8); /* Initial scale */\n");
      out.write("  opacity: 0; /* Initial opacity */\n");
      out.write("  transition: transform 0.3s ease, opacity 0.3s ease;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box button.button-login:hover::before {\n");
      out.write("  transform: scale(1.2); /* Scale on hover */\n");
      out.write("  opacity: 1; /* Show on hover */\n");
      out.write("}\n");
      out.write("\n");
      out.write(".login-box input[type=\"submit\"] {\n");
      out.write("  border: none;\n");
      out.write("  background: transparent;\n");
      out.write("  font-weight: bold;\n");
      out.write("  margin-left: 50px;\n");
      out.write("  height: 40px;\n");
      out.write("  display: flex;\n");
      out.write("  align-items: center;\n");
      out.write("  justify-content: center;\n");
      out.write("}\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("\n");

String myid = (String)session.getAttribute("loginok");
String saveok = (String)session.getAttribute("saveok");
String sesave = (String)session.getAttribute("sesave");
//String memberid = (String)session.getAttribute("MEMBERID");

//boolean login = memberid==null?false:true;

boolean save = true;

if(saveok==null) {
   myid="";
   save=false;
} else {
   save = true;
}



      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div class=\"login-box\">\n");
      out.write("  <h2>Login</h2>\n");
      out.write("  <hr>\n");
      out.write("  <form action=\"login/loginAction.jsp\" method=\"post\">\n");
      out.write("    <div class=\"user-box\">\n");
      out.write("      <input type=\"text\" name=\"id\" required=\"required\" value=\"");
      out.print(saveok==null?"":myid );
      out.write("\">\n");
      out.write("      <label>ID</label>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"user-box\">\n");
      out.write("      <input type=\"password\" name=\"pass\" required=\"required\" size=\"15\">\n");
      out.write("      <label>Password</label><br>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("    <!-- 로그인 버튼 위치 수정하기 -->\n");
      out.write("    <button type=\"submit\" class=\"btn btn-info\" style=\"text-align:center; border: none; background: transparent; width: 100px; font-weight: bold; margin-left: 100px;\">Enter</button><br>\n");
      out.write("    \n");
      out.write("    <!-- TODO : 버튼 클릭시 아이디찾기랑 비밀번호 찾기 할 수 있게 구현하기. -->\n");
      out.write("    <br>\n");
      out.write("    <div style=\"display: flex; justify-content: center; margin-top: 10px;\">\n");
      out.write("     <button type=\"button\" style=\"border: none; background: transparent; width: 100px; font-weight: bold; margin-left: 8px;\"><b style=\"font-size:13px;\">아이디찾기</b></button>\n");
      out.write("     <button type=\"button\" style=\"border: none; background: transparent; width: 110px; font-weight: bold; margin-left: 10px;\"><b style=\"font-size:13px;\">비밀번호찾기</b></button>\n");
      out.write("   </div>\n");
      out.write("\n");
      out.write("    <a class=\"button-signup\" href=\"index.jsp?main=member/Gaipform.jsp\"><b>회원가입</b></a>\n");
      out.write("\n");
      out.write("    <br><br>\n");
      out.write("    \n");
      out.write("    <input type=\"checkbox\" name=\"cbsave\" ");
      out.print(saveok==null?"":"checked" );
      out.write("><b style=\"font-size:14px;\">아이디저장</b>&nbsp;&nbsp;\n");
      out.write("    <input type=\"checkbox\" name=\"sesave\" ");
      out.print(sesave==null?"":"checked" );
      out.write("><b style=\"font-size:14px;\">로그인상태유지</b>\n");
      out.write("  </form>\n");
      out.write("</div>\n");
      out.write("\n");
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
