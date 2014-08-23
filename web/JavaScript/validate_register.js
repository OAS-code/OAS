/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateRegister(){
    return checkUsername();
}
function checkUsername(){
    var username = document.forms["registerForm"]["username"].value;
    if ()
    if(username.length < 3 || username.length > 20 )  {
       document.getElementById("errorUsername").innerHTML='<div id="errorUsername"><img src="images/error.png" width="15"><label><span class="red">Username must contains at least 3 characters and at most 20 characters.</span></label></div>';
        return false;     
        
    }
    return true;
}
function checkEmail(){
    
}
