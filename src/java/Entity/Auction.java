/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Entity;

import java.util.Date;





/**
 *
 * @author MrTu
 */
public class Auction {
     int auctionid;
    int categoryid;
    int sellerid;
    String title;
    String description;
    Date start_date;
    Date end_date;
    double starting_price;
    double reserve_price;
    double buy_now_price;
    String status; 

    public Auction() {
    } 

    public Auction(int auctionid, int categoryid, int sellerid, String title, String description, Date start_date, Date end_date, double starting_price, double reserve_price, double buy_now_price, String status) {
        this.auctionid = auctionid;
        this.categoryid = categoryid;
        this.sellerid = sellerid;
        this.title = title;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
        this.starting_price = starting_price;
        this.reserve_price = reserve_price;
        this.buy_now_price = buy_now_price;
        this.status = status;
    }  

    public void setAuctionid(int auctionid) {
        this.auctionid = auctionid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public void setSellerid(int sellerid) {
        this.sellerid = sellerid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public void setStarting_price(double starting_price) {
        this.starting_price = starting_price;
    }

    public void setReserve_price(double reserve_price) {
        this.reserve_price = reserve_price;
    }

    public void setBuy_now_price(double buy_now_price) {
        this.buy_now_price = buy_now_price;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getAuctionid() {
        return auctionid;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public int getSellerid() {
        return sellerid;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public Date getStart_date() {
        return start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public double getStarting_price() {
        return starting_price;
    }

    public double getReserve_price() {
        return reserve_price;
    }

    public double getBuy_now_price() {
        return buy_now_price;
    }

    public String getStatus() {
        return status;
    }
    
}
