<%-- 
    Document   : ListAllUser
    Created on : Jul 8, 2014, 3:31:20 PM
    Author     : MrTu
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.User"%>
<%@page import="DAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/4.css"/>

        <script language="JavaScript" type="text/javascript" src="JavaScript/jquery.js"></script>
        <script language="JavaScript" type="text/javascript" src="JavaScript/jts.js"></script>

        <script>
            $(document).ready(function() {

                $('#demoTable').jTPS({perPages: [5, 12, 15, 50, 'ALL'], scrollStep: 1, scrollDelay: 30,
                    clickCallback: function() {
                        // target table selector
                        var table = '#demoTable';
                        // store pagination + sort in cookie 
                        document.cookie = 'jTPS=sortasc:' + $(table + ' .sortableHeader').index($(table + ' .sortAsc')) + ',' +
                                'sortdesc:' + $(table + ' .sortableHeader').index($(table + ' .sortDesc')) + ',' +
                                'page:' + $(table + ' .pageSelector').index($(table + ' .hilightPageSelector')) + ';';
                    }
                });

                // reinstate sort and pagination if cookie exists
                var cookies = document.cookie.split(';');
                for (var ci = 0, cie = cookies.length; ci < cie; ci++) {
                    var cookie = cookies[ci].split('=');
                    if (cookie[0] == 'jTPS') {
                        var commands = cookie[1].split(',');
                        for (var cm = 0, cme = commands.length; cm < cme; cm++) {
                            var command = commands[cm].split(':');
                            if (command[0] == 'sortasc' && parseInt(command[1]) >= 0) {
                                $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click();
                            } else if (command[0] == 'sortdesc' && parseInt(command[1]) >= 0) {
                                $('#demoTable .sortableHeader:eq(' + parseInt(command[1]) + ')').click().click();
                            } else if (command[0] == 'page' && parseInt(command[1]) >= 0) {
                                $('#demoTable .pageSelector:eq(' + parseInt(command[1]) + ')').click();
                            }
                        }
                    }
                }

                // bind mouseover for each tbody row and change cell (td) hover style
                $('#demoTable tbody tr:not(.stubCell)').bind('mouseover mouseout',
                        function(e) {
                            // hilight the row
                            e.type == 'mouseover' ? $(this).children('td').addClass('hilightRow') : $(this).children('td').removeClass('hilightRow');
                        }
                );

            });


        </script>
        <style>
            body {
                font-family: Tahoma;
                font-size: 9pt;
            }
            #demoTable thead th {
                white-space: nowrap;
                overflow-x:hidden;
                padding: 3px;
            }
            #demoTable tbody td {
                padding: 3px;
            }
        </style>

        <title>Manage user</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 700px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Manage user</h2> 
                <form name="form1" method="post" action="UserController">
                    <br>
                    <td>
                        <input type="button" name="add" id="add" value="Add new user" onclick="window.location = 'AddUser.jsp';">
                    </td>
                    <p>
                    <td>
                        <label>Keyword:</label>
                        <input type="text" name="txtsearch" id="txtsearch">
                        <label>User type:</label>
                        <select name="user_type" id="user_type">
                            <option value="" selected="selected">Select</option>
                            <option value="Admin"  >Admin</option>
                            <option value="Customer"  >Customer</option>
                            <option value="Staff"  >Auction staff</option>
                        </select>                       
                    </td>
                    <td>
                        <label>Status:</label>
                        <select name="status" id="status">
                            <option value="" selected="selected">Select</option>
                            <option value="Active">Active</option>
                            <option value="Deactive">Deactive</option>
                        </select> 
                        <input type="submit" name="search" id="search" value="Search">
                        <input type="hidden" name="service" id="service" value="search">
                        <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'UserController?service=listall'">
                    </td>
                    <label>Result</label>
                    <input type="text" id="result" readonly>
                    </td>
                    <p>
                    <td> 

                        <table id="demoTable" style="border: 1px solid #ccc;" cellspacing="2" width="700">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Full name</th>
                                    <th>Username</th>
                                    <th>User type</th>
                                    <th>Status</th>

                                </tr>
                            </thead>
                            <tbody>
                                <jsp:useBean id="arr" class="java.util.ArrayList" scope="request">
                                </jsp:useBean>
                                <c:forEach var="user" items="${arr}" varStatus="status"> 
                                    <tr> 
                                <script type="text/javascript">
                                    var elem = document.getElementById("result");
                                    elem.value = "${status.count}";
                                </script>
                                <td>${status.count}</td> 
                                <td>${user.fullname}</td>
                                <td><a href="UserController?service=viewdetail&userid=${user.id}">${user.username}</a></td>
                                <td>${user.role}</td>
                                <td>${user.status}</td>                         
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot class="nav">
                                <tr>
                                    <td colspan=5>
                                        <div class="pagination"></div>
                                        <div class="paginationTitle">Page</div>
                                        <div class="selectPerPage"></div>
                                        <div class="status"></div>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                </form> 
            </div>
        </div>
    </body>
</html>
