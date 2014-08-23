/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function ajax_place_bid_area(auctionId)
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            document.getElementById("ajax_place_bid_area").innerHTML = xmlhttp.responseText;
        }
    };

    if (document.getElementById("yourbidding")) {
        var userBidValue = document.getElementById("yourbidding").value;
        xmlhttp.open("GET", "BidController?service=ajax_place_bid_area&auctionId=" + auctionId + "&userBidValue=" + userBidValue + "&random=" + Math.random(), true);
    } else {
        xmlhttp.open("GET", "BidController?service=ajax_place_bid_area&auctionId=" + auctionId + "&random=" + Math.random(), true);
    }
    xmlhttp.send();
    return false;
}

function ajax_load_top_bidder(auctionId){
    //document.getElementById("ajax_load_top_bidder").innerHTML = '<img src="images/ajax-loader.gif" align="center"></img>';
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            document.getElementById("ajax_load_top_bidder").innerHTML = xmlhttp.responseText;
        }
    };

    xmlhttp.open("GET", "BidController?service=ajax_load_top_bidder&auctionId=" + auctionId + "&random=" + Math.random(), true);
    xmlhttp.send();
    return false;
}

function ajax_load_current_bid(auctionId){
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
        {
            document.getElementById("ajax_load_current_bid").innerHTML = xmlhttp.responseText;
        }
    };

    xmlhttp.open("GET", "BidController?service=ajax_load_current_bid&auctionId=" + auctionId + "&random=" + Math.random(), true);
    xmlhttp.send();
    return false;
}

function startBidding(auctionId, nextBidValue)
{
    document.getElementById("placebid_btn").innerHTML = '<p>PROCESSING..</p>';
    var userBidValue = document.getElementById("yourbidding").value;
    if (isNaN(userBidValue)) {
        document.getElementById("placebid_btn").innerHTML = '<p><a href="#" onClick="startBidding(' + auctionId + ', ' + nextBidValue + ')" title="BID ME" class="fl popup" id="dialog_link" data-rel="box">PLACE MY BID</a></p>';
        document.getElementById("yourbidding_noti").innerHTML = '<font color=red>Your bid must be in number!</font>';
        return false;
    }
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
            document.getElementById("placebid_btn").innerHTML = xmlhttp.responseText;
            if (xmlhttp.responseText=="CHARGE MONEY"){
                document.getElementById("yourbidding_noti").innerHTML = '<font color=red>Your account balance is not sufficient!</font>';
            }
        }
    };
    xmlhttp.open("GET", "BidController?service=place_bid&auctionId=" + auctionId + "&userBidValue="+userBidValue+"&random=" + Math.random(), true);
    xmlhttp.send();
    return false;
}
