<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://node165026-e-hydroponics.j.layershift.co.uk/hydroponics", "root", "It5BlUrH3W");
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
        <title>Product Category Page</title>
    </head>
    <body>
        <h1><font color="red">Hydroponics Product's Category</fonts></h1>
        <div align="right">
            <a href="CartList.jsp"><button id="button" style="width: 180px">VIEW CART LIST</button></a> <a href="index.html"><button id="button" style="width: 120px">LOGOUT</button></a>
        </div>
        <p><b><font color="black">Please choose a category from below: </fonts></p>
                <ul>
                    <%
                        String sql = "SELECT * FROM category";
                        ResultSet rs = conn.createStatement().executeQuery(sql);
                        while (rs.next()) {
                            String id = rs.getString("category_id");
                    %>
                    <li><a href="ProductList.jsp?id=<%=id%>" target=""><%=rs.getString("category_name")%></a></li>
                        <%}%>				
                </ul>
                <br></br>
                <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
    </body>
</html>
