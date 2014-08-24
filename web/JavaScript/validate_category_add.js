/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validateAddCategory() {
    
    document.getElementById("error").innerHTML = '';
    var total = 0;
    if (checkCategoryname()){
        total++;
    }
   
    if (checkDescription()){
        total++;
        
    }
      if (total < 2) {
        return false;
    }
    return true;
}
function checkCategoryname() {
    var name = document.forms["AddCategoryForm"]["name"].value;
    if (!name || name.length < 1) {
        document.getElementById("errorCategoryname").innerHTML = '<font color="red">Please enter Category name!</font>';
        return false;
    } 
    if (name.length > 20) {
        document.getElementById("errorCategoryname").innerHTML = '<font color="red">Category name can not contain more than 20 characters.</font>';
        return false;
    }
    
    document.getElementById("errorCategoryname").innerHTML = '';
    return true;
}

function checkDescription(){
    var description = document.forms["AddCategoryForm"]["description"].value;
    
    if (description.length > 100) {
       
        document.getElementById("errorDescription").innerHTML = '<font color="red">Description must contains at most 100 characters.</font>';
        return false;
    }
    document.getElementById("errorDescription").innerHTML = '';
    return true;
}
