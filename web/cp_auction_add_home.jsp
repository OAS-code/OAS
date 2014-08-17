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
        <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
        <style type="text/css">
            .custom-date-style {
                background-color: red !important;
            }
        </style>
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
                                <td width="600">
                                    <div class="user_name_common">
                                        <b style="width:130px">
                                            Title <span class="red">*</span>: 
                                        </b>                                        		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2>
                                                <input type="text" name="title" id="title" class="textbox" maxlength="100">
                                            </h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b style="width:130px">Category:</b>                                      
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <select name="categoryId" id="categoryId">
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
                                        <b style="width:130px">Description: </b>		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="description" id="description" class="textbox"></h2>
                                        </div>
                                    </div>

                                    <div class="user_name_common">
                                        <b style="width:130px">Starting price  <span class="red">*</span>: </b>		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="number" name="startingPrice" id="startingprice"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b style="width:130px">Buy now price<span class="red">*</span>: </b>                                        		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="number" name="buynowPrice" id="buynowprice"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b style="width:130px">Increment price<span class="red">*</span>: </b>                                        		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="number" name="increaseBy" id="incrementprice"></h2>
                                        </div>
                                    </div>

                                    <div class="user_name_common">
                                        <b style="width:130px">Starting date: <span class="red">*</span>: </b>	
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <input type="text" id="startdate" name="startDate" value="">
                                        </div>	
                                    </div>
                                    <div class="user_name_common">
                                        <b style="width:130px">Closing date  <span class="red">*</span>: </b>		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <input type="text" id="enddate" name="endDate" value="">
                                        </div>
                                    </div>




                                    <div class="user_name_common">
                                        <b style="width:130px">Cover image <span class="red">*</span>:</b>
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="img_cover" id="img_cover" class="textbox"></h2>
                                        </div>
                                    </div>

                                    <div class="user_name_common">
                                        <b style="width:130px">Images (Optional):</b>                                        
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="img_1" id="img_1" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">   
                                        <b style="width:130px"></b>                                         
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="img_2" id="img_2" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">  
                                        <b style="width:130px"></b>                                         
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="img_3" id="img_3" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">       
                                        <b style="width:130px"></b>                                        
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="img_4" id="img_4" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">       
                                        <b style="width:130px"></b>                                        
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="img_5" id="img_5" class="textbox"></h2>
                                        </div>
                                    </div>
                                    <div class="user_name_common">
                                        <b style="width:130px">Video (Youtube):</b>                                        		
                                    </div>
                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2><input type="text" name="v_youtube" id="v_youtube" class="textbox"></h2>
                                        </div>
                                    </div>
                                </td>
                            </tr>                           
                        </table>
                        <br>
                        <table align="center">
                            <tr>
                                <td width="120"></td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">
                                                <input type="hidden" name="service" id="service" value="add_new_auction" >
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
    <script type="text/javascript" src="JavaScript/jquery_1.js"></script>
    <script type="text/javascript" src="JavaScript/jquery.datetimepicker.js"></script>
    <script>
                                                    $('#startdate').datetimepicker({
                                                        inline: true
                                                    });
                                                    $('#enddate').datetimepicker({
                                                        inline: true
                                                    });
    </script>
</html>
