<%-- 
    Document   : add
    Created on : Nov 29, 2021, 10:39:18 PM
    Author     : Zeroc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="main">
            <form method="post" action="AddController" onsubmit="return validate();">

                <table>

                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txt_name" id="name"></td>
                    </tr>

                    <tr>
                        <td>Work place</td>
                        <td><input type="text" name="txt_work_place" id="work_place"></td>
                    </tr>
                    
                    <tr>
                        <td>Phone number</td>
                        <td><input type="text" name="txt_phoneNo" id="phoneNo"></td>
                    </tr>

                    <tr>
                        <td><input type="submit" name="btn_add" value="Add"></td>
                    </tr>

                </table>

                <center>
                    <h3 style="color:red;">
                        <%
                            if (request.getAttribute("InsertErrorMsg") != null) {
                                out.println(request.getAttribute("InsertErrorMsg")); //get insert record
                            }
                        %>
                    </h3>

                    <h1><a href="index.jsp">Back</a></h1>

                </center>

            </form>
        </div>
   
    </body>
</html>
