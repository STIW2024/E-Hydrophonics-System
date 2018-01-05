<%-- 
    Document   : index
    Created on : Nov 24, 2017, 9:51:06 PM
    Author     : thiviya
--%>

<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login page</title>
    <body>
        <%
            Connection con= null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            String sql = "select password from userdetail";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb", "root", "");
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
        %>
        <form method="post" action="login.jsp">
            <center><h2 style="color:green">login page</h2></center>
            <table border="1" align="center">
                <tr>
                    <td>Enter Your Name :</td>
                    <td><input type="text" name="name" required/></td>
                </tr>
                <tr>
                    <td>Enter Your Password :</td>
                    <td><input type="password" name="password"/></td>
                </tr>
                <%
            }
            catch(SQLException sqe)
            {
                out.println("home"+sqe);
            }

                %>
                <tr>
                    <td></td>
                    <td><input type="submit" value="submit"/></td>
            </table>
        </form>
    </body>
</html>
