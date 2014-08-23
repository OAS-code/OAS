/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateRegister(){
    return checkUsername() && ckeckEmail();
}
function checkUsername(){
    var username = document.forms["registerForm"]["username"].value;
    if (username == ""){
        document.getElementById("errorUsername").innerHTML='<div id="errorUsername"><label><span class="red">Please enter Username!</span></label></div>';
        return false;
    }
    if(username.length < 3 || username.length > 20 )  {
       document.getElementById("errorUsername").innerHTML='<div id="errorUsername"><label><span class="red">Username must contains at least 3 characters and at most 20 characters.</span></label></div>';
        return false;     
        
    }
    return true;
}
function checkEmail(){
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var email = document.forms["registerForm"]["email"].value;
    if (email.value.match(mailformat)){
        return true;
    }
    else {
        document.getElementById("errorEmail").innerHTML='<div id="errorEmail"><label><span class="red">Please enter valid Email!</span></label></div>';
        return false;
    }
}
