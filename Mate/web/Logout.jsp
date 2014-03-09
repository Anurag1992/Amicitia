<%-- 
    Document   : Logout
    Created on : Jul 5, 2013, 2:29:22 PM
    Author     : 007
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <% 
            HttpSession ss = request.getSession(false);
            ss.invalidate();
            
            
                String site = "Login.jsp";
               response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
               response.setHeader("Location", site);
            
            %>
    </body>
</html>
