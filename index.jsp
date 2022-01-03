<%-- 
    Document   : Index
    Created on : Nov 16, 2021, 9:51:13 PM
    Author     : Zeroc
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

 
 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <div class="main">
            <center>
                <table>
                     <h1> <a href="add.jsp">Add Record</a></h1>
                     <form action="search.jsp">
                        <input type="text" name="submit_name">
                        <input type="submit">
                    </form>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Work Place</th>
                        <th>Phone number</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <%
                        String url = "jdbc:mysql://localhost:3306/test"; //database connection
                        String username = "root"; //database connection username
                        String password = ""; //database password

                        try {
                            Class.forName("com.mysql.jdbc.Driver"); //load driver
                            Connection con = DriverManager.getConnection(url, username, password); //create

                            PreparedStatement pstmt = null; //create statement

                            pstmt = con.prepareStatement("select * from employee"); //sql select query
                            ResultSet rs = pstmt.executeQuery(); //execute query and set in ResultSet obje

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%=rs.getInt("id")%></td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("work_place")%></td>
                        <td><%=rs.getString("phoneNo")%></td>

                        <td><a href="edit.jsp?edit_id=<%=rs.getInt("id")%>">Edit</a></td>
                        <td><a href="delete.jsp?delete_id=<%=rs.getInt("id")%>">Delete</a></td>

                    </tr>
                    <%
                            }

                            pstmt.close(); //close statement
                            con.close(); //close connection

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </table>

            </center>
        </div>
    </body>
</html>
