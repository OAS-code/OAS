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
    
    public int getStatusId() {
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
    
    public String getStatus() {
        int statusId = this.getStatusId();
        if (statusId== 0) {
            return "Future";
        } else if (statusId == 1){
            return "On-going";
        } else if (statusId == 2) {
            return "Closed";
        } else if (statusId == 3) {
            return "Banned";
        } else if (statusId == 4) {
            return "Processed";
        } else {
            return "Invalid";
        }
    }
}
