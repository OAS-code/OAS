<%-- 
    Document   : change_password
    Created on : Aug 7, 2014, 12:31:27 AM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="my_message_right" id="edit_profile_page">
            <div class="message_common_border">
                <h1 title="User Manager">Add new auction</h1>
                <p>&nbsp;</p>
            </div>
            <div class="message_common">
                <form name="change_password" id="change_password" method="post" action="">			
                    <div class="login_middle_common_profil">			
                        <div class="user_name_common">									
                            <div class="log_fields">
                                <p>Old password <span class="red">*</span>:</p>
                                <h2><input type="password" maxlength="20" title="Old Password" name="old_password" id="old_password"></h2>
                            </div>					
                            <span class="red">					</span>
                        </div>
                        <div class="user_name_common">					
                            <div class="log_fields">
                                <p>New password <span class="red">*</span>:</p>
                                <h2><input type="password" maxlength="20" title="New Password" name="new_password" id="new_password"></h2>
                            </div>
                            <span class="red">
                            </span>
                        </div>

                        <div class="user_name_common">					
                            <div class="log_fields">
                                <p>Confirm Password <span class="red">*</span>:</p>
                                <h2><input type="password" maxlength="20" title="Confirm Password" name="confirm_password" id="new_password"></h2>
                            </div>
                            <span class="red">
                            </span>
                        </div>

                        <div class="user_name_common">
                            <div class="no_img">
                                <div class="buton_green">
                                    <div class="profil_butoon">
                                        <div class="res_left"></div>
                                        <div class="res_mid">
                                            <a title="RESET">
                                                <input type="submit" value="RESET" name="submit_user">
                                            </a>
                                        </div>
                                        <div class="res_right"></div>
                                    </div>
                                    <span>	
                                    </span>							
                                    <div class="grand_total_btn_cp">
                                        <div class="save_left"></div>
                                        <div class="save_mid">
                                            <a title="SAVE">
                                                <input type="submit" value="Save" name="submit_change_pass">
                                                <input type="hidden" name="service" id="service" value="change_password">
                                            </a>
                                        </div>
                                        <div class="save_right">
                                            
                                        </div>
                                    </div> 							
                                </div>
                            </div>
                        </div>

                    </div>
                </form>			 <div style="display:none;" class="user">334</div>
            </div>
        </div>
    </body>
</html>
