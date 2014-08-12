<%-- 
    Document   : AddAuction
    Created on : Jul 17, 2014, 9:11:06 PM
    Author     : MrTu 2
--%>
<%@page import="DAO.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Auction"%>
<%@page import="Entity.Category"%>
<%@page import="DAO.AuctionDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new auction</title>
    </head>
    <body>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Add new auction</h1>
                <p>&nbsp;</p>
            </div>
            <form name="form1" method="post" action="AuctionController">
                <%
                    String userid = (String) session.getAttribute("userid");
                    int id = Integer.parseInt(userid);
                %>
                <div class="message_common">
                    <input type="text" hidden="hidden" name="no" id="no" value="<%=id%>" class="textbox">
                    <div class="login_middle_common_profil">
                        <div class="user_name_common">
                            <p>
                                Title <span class="red">*</span>: 
                            </p>
                            <div class="text_feeld">
                                <h2>
                                    <input type="text" name="title" id="title" class="textbox">
                                </h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Category</p>
                            <div class="text_feeld">
                                <select name="cb1" id="cb1">
                                    <%
                                        ArrayList<Category> ar = (ArrayList<Category>) request.getAttribute("array");
                                        for (int i = 0; i < ar.size(); i++) {
                                    %>                                
                                    <option value="<%=ar.get(i).getCategoryid()%>"><%=ar.get(i).getName()%></option>                                
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="user_name_common">
                            <p>Description <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <h2><input type="text" name="description" id="description" class="textbox"></h2>
                            </div>		
                        </div>


                        <div class="user_name_common">
                            <p>Image <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2><input type="text" name="image1" id="image1" class="textbox"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p></p>
                            <div class="text_feeld">
                                <h2><input type="text" name="image2" id="image2" class="textbox"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p></p>
                            <div class="text_feeld">
                                <h2><input type="text" name="image3" id="image3" class="textbox"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p></p>
                            <div class="text_feeld">
                                <h2><input type="text" name="image4" id="image4" class="textbox"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p></p>
                            <div class="text_feeld">
                                <h2><input type="text" name="image5" id="image5" class="textbox"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Video  <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <h2><input type="text" name="video" id="video" class="textbox"></h2>
                            </div>		
                        </div>

                        <div class="user_name_common">
                            <p>Plan date: <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <input type="date" name="startdate" id="startdate" >
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Plan time:  <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <input type="time" name="starttime" id="starttime" >
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Close date  <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <input type="date" name="enddate" id="enddate">
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Close time  <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <input type="time" name="endtime" id="endtime">
                            </div>		
                        </div>

                        <div class="user_name_common">
                            <p>Status  <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <select name="cb2" id="cb2">
                                    <option value="0">Inactive</option>
                                    <option value="1">Active</option>
                                    <option value="2">Future</option>
                                    <option value="3">Closed</option>
                                </select>
                            </div>
                        </div>
                        <div class="user_name_common">
                            <p>Starting price  <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <h2><input type="text" name="startingprice" id="startingprice"></h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Buy now price  <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <h2><input type="text" name="buynowprice" id="buynowprice"></h2>
                            </div>		
                        </div>
                        <table align="center">
                            <tr>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">
                                                <input type="hidden" name="service" id="service" value="addnewauction" >
                                                <input type="submit" name="add" value="Add" id="add">
                                            </a>
                                        </div>
                                        <div class="res_right"></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">
                                                <input type="button" name="cancel" id="cancel" value="Cancel" onclick="window.location = 'AuctionController?service=auction_manager';">
                                            </a>
                                        </div>
                                        <div class="res_right"></div>
                                    </div>
                                </td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">  
                                                <input type="reset" name="reset" id="reset" value="Reset" >
                                            </a>
                                        </div>
                                        <div class="res_right"></div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>
        </div>       
    </body>
</html>
