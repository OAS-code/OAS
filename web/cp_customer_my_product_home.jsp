<%-- 
    Document   : newjspcp_customer_my_product_home
    Created on : Aug 20, 2014, 12:37:17 AM
    Author     : ducfpt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection" />
        <link rel="shortcut icon" href="images/fav-10.gif" type="image/x-icon" />  
        <link type="text/css" href="css/en_style.css" rel="stylesheet" media="screen" />
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
                                        <option value="">Select</option>

                                        <option value="6">
                                            Audi</option>

                                        <option value="8">
                                            BMW</option>

                                        <option value="10">
                                            Car</option>

                                        <option value="1">
                                            Computers</option>

                                        <option value="2">
                                            Electronics</option>

                                        <option value="7">
                                            Innova</option>

                                        <option value="3">
                                            Mobiles</option>

                                        <option value="11">
                                            Office equipment</option>

                                        <option value="4">
                                            Photography</option>

                                        <option value="5">
                                            Sports</option>

                                        <option value="9">
                                            Toyoto</option>

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
                                    <div class="res_mid"><a title="Add product"><input type="button" name="submit_user" value="Add product" onclick="location.href = ''"></a>
                                    </div>
                                    <div class="res_right"></div>
                                </div>	
                            </div>
                        </form>
                    </div>
                    <div class="forms_common">
                        <div class="title_cont_watchilist">
                            <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="table-top">
                                <thead>
                                    <tr><th width="100" align="center">
                                            <b>Image</b>
                                        </th>
                                        <th width="100" align="center">
                                            <b>Title</b>
                                        </th>
                                        <th width="150" align="center">
                                            <b>Start date-Closed date</b>
                                        </th>
                                        <th width="100" align="center" colspan="3">
                                            <b>Auction</b>
                                        </th>
                                        <th width="100" align="center">
                                            <b>Auction type</b>
                                        </th>
                                        <th width="100" align="center">
                                            <b> Status</b>
                                        </th>
                                    </tr></thead>

                                <tbody><tr>

                                        <td width="100" align="center">
                                            <h3> 
                                                <img src="http://www.unieauction.com/buy-sell-demo/public/uploaded_files/products/thumb1/53e32515743d6Sports_bikes_wallpaper6.jpg" title="cbr250" width="65" height="65">

                                            </h3>
                                        </td>


                                        <td width="100" align="center">

                                            <a href="http://www.unieauction.com/buy-sell-demo/auctions/view/dsadfsaf" title="Dsadfsaf">
                                                Honda CBR 250</a>

                                        </td>		
                                        <td width="150" align="center">	
                                            <h2>2014-08-15 12:45:00 - 2014-08-17 01:00:00</h2>

                                        </td>

                                        <td width="20" align="center">&nbsp;
                                        </td>
                                        <td width="20" align="center"> 
                                            <a href="http://www.unieauction.com/buy-sell-demo/site/buyerseller/editproduct/277 " title="Product Edit" class="editicon"></a>                                        &nbsp;
                                        </td>
                                        <td width="20" align="center">
                                        </td>



                                        <td width="100" align="center">

                                            <h2 style="width:85px;">Beginner</h2>
                                        </td>
                                        <td width="100" align="center">
                                            InActive                                </td>

                                    </tr><tr>

                                        <td width="100" align="center">
                                            <h3> 
                                                <img src="http://www.unieauction.com/buy-sell-demo/public/uploaded_files/products/thumb1/53e32582313fbkeyboard-.jpg" title="Test1" width="65" height="65">

                                            </h3>
                                        </td>


                                        <td width="100" align="center">

                                            <a href="http://www.unieauction.com/buy-sell-demo/auctions/view/test1" title="Test1">
                                                Keyboard razer</a>

                                        </td>		
                                        <td width="150" align="center">	
                                            <h2>2014-08-15 01:00:00 - 2014-08-16 01:00:00</h2>

                                        </td>

                                        <td width="20" align="center">&nbsp;
                                            <a href="http://www.unieauction.com/buy-sell-demo/site/buyerseller/pennyauctionedit?pid=270 " title="Auction Edit" class="auction-editicon"></a>                
                                        </td>
                                        <td width="20" align="center"> 
                                            <a href="http://www.unieauction.com/buy-sell-demo/site/buyerseller/editproduct/270 " title="Product Edit" class="editicon"></a>                                        &nbsp;
                                        </td>
                                        <td width="20" align="center">
                                            <a onclick="frmdel_products(270, 1);" class="deleteicon" title="Delete"></a>                                    </td>



                                        <td width="100" align="center">

                                            <h2 style="width:85px;">Pennyauction</h2>
                                        </td>
                                        <td width="100" align="center">
                                            InActive                                </td>

                                    </tr>
                                </tbody></table>
                        </div>
                        <div class="user" style="display:none;">344</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
