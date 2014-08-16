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
        <title>Add auction</title>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />
    </head>
    <body>
        <%@ include file="perm_staff.jsp" %>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Add new auction</h1>
                <p>&nbsp;</p>
            </div>
            <form name="form1" method="post" action="AuctionController">
                <%                    String userid = (String) session.getAttribute("userid");
                    int id = Integer.parseInt(userid);
                %>
                <div class="message_common">
                    <input type="text" hidden="hidden" name="userid" id="userid" value="<%=id%>" class="textbox">
                    <div class="login_middle_common_profil">
                        <table border="0" cellspacing="15" cellpadding="15">
                            <tr>
                                <td width="500">
                                    <div class="user_name_common">
                                        <b>
                                            Title <span class="red">*</span>: 
                                        </b>                                        		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2>
                                                <input type="text" name="title" id="title" class="textbox">
                                            </h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b>Category:</b>                                      
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <select name="cb1" id="cb1">
                                                <%
                                                    ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
                                                    for (int i = 0; i < categories.size(); i++) {
                                                %>                                
                                                <option value="<%=categories.get(i).getId()%>"><%=categories.get(i).getName()%></option>                                
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b>Description <span class="red">*</span>: </b>		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="description" id="description" class="textbox"></h2>
                                        </div>
                                    </div>

                                    <div class="user_name_common">
                                        <b>Image <span class="red">*</span>:</b>
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="image1" id="image1" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b></b>                                        
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="image2" id="image2" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">   
                                        <b></b>                                         
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="image3" id="image3" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">  
                                        <b></b>                                         
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="image4" id="image4" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">       
                                        <b></b>                                        
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="image5" id="image5" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b>Video  <span class="red">*</span>:</b>                                        		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="video" id="video" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b>Plan date: <span class="red">*</span>: </b>	
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <input type="date" name="startdate" id="startdate" value="">
                                        </div>	
                                    </div>
                                    <div class="user_name_common">
                                        <b>Plan time:  <span class="red">*</span>: </b>                      		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <input type="time" name="starttime" id="starttime" value="">
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b>Close date  <span class="red">*</span>: </b>		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <input type="date" name="enddate" id="enddate" value="">
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b>Close time  <span class="red">*</span>: </b>                                        		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <input type="time" name="endtime" id="endtime" value="">
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b>Status  <span class="red">*</span>:</b>
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
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
                                        <b>Starting price  <span class="red">*</span>: </b>		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="startingprice" id="startingprice"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b>Buy now price<span class="red">*</span>: </b>                                        		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="buynowprice" id="buynowprice"></h2>
                                        </div>
                                    </div>
                                </td>
                            </tr>                           
                        </table>
                        <br>
                        <table align="center">
                            <tr>
                                <td width="90"></td>
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
