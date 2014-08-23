/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validateAuction() {
    var total = 0;
    if (checkTitle()) {
        total++;
    }
    if (checkDescription()) {
        total++;
    }
    if (checkStartingPrice()) {
        total++;
    }
    if (checkBuyNowPrice()) {
        total++;
    }
    if(checkIncrementPrice()){
        total++;
    }
    if(checkCoverImage()){
        total++;
    }
    if(checkImage1()){
        total++;
    }
    if(checkImage2()){
        total++;
    }
    if(checkImage3()){
        total++;
    }
    if(checkImage4()){
        total++;
    }
    if(checkImage5()){
        total++;
    }
    if (total < 11) {
        return false;
    }
    return true;

}

function checkTitle() {
    var title = document.forms["addAuctionForm"]["title"].value;
    if (title == null || title == "") {
        document.getElementById("errorTitle").innerHTML = '<div id="errorTitle" style="width:300px"><br><font color="red">Please enter auction title.</font></div>';
        return false;
    }
    if (title.length < 3 || title.length > 20) {
        document.getElementById("errorTitle").innerHTML = '<div id="errorTitle" style="width:300px"><br><font color="red">Title must contains at least 3 characters and at most 20 characters.</font></div>';
        return false;
    }
    document.getElementById("errorTitle").innerHTML = '';
    return true;
}
function checkDescription() {
    var description = document.forms["addAuctionForm"]["description"].value;
    if (description.length > 500) {
        document.getElementById("errorDescription").innerHTML = '<div id="errorDescription" style="width:300px"><br><font color="red">Description must containsat most 500 characters.</font></div>';
        return false;
    }
    document.getElementById("errorDescription").innerHTML = '';
    return true;
}
function checkStartingPrice() {
    var startingPrice = document.forms["addAuctionForm"]["startingprice"].value;
    if (startingPrice == null || startingPrice == "") {
        document.getElementById("errorStartingprice").innerHTML = '<div id="errorStartingprice" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Please enter starting pricce.</font></div>';
        return false;
    }
    if (startingPrice < 0) {
        document.getElementById("errorStartingprice").innerHTML = '<div id="errorStartingprice" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Starting price must be greater than 0.</font></div>';
        return false;
    }
    document.getElementById("errorStartingprice").innerHTML = '';
    return true;
}
function checkBuyNowPrice() {
    var buyNowPrice = document.forms["addAuctionForm"]["buynowprice"].value;
    var startingPrice = document.forms["addAuctionForm"]["startingprice"].value;
    if (buyNowPrice == null || buyNowPrice == "") {
        document.getElementById("errorBuynowprice").innerHTML = '<div id="errorBuynowprice" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Please enter buy now price.</font></div>';
        return false;
    }
    if (buyNowPrice < 0) {
        document.getElementById("errorBuynowprice").innerHTML = '<div id="errorBuynowprice" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Buy now price must be greater than 0.</font></div>';
        return false;
    }
    if (startingPrice >= buyNowPrice) {
        document.getElementById("errorBuynowprice").innerHTML = '<div id="errorBuynowprice" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Buy now price must be greater than starting price.</font></div>';
        return false;
    }
    document.getElementById("errorBuynowprice").innerHTML = '';
    return true;
}
function checkIncrementPrice() {
    var buyNowPrice = document.forms["addAuctionForm"]["buynowprice"].value;
    var incrementPrice = document.forms["addAuctionForm"]["incrementprice"].value;
    if (incrementPrice == null || incrementPrice == "") {
        document.getElementById("errorIncrementprice").innerHTML = '<div id="errorIncrementprice" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Please enter increment price.</font></div>';
        return false;
    }
    if(incrementPrice < 0){
        document.getElementById("errorIncrementprice").innerHTML = '<div id="errorIncrementprice" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Increment price must be greater than 0.</font></div>';
        return false;
    }
    if(incrementPrice >=buyNowPrice){
        document.getElementById("errorIncrementprice").innerHTML = '<div id="errorIncrementprice" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Increment must be smaller than buy now price.</font></div>';
        return false;
    }
    document.getElementById("errorIncrementprice").innerHTML = '';
    return true;
}
function checkCoverImage(){
    var coverImage= document.forms["addAuctionForm"]["img_cover"].value;
    if(coverImage==null || coverImage==""){
        document.getElementById("errorCoverimage").innerHTML = '<div id="errorCoverimage" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Please enter cover image.</font></div>';
        return false;
    }
    if(coverImage.length() > 200){
        document.getElementById("errorCoverimage").innerHTML = '<div id="errorCoverimage" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Cover image link url must contains at most 200 characters.</font></div>';
        return false;
    }
    document.getElementById("errorCoverimage").innerHTML = '';
    return true;
}
function checkImage1(){
    var image1= document.forms["addAuctionForm"]["img_1"].value;
    if(image1.length >200){
        document.getElementById("errorImage1").innerHTML = '<div id="errorImage1" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Image link url must contains at most 200 characters.</font></div>';
        return false;
    }
    document.getElementById("errorImage1").innerHTML = '';
    return true;
}
function checkImage2(){
    var image2= document.forms["addAuctionForm"]["img_2"].value;
    if(image2.length >200){
        document.getElementById("errorImage2").innerHTML = '<div id="errorImage2" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Image link url must contains at most 200 characters.</font></div>';
        return false;
    }
    document.getElementById("errorImage2").innerHTML = '';
    return true;
}
function checkImage3(){
    var image3= document.forms["addAuctionForm"]["img_3"].value;
    if(image3.length >200){
        document.getElementById("errorImage3").innerHTML = '<div id="errorImage3" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Image link url must contains at most 200 characters.</font></div>';
        return false;
    }
    document.getElementById("errorImage3").innerHTML = '';
    return true;
}
function checkImage4(){
    var image4= document.forms["addAuctionForm"]["img_4"].value;
    if(image4.length >200){
        document.getElementById("errorImage4").innerHTML = '<div id="errorImage4" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Image link url must contains at most 200 characters.</font></div>';
        return false;
    }
    document.getElementById("errorImage4").innerHTML = '';
    return true;
}
function checkImage5(){
    var image5= document.forms["addAuctionForm"]["img_5"].value;
    if(image5.length >200){
        document.getElementById("errorImage5").innerHTML = '<div id="errorImage5" style="width:500px;padding-top:4px"><font color="red" >&nbsp;Image link url must contains at most 200 characters.</font></div>';
        return false;
    }
    document.getElementById("errorImage5").innerHTML = '';
    return true;
}