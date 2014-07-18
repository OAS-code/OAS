<%-- 
    Document   : AddAuctionProcess
    Created on : Jul 18, 2014, 12:26:03 PM
    Author     : MrTu
--%>

<%@page import="java.util.Date"%>
<%@page import="DAO.AuctionDAO"%>
<%@page import="Entity.Auction"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            AuctionDAO dao = new AuctionDAO();
            Auction auc = new Auction();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String image = request.getParameter("image");
            String status = request.getParameter("cb2");
            String categoryid1 = request.getParameter("cb1");
            String start_date1 = request.getParameter("startdate");
            String end_date1 = request.getParameter("enddate");
            String starting_price1 = request.getParameter("startingprice");
            String reserve_price1 = request.getParameter("reserveprice");
            String buy_now_price1 = request.getParameter("buynowprice");
            int seller_id = 1;
            int categoryid = Integer.parseInt(categoryid1);           
            Date start_date= (Date)simpleDateFormat.parse(start_date1);
            Date end_date = (Date)simpleDateFormat.parse(end_date1);
            
            double starting_price = Double.parseDouble(starting_price1);
            double reserve_price = Double.parseDouble(reserve_price1);
            double buy_now_price = Double.parseDouble(buy_now_price1);
            Auction auction = new Auction(categoryid, seller_id, title, description, image,start_date, end_date, starting_price, reserve_price, buy_now_price, status);
            int n = dao.add(auction);
            if(n>0){
                response.sendRedirect("AuctionController?service=listall");
                return;
            }

        %>
        <input type="text" id="date" name="date" value="<%=start_date1%>">
    </body>
</html>
