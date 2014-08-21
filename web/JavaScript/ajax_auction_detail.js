/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function pageLoading(auctionId)
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
            document.getElementById("ajax_place_bid").innerHTML = xmlhttp.responseText;
        }
    };
    xmlhttp.open("GET", "BidController?service=auction_detail_loading&auctionId=" + auctionId + "&random=" + Math.random(), true);
    xmlhttp.send();
    return false;
}

function startBidding(auctionId)
{
    document.getElementById("placebid_btn").innerHTML = '<p>PROCESSING..</p>';
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
        }
    };
    xmlhttp.open("GET", "BidController?service=place_bid&auctionId=" + auctionId + "&random=" + Math.random(), true);
    xmlhttp.send();
    return false;
}
