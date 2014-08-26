<%-- 
    Document   : newjspcp_customer_my_product_home
    Created on : Aug 20, 2014, 12:37:17 AM
    Author     : ducfpt
--%>

<%@page import="Entity.Auction"%>
<%@page import="Entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />  
        <link type="text/css" href="css/en_style.css" rel="stylesheet" media="screen" />
        <%
            String keyword = request.getParameter("keyword");
            String statusString = request.getParameter("status");
            int status = -1;
            String categoryString = request.getParameter("category");
            int category = -1;
            if (keyword == null) {
                keyword = "";
            }
            if (statusString != null) {
                status = Integer.parseInt(statusString);
            }
            if (categoryString != null) {
                category = Integer.parseInt(categoryString);
            }
        %>
    </head>
    <body>
        <div class="my_message_right" id="mybids_page">
            <div class="message_common_border">
                <h1 title="MY PRODUCTS">My Products</h1>
                <p>&nbsp;</p>
            </div>
            <div class="buton_green">		
                <div class="message_common">
                    <div class="form_cont_top">
                        <form method="post" class="admin_form" name="frmproduct" id="frmproduct" action="myproducts">
                            <div class="form_cont_top2">
                                <p style="font-weight:bold;">Keyword</p>
                                <div class="boxcesss_top">
                                    <input type="text" name="keyword_search" id="keyword_search" maxlength="256" value="">
                                </div>
                                <label> <span class="search_info_label" style="color:#1E90FF;">Search by products name</span></label>
                            </div>
                            <div class="form_cont_top2">
                                <p style="font-weight:bold;">Category</p>
                                <div class="boxcesss_top3">
                                    <select name="category_search" id="category_search">
                                        <option value="-1" <%if (category == -1) { %> selected="selected" <% } %>>Select category</option>
                                        <%
                                            ArrayList<Category> categories = (ArrayList<Category>) request.getAttribute("categories");
                                            for (int i = 0; i < categories.size(); i++) {
                                        %> 
                                        <option value="<%=categories.get(i).getId()%>" <%if (category == categories.get(i).getId()) { %> selected="selected" <% }%> ><%=categories.get(i).getName()%></option>                                
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                            <div class="search_one_or">
                                <div class="grand_total_btn_cp">
                                    <div class="save_left"></div>
                                    <div class="save_mid">
                                        <input type="submit" value="Search" name="search_product" title="Search">
                                    </div>
                                    <div class="save_right"></div>
                                </div>
                                <div class="profil_butoon">
                                    <div class="res_left"></div>
                                    <div class="res_mid"><a title="Add product"><input type="button" name="submit_user" value="Add product" onclick="location.href = 'AuctionController?service=add_product';"></a>
                                    </div>
                                    <div class="res_right"></div>
                                </div>	
                            </div>
                        </form>
                    </div>
                    <div class="forms_common">
                        <div class="title_cont_watchilist">
                            <%
                                ArrayList<Auction> auction = (ArrayList<Auction>) request.getAttribute("auction");
                                if (auction == null) {
                            %>

                            <%} else {
                                for (int i=0;i<auction.size();i++) {
                            %>
                            <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="table-top">
                                <thead>
                                    <tr><th width="100" align="center">
                                            <b>Image</b>
                                        </th>
                                        <th width="100" align="center">
                                            <b>Title</b>
                                        </th>
                                        <th width="150" align="center">
                                            <b>Start date / Closed date</b>
                                        </th>
                                        <th width="100" align="center" colspan="3">
                                            <b>Actions</b>
                                        </th>
                                        <th width="100" align="center">
                                            <b> Status</b>
                                        </th>
                                    </tr></thead>

                                <tbody><tr>

                                        <td width="100" align="center">
                                            <h3> 
                                                <img src="<%=auction.get(i).getImgCover()%>" title="<%=auction.get(i).getTitle()%>" width="65" height="65">

                                            </h3>
                                        </td>


                                        <td width="100" align="center">

                                            <a href="" title="<%=auction.get(i).getTitle()%>">
                                                <%=auction.get(i).getTitle()%>
                                            </a>

                                        </td>		
                                        <td width="150" align="center">	
                                            <h2><%=auction.get(i).getFormattedStartDate()%></h2>
                                            <h2><%=auction.get(i).getFormattedEndDate()%></h2>

                                        </td>

                                        <td width="20" align="center">&nbsp;
                                        </td>
                                        <td width="20" align="center"> 
                                            <a href="AuctionController?service=edit_myproduct" title="Product Edit" class="editicon"></a>  
                                            &nbsp;
                                        </td>
                                        <td width="20" align="center">
                                            <a href="" title="Product Delete" onClick="return confirm('Are you sure you want to delete this product?\nThis action can not be undone!')" >
                                                <img src="images/delete.png" border="0">
                                            </a> 
                                            &nbsp;
                                        </td>
                                        <td width="100" align="center">
                                            <a href="" title="">
                                                <%=auction.get(i).getStatus()%>
                                            </a>                               
                                        </td>
                                    </tr>
                                </tbody></table>
                                <%
                                        }
                                    }
                                %>
                        </div>
                        <div class="user" style="display:none;">344</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
