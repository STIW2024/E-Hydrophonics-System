<%-- 
    Document   : index
    Created on : Nov 24, 2017, 4:55:08 PM
    Author     : user46
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="yellow">
        <h1>LOGIN VERIFICATION</h1>
        <form action="Login.jsp" method="get">
            <pre>
                <br class="form-inline">
                Username: <input type="text" name="Username" placeholder="Username" size="20"/>
                Password: <input type="password" name="Password" placeholder="Password" size="21"/>
                </br>
                    <input type="reset" value="RESET" name="RESET" />   <input type="submit" value="SUBMIT" name="SUBMIT" />
            </pre>
        </form>
    </body>
</html>
