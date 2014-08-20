/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadXMLDoc()
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
            document.getElementById("placebid_btn").innerHTML = xmlhttp.responseText;
        } else {
            document.getElementById("placebid_btn").innerHTML = "Placing bid..";
        }
    };
    xmlhttp.open("GET", "AJAX/placebid.jsp?random=" + Math.random(), true);
    xmlhttp.send();
    return false;
}