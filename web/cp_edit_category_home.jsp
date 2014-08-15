<%-- 
    Document   : EditCategory
    Created on : Jul 22, 2014, 11:32:41 PM
    Author     : MrTu
--%>
<%@page import="Entity.Category"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*"%>
<%response.setContentType("text/html; charset=UTF-8");%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit category</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
        <link rel="stylesheet" type="text/css" href="css/table.css"/>
    </head>
    <body> 
        <div id="edit_profile_page" class="my_message_right">
            <div class="message_common_border">
                <h1 title="EDIT PROFILE">Edit category.</h1>
                <p>&nbsp;</p>
            </div>       
            <form name="form1" method="post" action="CategoryController">
                <%
                    CategoryDAO dao = new CategoryDAO();
                     String id = request.getParameter("categoryid");
                     ResultSet rs = dao.search(Integer.parseInt(id));
                     Category category = new Category();
                     if (rs.next()) {
                     category.setCategoryid(rs.getInt(1));
                     category.setName(rs.getString(2));
                     category.setDescription(rs.getString(3));
                     }
                %>
                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <input type="hidden" name="no" id="no" value="<%=category.getCategoryid()%>"> 
                        <div class="user_name_common">                  
                            <p>Category name<span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2><input type="text" name="name" id="name" value="<%=category.getName()%>"></h2>
                            </div>
                        </div>
                        <div class="user_name_common">                 
                            <p>Description<span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2><input type="text" name="description" id="description" value="<%=category.getDescription()%>"></h2>
                            </div>
                        </div>
                        <div class="no_img">
                            <div class="buton_green">
                                <div class="profil_butoon">
                                    <div class="res_left"></div>
                                    <div class="res_mid">
                                        <a title="RESET">
                                            <input type="reset" value="Reset" name="reset" onclick='clear();'>
                                        </a>
                                    </div>
                                    <div class="res_right"></div>
                                </div>
                                <span></span>				
                                <div class="grand_total_btn_cp">
                                    <div class="save_left"></div>
                                    <div class="save_mid"><a title="SAVE">
                                            <input type="submit" value="Save" name="save">
                                            <input type="hidden" name="service" id="service" value="edit">
                                        </a>
                                    </div>
                                    <div class="save_right"></div>
                                </div>				
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
