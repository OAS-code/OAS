<%-- 
    Document   : ListAllAuction
    Created on : Jul 17, 2014, 4:15:07 PM
    Author     : MrTu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Manage Auction</title>
    </head>
    <body>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="Auction Manager">Search auction</h1>
                <p>&nbsp;</p>
            </div>

            <form name="form1" method="post" action="AuctionController">

                <div class="message_common">
                    <div class="login_middle_common_profil">

                        <div class="user_name_common">
                            <p>Keyword:</p>
                            <div class="text_feeld">
                                <h2><input type="text" name="txtsearch" maxlength="100" id="txtsearch" class="textbox"></h2>
                            </div>		
                        </div>

                        <div class="user_name_common">
                            <p>Auction type:</p>
                            <div class="text_feeld">
                                <h2>
                                    <select name="cb1" class=" text_bg select" id="cb1" >	
                                        <option value="" selected="selected">Select auction type</option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Future"  >Future</option>
                                        <option value="Closed"  >Closed</option>
                                    </select>
                                </h2>
                            </div>	

                            <p>Category:</p>
                            <div class="text_feeld">
                                <h2>
                                    <select name="cb2" class=" text_bg select" id="cb2" >	
                                        <option value="" selected="selected">Select category</option>
                                        <option value="Active">Activated</option>
                                        <option value="Deactive">Deactivated</option>
                                    </select>
                                </h2>
                            </div>

                            <p>&nbsp;&nbsp;&nbsp;</p>

                            <table>
                                <tr>
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
                                                    <input type="button" name="add" id="add" value="Add new auction" onclick="window.location = 'cp_auction_add.jsp';">    
                                                </a>
                                            </div>
                                            <div class="res_right"></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </form>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
            <jsp:include page="table_auction.jsp" />   
        </div>
    </body>
</html>
