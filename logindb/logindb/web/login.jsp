<%-- 
    Document   : login
    Created on : Nov 24, 2017, 9:51:46 PM
    Author     : thiviya
--%>

<%@ page import="java.sql.*" %>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login</title>

</head>

<body>

<%! String userdbName;

String userdbPsw;

%>

<%

Connection con= null;

PreparedStatement ps = null;

ResultSet rs = null;

String sql = "select * from userdetail where name=? and password=?";



String name = request.getParameter("name");

String password = request.getParameter("password");



if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || 
password.equals(""))))

{

try{
    

Class.forName("com.mysql.jdbc.Driver");

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb", "root", "");

ps = con.prepareStatement(sql);

ps.setString(1, name);

ps.setString(2, password);
rs = ps.executeQuery();

if(rs.next())

{ 

userdbName = rs.getString("name");

userdbPsw = rs.getString("password");

if(name.equals(userdbName) && password.equals(userdbPsw))

{

session.setAttribute("name",userdbName);


response.sendRedirect("HelloWorld.jsp"); 

} 

}

else


rs.close();

ps.close(); 

}

catch(SQLException sqe)

{

out.println(sqe);

} 

}

else

{

%>

<center><p style="color:red">Error In Login</p></center>

<% 

getServletContext().getRequestDispatcher("/index.jsp").include(request, 
response);

}

%>

</body>

</html>