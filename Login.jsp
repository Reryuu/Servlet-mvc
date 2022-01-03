<%-- 
    Document   : Login
    Created on : Jan 3, 2022, 10:07:47 PM
    Author     : Zeroc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          
    <center>
        <h1>LOGIN FORM</h1>
        <form action="LoginController" method ="post"> 
            <table><td> Username: <input type="text" name="username"/></td>
                <td>Password: <input type="text" name="password"/></td></table>



            <input type="submit" vaule="login"/>
        </form>
    </center>
    </body>
</html>
