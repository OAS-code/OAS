<%-- 
    Document   : AddAuction
    Created on : Jul 17, 2014, 9:11:06 PM
    Author     : MrTu 2
--%>
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
                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <div class="user_name_common">
                            <p>
                                Title <span class="red">*</span>: 
                            </p>
                            <div class="text_feeld">
                                <h2>
                                    <input type="text" maxlength="100" name="title" id="title" class="textbox">
                                </h2>
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Category</p>
                            <div class="text_feeld">
                                <select name="cb2" id="cb2">
                                    
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
                            <p>Plan date  <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <input type="date" name="startdate" id="startdate" >
                            </div>		
                        </div>
                        <div class="user_name_common">
                            <p>Close date  <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <input type="date" name="enddate" id="enddate">
                            </div>		
                        </div>

                        <div class="user_name_common">
                            <p>Status  <span class="red">*</span>:</p>
                            <div class="text_feeld">
                                <select name="cb2" id="cb2">
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                    <option value="Future">Future</option>
                                    <option value="Closed">Closed</option>
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
                            <p>Reserve price  <span class="red">*</span>: </p>
                            <div class="text_feeld">
                                <h2><input type="text" name="reserveprice" id="reserveprice"></h2>
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
        <!--<div style="width: 500px;margin: auto;">
            <div style="width: 500px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Add new auction</h2> 
                <br>
                <form name="form1" method="post" action="AuctionController">
                    <table>
                        <tr>
                            <td style="text-align: right">Title:</td>
                            <td>
                                <input type="text" name="title" id="title">
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">Category:</td>
                            <td>
                                <select name="cb1" id="cb1"> 
        <jsp:useBean id="array" class="java.util.ArrayList" scope="request">                               
        </jsp:useBean>              
        <c:forEach var="category" items="${array}">                                       
            <option value="${category.categoryid}">${category.name}</option> 
        </c:forEach>
    </select> 
</td>                                
</tr>              
<tr>
<td style="text-align: right">Description:</td>
<td>
    <textarea name="description" id="description"></textarea>
</td>
</tr>
<tr>
<td style="text-align: right">Image:</td>  
<td>
    <input type="text" name="image1" id="image1" placeholder="Enter url image...">
</td>
</tr>
<tr>
<td></td> 
<td>
    <input type="text" name="image2" id="image2" placeholder="Enter url image...">
</td>
</tr>
<tr>
<td></td>
<td>
    <input type="text" name="image3" id="image3" placeholder="Enter url image...">
</td>
</tr>
<tr>
<td></td>  
<td>
    <input type="text" name="image4" id="image4" placeholder="Enter url image...">
</td>
</tr>
<tr>
<td></td>  
<td>
    <input type="text" name="image5" id="image5" placeholder="Enter url image...">
</td>
</tr>
<tr>
<td style="text-align: right">Video:</td>
<td>
    <input type="text" name="video" id="video" placeholder="Enter url video...">
</td>
</tr>
<tr>
<td style="text-align: right">Start date:</td>
<td>
    <input type="date" name="startdate" id="startdate">
</td>
</tr>
<tr>
<td style="text-align: right">End date:</td>
<td>                    
    <input type="date" name="enddate" id="enddate">
</td>
</tr>
<tr>
<td style="text-align: right">Starting price:</td>
<td>                    
    <input type="text" name="startingprice" id="startingprice">
</td>
</tr>
<tr>
<td style="text-align: right">Reserve price:</td>
<td>                    
    <input type="text" name="reserveprice" id="reserveprice">
</td>
</tr>
<tr>
<td style="text-align: right">Buy now price:</td>
<td>                    
    <input type="text" name="buynowprice" id="buynowprice">
</td>
</tr>
<tr>
<td style="text-align: right">Status:</td>
<td>                    
    <select name="cb2" id="cb2">
        <option value="Active">Active</option>
        <option value="Deactive">Deactive</option>
        <option value="Future">Future</option>
        <option value="Closed">Closed</option>
    </select>
</td>
</tr>
<tr>
<td></td>
<td>
    <input type="submit" name="add" id="add" value="Add">
    <input type="hidden" name="service" id="service" value="addnewauction">
    <input type="reset" name="reset" id="reset" value="Clear">
    <input type="button" name="reset" id="reset" value="Cancel" onclick="window.location = 'AuctionController?service=listall';">
</td>
</tr>
</table>                
</form>
</div>
</div>-->
    </body>
</html>
