<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int product_id = 0;
    String product_name = null;
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hydroponics", "root", "jc12345");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    ResultSet rs = conn.createStatement().executeQuery("select * from cart");
    ResultSet rs1 = conn.createStatement().executeQuery("select sum(product_price) from cart");
%>

<html>
    <head>
    <a href="categories.jsp"><button id="button">BACK</button></a>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/hydroponics.css">
    <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
    <title>Cart List Page</title>
</head>
<body>
    <h1><font color="red">My Shopping Cart</font></h1>
    <table border="1" align="center">
        <tr align="center">
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Price(MYR)</th>
            <th>Delete</th>
        </tr>
        <%while (rs.next()) {
                product_id = rs.getInt("product_id");
                product_name = rs.getString("product_name");
                String product_price = rs.getString("product_price");
        %>
        <tr align="center">
            <td><%=product_id%></td>
            <td align="left"><%=product_name%></td>
            <td><%=product_price%></td>
            <td><a href="DeleteCart?id4=<%=product_id%>&type=1"><img src="./Images/delete.png" width="30px" height="30px" /></a>
        </tr>
        <%}%>
    </table>
    <div align="center">
        <br></br>
        <td><b>Total Price: MYR</td>
        <%while (rs1.next()) {
                String cost = rs1.getString(1);
        %>
        <b><td><input type="number" name="cost" value="<%=cost%>" style="height: 30px; width: 100px; font-size: 20px; background: pink" disabled></td>
            </tr> 
            <form method="GET" action="addOrder">
                <input type="hidden" name="prod_ID" value="<%=product_id%>"> 
                <input type="hidden" name="prod_Name" value="<%=product_name%>"> 
                <input type="hidden" name="cost" value="<%=cost%>">
                <td>Your Email ID: </td><td><input type="text" name="cust_ID" placeholder="Your Email ID" style="height: 30px; width: 200px; font-size: 20px; background: lightblue" required></td>
                </br>
                <input id="button" style="width: 130px" type="Submit" value="CONFIRM">
            </form>
            <%}%>
    </div>
    <br></br>
    <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
</body>
</html>
