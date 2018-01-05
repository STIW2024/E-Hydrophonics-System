<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<%    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hydroponics", "root", "jc12345");
    } catch (SQLException e) {
        e.printStackTrace();
    }
    ResultSet rs = conn.createStatement().executeQuery("Select * from category");
    int id = Integer.parseInt(request.getParameter("id"));
    ResultSet rs1 = conn.createStatement().executeQuery("Select * from product_details where product_id=" + id);
    rs1.next();
    int p_id = rs1.getInt("product_id");
    String p_cat = rs1.getString("product_cat");
    String p_name = rs1.getString("product_name");
    String p_price = rs1.getString("product_price");
    String p_img = rs1.getString("product_image");
    String p_desc = rs1.getString("product_desc");
%>
<html>
    <head>
    <a href="adminPage.jsp"><button id="button">BACK</button></a>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
    <title>Update Product Info Page</title>
</head>
<body>
    <div id="Sign-Up"> 
        <fieldset style="width:87%">
            <legend><b><font color="red">Update Product's Information</font></legend> 
            <table class="center" border="0"> <tr> 
                <form method="GET" action="updateProduct"> 
                    <td><b>Product ID: </td>
                    <td> <input type="text" name="p_id" value="<%=p_id%>" placeholder="Product ID" style="height: 20px; width: 250px" required></td>
                    </tr> 
                    <td><b>Product Name: </td>
                    <td><input type="text" name="p_name" value="<%=p_name%>" placeholder="Product Name" style="height: 20px; width: 250px" required></td>
                    </tr> 
                    <tr><td><b>Product Category: </td>
                        <td> <select name="p_cat" placeholder="Product Category" style="height: 20px; width: 250px" required>
                                <%while (rs.next()) {
                                        String catid = rs.getString("category_id");
                                        String cat = rs.getString("category_name");
                                        if (catid == p_cat) {
                                %><option selected="selected" value="<%=catid%>"> <%=cat%></option><%
                                        continue;
                                    }
                                %><option value="<%=catid%>"> <%=cat%></option>
                                <%}%>
                            </select></td> </tr>
                    <tr><td><b>Product Price: </td>
                        <td> <input type="number" name="p_price" step="0.01" value="<%=p_price%>" placeholder="Product Price" style="height: 20px; width: 250px" required></td> </tr>
                    <tr><td><b>Product Image file: </td><td>
                            <input type="text" name="p_img" value="<%=p_img%>" placeholder="Product Image" style="height: 20px; width: 250px" required></td> </tr>
                    <tr><td><b>Product Description: </td>
                        <td><textarea name="p_desc" placeholder="Product Description" style="height: 30px; width: 250px" required><%=p_desc%></textarea></td> </tr> 
                    <tr><td><input id="button" type="Submit" value="UPDATE"></td></tr>
                </form> 
            </table> 
        </fieldset> 
    </div>
    <br></br>
    <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
</body>
</html>

