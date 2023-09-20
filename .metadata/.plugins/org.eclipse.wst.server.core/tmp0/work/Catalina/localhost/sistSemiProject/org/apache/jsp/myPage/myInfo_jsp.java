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
import java.text.SimpleDateFormat;
import java.util.List;

public final class myInfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes.add("data.dao.MemberDao");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.7.0.js\"></script>\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css\">\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("</head>\n");
      out.write("<style>\n");
      out.write("div.info0 {\n");
      out.write("	width : 750px;\n");
      out.write("	height : 150px;\n");
      out.write("	margin-left:50px;\n");
      out.write("	border-radius: 20px; /* 원하는 둥글기 정도 설정 */\n");
      out.write("  	background-color: white; /* 배경색 지정 */\n");
      out.write("    padding: 20px; \n");
      out.write("    margin-top:50px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("div.info1 {\n");
      out.write("	position : relative;\n");
      out.write("	border : 1px solid gray;\n");
      out.write("	width : 850px;\n");
      out.write("	height : 300px;\n");
      out.write("	border-radius: 10px; /* 원하는 둥글기 정도 설정 */\n");
      out.write("	padding: 20px; \n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write("div.profile {\n");
      out.write("	margin-right: 600px;	\n");
      out.write("	margin-top : 20px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("div.line {	\n");
      out.write("  position: absolute;\n");
      out.write("  border-left: 1px solid gray;\n");
      out.write("  height : 300px;\n");
      out.write("  margin-left: 220px; /* 수정: margin-left 값 조정 */\n");
      out.write("  top: 0px; /* 수정: top 값 추가 */\n");
      out.write("}\n");
      out.write("\n");
      out.write("button.btn1 {\n");
      out.write("	margin-left:700px;\n");
      out.write("	margin-bottom:100px;\n");
      out.write("}\n");
      out.write("\n");
      out.write("</style>\n");

String root=request.getContextPath();

String pass=request.getParameter("pass");

MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllData();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

//로그인 세션
String loginok = (String)session.getAttribute("loginok");

//아이디 얻기
String myid = (String)session.getAttribute("myid");

      out.write("\n");
      out.write("	<!-- \n");
      out.write("	info1 -> 기본정보\n");
      out.write("	info2 -> 연락처 정보\n");
      out.write("	info3 -> 여행지 리스트 출력 \n");
      out.write("	\n");
      out.write("	맨 아래 회원탈퇴 버튼 눌르기.\n");
      out.write("	 -->\n");
      out.write("	 ");

	 for(MemberDto dto:list) {
		 if(loginok!=null && myid.equals(dto.getId())) {
	 
      out.write("\n");
      out.write("	 <input type=\"hidden\" name=\"pass\" value=\"");
      out.print(pass );
      out.write("\">\n");
      out.write("	<br><br>\n");
      out.write("	<div class=\"info0\">\n");
      out.write("		<h2><b>개인정보</b></h2>\n");
      out.write("		<br>\n");
      out.write("		<h4 style=\"font-size:18px;\">다양한 <b>Jeju 하다</b>서비스에서 사용되는 나와 내 환경설정에 관한 정보입니다.</h4>	\n");
      out.write("	</div>\n");
      out.write("	<br><br>\n");
      out.write("	\n");
      out.write("	<table class=\"table table-bordered\" style=\"width:850px; height:300px;\">\n");
      out.write("		<tr>\n");
      out.write("			<td width=\"400\"><i class=\"bi bi-chat-text\" onclick=\"reviewgo()\"></i>&nbsp;&nbsp;나의 후기</td>\n");
      out.write("			<td width=\"400\"><i class=\"bi bi-menu-app-fill\" onclick=\"commentgo()\"></i>&nbsp;&nbsp;내가 쓴 댓글</td>\n");
      out.write("		</tr>\n");
      out.write("		\n");
      out.write("		<tr>\n");
      out.write("			<td width=\"400\"><i class=\"bi bi-chat-heart\"></i>&nbsp;&nbsp;좋아요</td>\n");
      out.write("			<td width=\"400\"><i class=\"bi bi-reddit\" onclick=\"listgo()\"></i>&nbsp;&nbsp;나의 일정</td>\n");
      out.write("		</tr>\n");
      out.write("		\n");
      out.write("		<tr>\n");
      out.write("			<td colspan=\"2\"><i class=\"bi bi-currency-exchange\" onclick=\"money()\"></i>&nbsp;&nbsp;개발자한테 기부하기</td>\n");
      out.write("		</tr>\n");
      out.write("	</table><br><br>\n");
      out.write("	\n");
      out.write("	<div class=\"container\" style=\"margin-right:10px;\" id=\"updateFormContainer\">	\n");
      out.write("	<button type=\"button\" style=\"margin-left:800px; \"onclick=\"location.href='index.jsp?main=myPage/updateform.jsp?id=");
      out.print(myid );
      out.write("'\">수정</button>\n");
      out.write("	<table class=\"table table-bordered\" style=\"width:850px; height:300px;\">\n");
      out.write("	\n");
      out.write("	<td style=\"border:none;\">\n");
      out.write("	<b style=\"font-size:24px;\">기본정보</b>\n");
      out.write("	</td>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("		<td rowspan=\"5\" width=\"150px\">\n");
      out.write("		<br>\n");
      out.write("		<img src=\"");
      out.print(root );
      out.write("/save/");
      out.print(dto.getProfile() );
      out.write("\" class=\"rounded-circle\" width=\"170\" height=\"200\">\n");
      out.write("		</td>\n");
      out.write("	</tr>\n");
      out.write("\n");
      out.write("	<tr style=\"height:75px;\">\n");
      out.write("		<td style=\"text-align:left; width:100px; vertical-align: middle;\">&nbsp;&nbsp;<b>이름 : </b></td>\n");
      out.write("		<td style=\"text-align:center; vertical-align: middle;\"><b>");
      out.print(dto.getName() );
      out.write("</b></td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr style=\"height:75px;\">\n");
      out.write("		<td style=\"text-align:left; vertical-align: middle;\">&nbsp;&nbsp;<b>전화번호 :</b></td>\n");
      out.write("		<td style=\"text-align:center; vertical-align: middle;\"><b>");
      out.print(dto.getHp() );
      out.write("</b></td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr style=\"height:75px;\">\n");
      out.write("		<td style=\"text-align:left; vertical-align: middle;\">&nbsp;&nbsp;<b>나이 : </b></td>\n");
      out.write("		<td style=\"text-align:center; vertical-align: middle;\"><b>");
      out.print(dto.getAge() );
      out.write("</b></td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr style=\"height:75px;\">\n");
      out.write("		<td style=\"text-align:left; vertical-align: middle;\">&nbsp;&nbsp;<b>성별 : </b></td>\n");
      out.write("		<td style=\"text-align:center; vertical-align: middle;\"><b>");
      out.print(dto.getGender() );
      out.write("</b></td>\n");
      out.write("	</tr>\n");
      out.write("	</table><br><br>\n");
      out.write("	\n");
      out.write("	\n");
      out.write("	<table class=\"table table-bordered\" style=\"width:850px; height:300px;\">\n");
      out.write("	<td style=\"border:none; text-align:left;\">\n");
      out.write("	<b style=\"font-size:24px;\">연락처정보</b>\n");
      out.write("	</td>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("	<td style=\"border:none; text-align:left; vertical-align: middle;\">이메일 : ");
      out.print(dto.getEmail() );
      out.write("</td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("	<td style=\"border:none; text-align:left; vertical-align: middle;\">사는곳 : ");
      out.print(dto.getArea() );
      out.write("</td>\n");
      out.write("	</tr>\n");
      out.write("	</table>\n");
      out.write("	<br><br>\n");
      out.write("	\n");
      out.write("	\n");
      out.write("	<table class=\"table table-bordered\" style=\"width:850px; height:300px;\">\n");
      out.write("	\n");
      out.write("	<td style=\"border:none; text-align:left;\">\n");
      out.write("	<b style=\"font-size:24px;\">기타정보</b>\n");
      out.write("	</td>\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("	<td style=\"border:none; text-align:left; vertical-align: middle;\">MBTI : ");
      out.print(dto.getMbti() );
      out.write("</td>\n");
      out.write("	</tr>\n");
      out.write("	");

	
      out.write("\n");
      out.write("	<tr>\n");
      out.write("	<td style=\"border:none; text-align:left; vertical-align: middle;\">가입날짜 : ");
      out.print(sdf.format(dto.getRegister_day()) );
      out.write("</td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	</table>\n");
      out.write("	<br><br>\n");
      out.write("	</div>\n");
      out.write("	\n");
      out.write("	<table class=\"table table-bordered\" style=\"width:850px; height:300px;\">\n");
      out.write("	<td style=\"border:none; text-align:left;\">\n");
      out.write("	<b style=\"font-size:24px;\">나만의 코스</b>\n");
      out.write("	\n");
      out.write("	");

	//for each문 dto로 list선언 후
	//추가한게 있으면은 그게 출력되게끔 로직 짜기
	//feat : 0907~
	
	
      out.write("\n");
      out.write("	\n");
      out.write("	<tr>\n");
      out.write("	<td>1</td>\n");
      out.write("	</tr>\n");
      out.write("	\n");
      out.write("	\n");
      out.write("	</table>\n");
      out.write("	<br><br>\n");
      out.write("	\n");
      out.write("	\n");
      out.write("	\n");
      out.write("	");
      out.write("\n");
      out.write("	\n");
      out.write("	\n");
      out.write("	");
	 
		 }
	 }
	 
      out.write('\n');
      out.write('	');
      out.write(' ');
 
	String pw = request.getParameter("pass");
	MemberDto dto = new MemberDto();
	dto.setPass(pw); // 비밀번호 초기화, 실제로는 DB에서 값을 가져와야 합니다.

      out.write("\n");
      out.write("<input type=\"button\" class=\"btn btn-outline\" value=\"회원탈퇴\" style=\"float:right;\" onclick=\"byeform()\">\n");
      out.write("\n");
      out.write("<script>\n");
      out.write(" function byeform() {\n");
      out.write("	\n");
      out.write("    var userId = '");
      out.print(myid );
      out.write("'; // JSP 변수를 JavaScript 변수에 할당\n");
      out.write("    \n");
      out.write("    var url = \"index.jsp?main=MyPage/deleteform.jsp?id=\" + userId;\n");
      out.write("    \n");
      out.write("    window.open(url, \"회원탈퇴\", \"width=1000,height=500\");\n");
      out.write("} \n");
      out.write(" \n");
      out.write(" function money() {\n");
      out.write("	 let a= \"여러분의 소중한 후원이 여러명의 개발자를 살립니다 감사합니다.\"; \n");
      out.write("	 let b = \"후원계좌 : 카카오뱅크 3333050489678 진현규\\n\";\n");
      out.write("	 let c = \"후원계좌 : 카카오뱅크 1234567890123 위시온\\n\";\n");
      out.write("	 let d = \"후원계좌 : 카카오뱅크 7979 25 81760 임형준\";\n");
      out.write("\n");
      out.write("	 alert(a);\n");
      out.write("	 alert(b+c+d);\n");
      out.write(" }\n");
      out.write(" \n");
      out.write(" function listgo() {\n");
      out.write("	 var userId = '");
      out.print(myid );
      out.write("';\n");
      out.write("	 var url = \"index.jsp?main=myList/myList.jsp?id=\"+userId;\n");
      out.write("	 location.href=url;\n");
      out.write(" }\n");
      out.write(" \n");
      out.write(" function reviewgo() {\n");
      out.write("	 var userId = '");
      out.print(myid );
      out.write("';\n");
      out.write("	 var url = \"index.jsp?main=myList/myreview.jsp?id=\"+userId;\n");
      out.write("	 location.href=url;\n");
      out.write(" \n");
      out.write(" }\n");
      out.write(" \n");
      out.write(" function commentgo() {\n");
      out.write("	 var userId = '");
      out.print(myid );
      out.write("';\n");
      out.write("	 var url = \"index.jsp?main=myList/mycomment.jsp?id=\"+userId;\n");
      out.write("	 location.href=url;\n");
      out.write(" \n");
      out.write(" }\n");
      out.write(" \n");
      out.write(" \n");
      out.write("\n");
      out.write("//a가 yes이고 , 프롬프트에서 입력한 값이, dto.getpass랑 같으면 아래 코드 진행\n");
      out.write("/* $(\"#del\").click(function(){\n");
      out.write("var a = confirm(\"회원탈퇴를 진행하시겠습니까?\");\n");
      out.write("\n");
      out.write("if (a) {\n");
      out.write("    var password = prompt(\"비밀번호를 입력해주세요\");\n");
      out.write("    \n");
      out.write("    if (password !== null) {\n");
      out.write("        // 입력한 비밀번호를 서버로 전달하여 확인\n");
      out.write("        var pass = password; // 비밀번호 변수에 저장\n");
      out.write("        //비밀번호 체크하는 로직 하나 만들어야함\n");
      out.write("        \n");
      out.write("        $.ajax({\n");
      out.write("            type: \"POST\",\n");
      out.write("            dataType: \"html\",\n");
      out.write("            url: \"MyPage/userDelete.jsp\",\n");
      out.write("            data: { \"pass\": pass }, // 비밀번호 데이터 전송\n");
      out.write("            success: function(res) {\n");
      out.write("                if (res === \"success\") {\n");
      out.write("                    alert(\"회원탈퇴가 완료되었습니다.\");\n");
      out.write("                } else {\n");
      out.write("                    alert(\"비밀번호가 일치하지 않습니다.\");\n");
      out.write("                }\n");
      out.write("            },\n");
      out.write("        });\n");
      out.write("    } else {\n");
      out.write("        alert(\"비밀번호를 입력해주세요.\");\n");
      out.write("    }\n");
      out.write("}\n");
      out.write("});  */\n");
      out.write("\n");
      out.write("// 수정 버튼을 눌렀을 때 이벤트 핸들러\n");
      out.write("function loadUpdateForm() {\n");
      out.write("    // AJAX를 사용하여 updateform 페이지를 가져오고 지정한 div에 삽입합니다.\n");
      out.write("    $.ajax({\n");
      out.write("        type: 'GET',\n");
      out.write("        url: 'MyPage/updateform.jsp', // updateform.jsp의 경로를 적절하게 수정\n");
      out.write("        success: function(response) {\n");
      out.write("            $('#updateFormContainer').html(response);\n");
      out.write("        },\n");
      out.write("        error: function() {\n");
      out.write("            alert('페이지 로드에 실패했습니다.');\n");
      out.write("        }\n");
      out.write("    });\n");
      out.write("}\n");
      out.write("\n");
      out.write("// 수정 버튼 클릭 시 loadUpdateForm 함수 호출\n");
      out.write("$(document).ready(function() {\n");
      out.write("    $('#updateButton').click(function() {\n");
      out.write("        loadUpdateForm();\n");
      out.write("    });\n");
      out.write("});\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("	\n");
      out.write("	\n");
      out.write("	\n");
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
