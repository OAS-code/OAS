<%-- 
    Document   : DeleteUser
    Created on : Jul 11, 2014, 11:34:52 PM
    Author     : MrTu
--%>

<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            UserDAO dao = new UserDAO();
            String id = request.getParameter("id");
            int n = dao.delete(Integer.parseInt(id));
            if (n > 0) {               
                RequestDispatcher rd = request.getRequestDispatcher("UserController?service=listall");
                rd.forward(request, response);
            }
            %>
    </body>
</html>
