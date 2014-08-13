/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Time;
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
    Date start_time;
    Date end_date;
    Date end_time;
    double starting_price;
    double buy_now_price;
    int status;
    String video;
    String image1;
    String image2;
    String image3;
    String image4;
    String image5;

    public Auction() {
    }

    public Auction(int categoryid, int sellerid, String title, String description, Date start_date, Date end_date, double starting_price, double buy_now_price, int status, String video, String image1, String image2, String image3, String image4, String image5) {
        this.categoryid = categoryid;
        this.sellerid = sellerid;
        this.title = title;
        this.description = description;
        this.start_date = start_date;
        this.end_date = end_date;
        this.starting_price = starting_price;
        this.buy_now_price = buy_now_price;
        this.status = status;
        this.video = video;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
        this.image5 = image5;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getImage5() {
        return image5;
    }

    public void setImage5(String image5) {
        this.image5 = image5;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Time start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Time end_time) {
        this.end_time = end_time;
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

    public void setBuy_now_price(double buy_now_price) {
        this.buy_now_price = buy_now_price;
    }

    public void setStatus(String status) {
        if (status.equals("Inactive")) {
            this.status = 0;
        } else if (status.equals("Active")) {
            this.status = 1;
        } else if (status.equals("Future")) {
            this.status = 2;
        } else if (status.equals("Closed")) {
            this.status = 3;
        } else {
            this.status = 0;
        }
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

    public double getBuy_now_price() {
        return buy_now_price;
    }

    public String getStatus() {
        if (status == 0) {
            return "Inactive";
        } else if (status == 1) {
            return "Active";
        } else if (status == 2) {
            return "Future";
        } else if (status == 3) {
            return "Closed";
        } else {
            return "Inactive";
        }
    }

}
