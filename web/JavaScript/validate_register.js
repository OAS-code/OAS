/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateRegister() {
    var total = 0;
    if (checkUsername()){
        total ++;
    }
    if (checkEmail()){
        total ++;
    }
    if (total <2) {
        return false;
    }
    return true;
}
function checkUsername() {
    var username = document.forms["registerForm"]["username"].value;
    if (username == "" || username == null) {
        document.getElementById("errorUsername").innerHTML = '<div id="errorUsername"><label><span class="red">Please enter Username!</span></label></div>';
        return false;
    } 
    if (username.length < 3 || username.length > 20) {
        document.getElementById("errorUsername").innerHTML = '<div id="errorUsername"><label><span class="red">Username must contains at least 3 characters and at most 20 characters.</span></label></div>';
        return false;
    }
    if (/^[a-zA-Z0-9- ]*$/.test(username) == false) {
        document.getElementById("errorUsername").innerHTML = '<div id="errorUsername"><label><span class="red">Username contains illegal characters!</span></label></div>';
        return false;
    }
    if (username.indexOf(' ') !== -1) {
        document.getElementById("errorUsername").innerHTML = '<div id="errorUsername"><label><span class="red">Username contains space characters!</span></label></div>';
        return false;
    }
    document.getElementById("errorUsername").innerHTML = '';
    return true;
}
function checkEmail() {
    var email = document.forms["registerForm"]["email"].value;
    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if (email == "" || email == null) {
        document.getElementById("errorEmail").innerHTML = '<div id="errorEmail"><label><span class="red">Please enter Email!</span></label></div>';
        return false;
    }
    if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
        document.getElementById("errorEmail").innerHTML = '<div id="errorEmail"><label><span class="red">Please enter valid Email!</span></label></div>';
        return false;
    }
    document.getElementById("errorEmail").innerHTML = '';
    return true;
}
