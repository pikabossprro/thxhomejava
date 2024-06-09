<%-- 
    Document   : logout
    Created on : 2 feb. 2023, 11:22:33
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
              HttpSession sesion = request.getSession();
              sesion.invalidate();
              response.sendRedirect("index.jsp");
        %>
    </body>
</html>
