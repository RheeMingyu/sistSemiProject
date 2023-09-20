<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
   
   session.invalidate();
   //response.sendRedirect("index.jsp");
%>

<script type="text/javascript">
    $(document).ready(function() {
            $.ajax({
                type: "POST",
                url: "myCourse/deleteTemp.jsp",
                success: function(response) {
               location.href="index.jsp";
                }
            });

    });
</script>