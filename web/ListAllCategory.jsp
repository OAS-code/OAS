<%-- 
    Document   : ListAllCategory
    Created on : Jul 22, 2014, 10:23:14 PM
    Author     : MrTu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entity.Category"%>
<%@page import="DAO.CategoryDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

        <title>Manage Category</title>
    </head>
    <body>
        <div style="width: 500px;margin: auto;">
            <div style="width: 700px;display: block;border: 1px solid #ccc;border-radius: 4px;margin: auto;margin-top: 50px;">
                <h2 style="margin: auto;margin-left: 10px">Manage user</h2> 
                <form name="form1" method="post" action="CategoryController">
                    <br>
                    <td>
                        <input type="button" name="add" id="add" value="Add new category" onclick="window.location = 'AddCategory.jsp';">
                    </td>
                    <p>
                    <td>
                        <label>Keyword:</label>
                        <input type="text" name="txtsearch" id="txtsearch">                                             
                    </td>
                    <td>                      
                        <input type="submit" name="search" id="search" value="Search">
                        <input type="hidden" name="service" id="service" value="search">
                        <input type="button" name="listall" id="listall" value="List all" onclick="window.location = 'CategoryController?service=listall'">
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
                                    <th>Name</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>  
                            </thead>
                            <tbody>
                                <jsp:useBean id="arr" class="java.util.ArrayList" scope="request">
                                </jsp:useBean>
                                <c:forEach var="category" items="${arr}" varStatus="status"> 
                                    <tr> 
                                <script type="text/javascript">
                                    var elem = document.getElementById("result");
                                    elem.value = "${status.count}";
                                </script>
                                <td>${status.count}</td> 
                                <td>${category.name}</td>  
                                <td><a href="EditCategory.jsp?categoryid=${category.categoryid}">Edit</a></td>
                                <td><a href="CategoryController?service=delete&categoryid=${category.categoryid}" onclick="return confirm('Are you sure?')">Delete</a></td>
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
