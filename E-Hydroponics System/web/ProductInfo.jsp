<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hydroponics", "root", "jc12345");
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
    <head>
    <div align="left">
        <a href="categories.jsp"><button id="button">BACK</button></a>
    </div>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/desc.css">
    <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
    <title>Product's Information Page</title>
</head>
<body>
    <h1><font color="red">Product's Information</font></h1>
        <%
            int prod_id = Integer.parseInt(request.getParameter("id"));
            String sql = "SELECT * FROM product_details where product_id = " + prod_id;
            ResultSet rs = conn.createStatement().executeQuery(sql);
            while (rs.next()) {
        %>
    <div align= "center">
        <img src="./Images/<%=rs.getString("product_image")%>" alt="<%=rs.getString("product_name")%>"style="width:180px; height:150px;"/>
    </div>	    
    <h3><font style="color: blueviolet">Product Name:</font> <%=rs.getString("product_name")%></h3>
    <h3><font style="color: blueviolet">Description:</font> <%=rs.getString("product_desc")%></h3>
    <h3><font style="color: blueviolet">Price: </font>MYR <%=rs.getString("product_price")%></h3>
    <input type="hidden" value="<%=rs.getInt("product_id")%>" name = "id"/>
    
    <form method="GET" action="addCart">
        <input type="hidden" name="product_id" value="<%=rs.getInt("product_id")%>">
        <input type="hidden" name="product_name" value="<%=rs.getString("product_name")%>">
        <input type="hidden" name="product_price" value = "<%=rs.getString("product_price")%>">
        <input id=button type="Submit" value="ADD TO CART" style="width: 155px"> 
    </form>
    <%}%>
    <br></br>
    <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  