<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hydroponics", "root", "jc12345");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    ResultSet rs = conn.createStatement().executeQuery("Select * from category");
%>
<html>
    <head>
    <a href="adminPage.jsp"><button id="button">BACK</button></a>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
    <title>Add New Entry Product Info Page</title>
</head>
<body>
    <div align="centre" id="Sign-Up"> 
        <fieldset style="width:87%">
            <legend><b><font color="red">Add New Product Entry</font></legend> 
            <table class="center" border="0"> <tr> 
                <form method="GET" action="addProduct"> 
                    <td><b>Product ID: </td>
                    <td> <input type="number" name="product_id" step="1" placeholder="Product ID" style="height: 20px; width: 250px" required></td>
                    </tr> 
                    <td><b>Product Name: </td>
                    <td> <input type="text" name="product_name" placeholder="Product Name" style="height: 20px; width: 250px" required></td>
                    </tr> 
                    <tr><td><b>Product Category: </td>
                        <td> <select name="product_cat" placeholder="Product Category" style="height: 20px; width: 250px" required>
                                <%while (rs.next()) {
                                        String id = rs.getString("category_id");
                                        String cat = rs.getString("category_name");
                                %><option value="<%=id%>"> <%=cat%></option>
                                <%}%>
                            </select></td> </tr>
                    <tr><td><b>Product Price: </td>
                        <td> <input type="number" name="product_price" step="0.01" placeholder="Product Price" style="height: 20px; width: 250px" required></td> 
                    </tr>
                    <tr><td><b>Product Image file: </td><td>
                            <input type="text" name="product_image" placeholder="Product Image" style="height: 20px; width: 250px" required></td> 
                    </tr>
                    <tr><td><b>Product Description: </td>
                        <td><textarea name="product_desc" placeholder="Product Description" style="height: 30px; width: 250px" required></textarea></td> 
                    </tr> 
                    <tr><td><input id="button" type="Submit" value="ADD"/> <input id="button" type="reset" value="RESET"/></td> 
                    </tr> 
                </form> 
            </table> 
        </fieldset> 
    </div>
    <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
</body>
</html>
