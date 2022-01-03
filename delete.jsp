<%-- 
    Document   : delete
    Created on : Nov 29, 2021, 10:41:18 PM
    Author     : Zeroc
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
            if (request.getParameter("delete_id") != null) //get delete_id from index.jsp page with
            {
                int id = Integer.parseInt(request.getParameter("delete_id")); //get delete_id stor

                String url = "jdbc:mysql://localhost:3306/test"; //database connection
                String username = "root"; //database connection username
                String password = ""; //database password

                try {
                    Class.forName("com.mysql.jdbc.Driver"); //load driver
                    Connection con = DriverManager.getConnection(url, username, password); //create

                    PreparedStatement pstmt = null; //create statement
                    pstmt = con.prepareStatement("delete from employee where id=? "); //sql delete q
                    pstmt.setInt(1, id);
                    pstmt.executeUpdate(); //execute query
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp"); //after dele
                    rd.forward(request, response);

                    pstmt.close(); //close statement

                    con.close(); //close connection
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        %>


