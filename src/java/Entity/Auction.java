/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;
import org.joda.time.DateTime;


/**
 *
 * @author Duc
 */

public class Auction {
    int id;
    int categoryId;
    String categoryName;
    int sellerId;
    String sellerName;
    String title;
    String description;
    DateTime startDate;
    DateTime endDate;
    double startPrice;
    double buynowPrice;
    double increaseBy;
    int moderateStatus;
    String imgCover;
    String vYoutube;
    String img1;
    String img2;
    String img3;
    String img4;
    String img5;

    public Auction() {
 
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getSellerId() {
        return sellerId;
    }

    public void setSellerId(int sellerId) {
        this.sellerId = sellerId;
    }

    public String getSellerName() {
        return sellerName;
    }

    public void setSellerName(String sellerName) {
        this.sellerName = sellerName;
    }
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getModerateStatus() {
        return moderateStatus;
    }

    public void setModerateStatus(int moderateStatus) {
        this.moderateStatus = moderateStatus;
    }
    
    public DateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(DateTime startDate) {
        this.startDate = startDate;
    }

    public DateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(DateTime endDate) {
        this.endDate = endDate;
    }

    public double getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(double startPrice) {
        this.startPrice = startPrice;
    }

    public double getBuynowPrice() {
        return buynowPrice;
    }

    public void setBuynowPrice(double buynowPrice) {
        this.buynowPrice = buynowPrice;
    }

    public double getIncreaseBy() {
        return increaseBy;
    }

    public void setIncreaseBy(double increaseBy) {
        this.increaseBy = increaseBy;
    }
    
    

    public String getImgCover() {
        return imgCover;
    }

    public void setImgCover(String imgCover) {
        this.imgCover = imgCover;
    }

    public String getvYoutube() {
        return vYoutube;
    }

    public void setvYoutube(String vYoutube) {
        this.vYoutube = vYoutube;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public String getImg5() {
        return img5;
    }

    public void setImg5(String img5) {
        this.img5 = img5;
    }
    
    public int getStatus() {
        if (moderateStatus == 0) { // Active
            DateTime currentDate = new DateTime().now();
            if (currentDate.isAfterNow()) { 
                return 0; //Future auctions
            } else if (startDate.isBeforeNow() && endDate.isAfterNow()) { 
                return 1; // On-going auctions.
            } else if (endDate.isBeforeNow()) { // Closed auctions.
                return 2;
            }
            return 5; // Invalid auctions.
        } else if (moderateStatus == 1) { // Banned auctions
            return 3; // Banned acutions
        } else if (moderateStatus == 2) { // Processed auctions.
            return 4; // Processed auctions.
        } else 
        return 5; // Invalid auctions.
    }

    ///////////////////////
    /*
    public String getVideo() {
        return vYoutube;
    }

    public void setVideo(String video) {
        this.vYoutube = video;
    }

    public String getImage1() {
        return img1;
    }

    public void setImage1(String image1) {
        this.img1 = image1;
    }

    public String getImage2() {
        return img2;
    }

    public void setImage2(String image2) {
        this.img2 = image2;
    }

    public String getImage3() {
        return img3;
    }

    public void setImage3(String image3) {
        this.img3 = image3;
    }

    public String getImage4() {
        return img4;
    }

    public void setImage4(String image4) {
        this.img4 = image4;
    }

    public String getImage5() {
        return img5;
    }

    public void setImage5(String image5) {
        this.img5 = image5;
    }

    public void setAuctionid(int auctionid) {
        this.id = auctionid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryId = categoryid;
    }

    public void setSellerid(int sellerid) {
        this.sellerId = sellerid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setStart_date(Date start_date) {
        this.startDate = start_date;
    }

    public void setEnd_date(Date end_date) {
        this.endDate = end_date;
    }

    public void setStarting_price(double starting_price) {
        this.startPrice = starting_price;
    }

    public void setBuy_now_price(double buy_now_price) {
        this.buynowPrice = buy_now_price;
    }

    public void setStatus(int moderateStatus) {
        this.moderateStatus = moderateStatus;
    }

    public int getAuctionid() {
        return id;
    }

    public int getCategoryid() {
        return categoryId;
    }

    public int getSellerid() {
        return sellerId;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public Date getStart_date() {
        return startDate;
    }

    public Date getEnd_date() {
        return endDate;
    }

    public double getStarting_price() {
        return startPrice;
    }

    public double getBuy_now_price() {
        return buynowPrice;
    }

    public int getStatusId() {
        return this.moderateStatus;
    }

    public String getStatus() {
        if (moderateStatus == 0) {
            return "Inactive";
        } else if (moderateStatus == 1) {
            return "Active";
        } else if (moderateStatus == 2) {
            return "Future";
        } else if (moderateStatus == 3) {
            return "Closed";
        } else {
            return "Inactive";
        }
    }
*/
}
