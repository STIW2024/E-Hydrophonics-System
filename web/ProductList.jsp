<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://node165026-e-hydroponics.j.layershift.co.uk/hydroponics", "root", "It5BlUrH3W");
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
    </br>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/ProductList.css">
    <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
    <title>Product List Page</title>
</head>
<body>
    <div align="left">
        <ul class="wrapper">
            <%
                String catID = request.getParameter("id");
                String sql = "SELECT * FROM product_details where product_cat='" + catID + "'";
                ResultSet rs = conn.createStatement().executeQuery(sql);
                while (rs.next()) {
                    int id = rs.getInt("product_id");
            %>
            <li class="box" style="width: 180px; height: 150px;"><a href="ProductInfo.jsp?id=<%=id%>">
                    <img src="./Images/<%=rs.getString("product_image")%>"
                         alt="<%=rs.getString("product_name")%>"
                         style="width: 180px; height: 150px;"><font size="2"><b><%=rs.getString("product_name")%></font></a>
            </li>
            <%}%>
        </ul>
    </div>
    <br></br>
    <br></br>
    <br></br>
    <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
</body>
</html>
