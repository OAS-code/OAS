<%-- 
    Document   : ListAllAuction
    Created on : Jul 17, 2014, 4:15:07 PM
    Author     : MrTu
--%>

<%@page import="Entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage Auction</title>
    </head>
    <body>
        <%@ include file="perm_staff.jsp" %>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="Auction Manager">Manage Auction</h1>
                <p>&nbsp;</p>
            </div>

            <form name="form1" method="post" action="AuctionController">

                <div class="message_common">
                    <div class="login_middle_common_profil">
                        <table border="0" cellspacing="10" cellpadding="10">
                            <tr>
                                <td width="500">

                                    <div class="user_name_common">
                                        <b>Auction status: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2>
                                                <select name="auction_status" class=" text_bg select" id="auction_status">	
                                                    <option value="" selected="selected">Select auction status</option>
                                                    <option value="0">Inactive</option>
                                                    <option value="1">Active</option>
                                                    <option value="2">Future</option>
                                                    <option value="3">Closed</option>
                                                </select>
                                            </h2>
                                        </div>
                                    </div>

                                    <div class="user_name_common">
                                        <b>Category: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld">
                                            <h2>
                                                <select name="category" class=" text_bg select" id="category" style="">
                                                    <option value="" selected="selected">Select category</option>
                                                    <%
                                                        ArrayList<Category> array = (ArrayList<Category>) request.getAttribute("array");
                                                        for (int i = 0; i < array.size(); i++) {
                                                    %>                                
                                                    <option value="<%=array.get(i).getId()%>"><%=array.get(i).getName()%></option>                                
                                                    <%}%>
                                                </select>
                                            </h2>
                                        </div>
                                    </div>

                                    <div class="user_name_common">
                                        <b>Keyword: </b>
                                    </div>

                                    <div class="user_name_common" style="width:400px;">
                                        <div class="text_feeld" style="width:330px;">
                                            <h2><input type="text" name="txtsearch" maxlength="100" id="txtsearch" class="textbox"></h2>
                                        </div>	
                                    </div>
                                </td>
                            </tr>


                        </table>

                        <br>

                        <table  cellspacing="10" cellpadding="10">
                            <tr>
                                <td width="91">

                                </td>
                                <td>
                                    <div class="profil_butoon" style="width:auto;">
                                        <div class="res_left"></div>
                                        <div class="res_mid" style="width:auto;">
                                            <a style="width:auto;">
                                                <input type="submit" name="search" id="search" value="SEARCH" title="SEARCH">
                                                <input type="hidden" name="service" id="service" value="search" >
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
                                                <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'AuctionController?service=listall'" >
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
                                                <input type="button" name="add" id="add" value="Add new auction" onclick="window.location = 'AuctionController?service=add_auction';">    
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
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
            <jsp:include page="table_auction.jsp" />   
        </div>
    </body>
</html>
