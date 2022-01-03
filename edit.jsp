<%-- 
    Document   : update
    Created on : Nov 29, 2021, 10:43:00 PM
    Author     : Zeroc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="main">
            <form method="post" action="EditController" onsubmit="return validate();">

                <table>
                    <%
                        if (request.getParameter("edit_id") != null) //get edit_id from index.jsp page with
                        {
                            int id = Integer.parseInt(request.getParameter("edit_id")); //get edit_id stor

                            String url = "jdbc:mysql://localhost:3306/test"; //database connect
                            String username = "root"; //database connection username
                            String password = ""; //database password

                            try {
                                Class.forName("com.mysql.jdbc.Driver"); //load driver
                                Connection con = DriverManager.getConnection(url, username, password); //cre

                                PreparedStatement pstmt = null; //create statement

                                pstmt = con.prepareStatement("select * from employee where id=?"); //sql sel
                                pstmt.setInt(1, id);
                                ResultSet rs = pstmt.executeQuery(); //execute query and set in Resultset

                                while (rs.next()) {
                    %>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txt_name" id="name" value="<%=rs.getString("name")%>"></td>
                    </tr>

                    <tr>
                        <td>Work place</td>
                        <td><input type="text" name="txt_work_place" id="owner" value="<%=rs.getString("work_place")%>"></td>
                    </tr>
                    
                    <tr>
                        <td>Phone number</td>
                        <td><input type="text" name="txt_phoneNo" id="name" value="<%=rs.getString("phoneNo")%>"></td>
                    </tr>

                    <tr>
                        <td><input type="submit" name="btn_edit" value="Update"></td>
                    </tr>

                    <input type="hidden" name="hidden_id" value="<%=rs.getInt("id")%>">
                    <%
                                }

                                pstmt.close(); //close statement
                                con.close(); //close connection
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </table>

                <center>
                    <h3 style="color:red;">
                        <%
                            if (request.getAttribute("UpdateErrorMsg") != null) {
                                out.print(request.getAttribute("UpdateErrorMsg")); //get update reco
                            }
                        %>
                    </h3>

                    <h1><a href="index.jsp">Back</a></h1>
                </center>

            </form>

    </body>
</html>
