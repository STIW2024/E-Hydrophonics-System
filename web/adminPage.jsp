<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <div align="right">
        <a href="index.html"><button id="button" style="width: 120px">LOGOUT</button></a>
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
    <title>Admin Manage Page</title>
</head>
<body>
    <div align="center" style="padding-top: 5%;">
        <a href="adminPage.jsp?select=1"><button id="button" style="width: 200px">PRODUCTS LIST</button></a>
        <a href="adminPage.jsp?select=2"><button id="button" style="width: 200px">CUSTOMERS LIST</button></a>
        <a href="adminPage.jsp?select=3"><button id="button" style="width: 200px">ORDERS LIST</button></a>
        <br>
    </div>
    <%
        String select = request.getParameter("select");
        if (select != null) {
            Connection conn = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://node165026-e-hydroponics.j.layershift.co.uk/hydroponics", "root", "It5BlUrH3W");
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (select.equals("1")) {
                String sql = "SELECT *FROM product_details";
                ResultSet rs = conn.createStatement().executeQuery(sql);
    %><table border="1" align="center" style="color: black">
        <tr align="center">
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Price(MYR)</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>
        <%while (rs.next()) {
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                String product_price = rs.getString("product_price");
        %>
        <tr align="center">
            <td><%=product_id%></td>
            <td align="left"><%=product_name%></td>
            <td><%=product_price%></td>
            <td><a href="DeleteItem?id=<%=product_id%>&type=1"><img src="./Images/delete.png" width="30px" height="30px" /></a>
            <td><a href="adminUpdateProduct.jsp?id=<%=product_id%>"><img src="./Images/edit.png" width="30px" height="30px" /></a>
        </tr>
        <%}
        %>
    </table>
    </br>
    <div align="center" margin="2px">
        <a href="adminAddProduct.jsp"><button id="button" style="width: 180px">ADD PRODUCT</button></a>
    </div>
    <%
    } else if (select.equals("2")) {
        String sql = "SELECT * FROM customer_details";
        ResultSet rs = conn.createStatement().executeQuery(sql);
    %><table border="1" align="center" style="color: black">
        <tr align="center">
            <th>Customer ID</th>
            <th>Customer Name</th>
            <th>Email Address</th>
            <th>Phone Number</th>
            <th>Address</th>
            <th>Delete</th>
        </tr>
        <%while (rs.next()) {
                String customer_id = rs.getString("customer_id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phoneNo");
                String address = rs.getString("address");
        %>
        <tr align="center">
            <td><font size="4"><%=customer_id%></font></td>
            <td align="left"><font size="4"><%=name%></font></td>
            <td align="left"><font size="4"><%=email%></font></td>
            <td><font size="4"><%=phone%></font></td>
            <td align="left"><font size="4"><%=address%></font></td>
            <td><a href="DeleteCustomer?id2=<%=customer_id%>&type=2"><img src="./Images/delete.png" width="30px" height="30px" /></a>
        </tr>
        <%}
        %>
    </table>
    <%
    } else if (select.equals("3")) {
        String sql = "SELECT * FROM order_details";
        ResultSet rs = conn.createStatement().executeQuery(sql);
    %><table border="1" align="center" style="color: black">
        <tr align="center">
            <th>Order ID</th>
            <th>Customer Email</th>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Cost(MYR)</th>
            <th>Delete</th>
        </tr>
        <%while (rs.next()) {
                int order_id = rs.getInt("order_id");
                String cust_ID = rs.getString("cust_ID");
                String prod_ID = rs.getString("prod_ID");
                String prod_Name = rs.getString("prod_Name");
                String cost = rs.getString("cost");
        %>
        <tr align="center">
            <td><%=order_id%></td>
            <td><%=cust_ID%></td>
            <td><%=prod_ID%></td>
            <td align="left"><%=prod_Name%></td>
            <td><%=cost%></td>
            <td><a href="DeleteOrder?id3=<%=order_id%>&type=3"><img src="./Images/delete.png" width="30px" height="" /></a>
        </tr>
        <%}
        %>
    </table>
    <%
        }
    %>
    <%}%>
    <br></br>
    <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
</body>
</html>
