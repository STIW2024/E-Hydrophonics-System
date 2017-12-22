<%-- 
    Document   : Login
    Created on : Nov 24, 2017, 4:53:33 PM
    Author     : user46
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Verification</title>
    </head>
    <body bgcolor="yellow">
        <%! String Username, Password; %>
        <%
            Username = request.getParameter("Username");
            Password = request.getParameter("Password");
            
            if(Username.equals("jairam") && Password.equals("244777"))
                {%>     
                <jsp:forward page="Hello.jsp"/>
                <%}  else
                
                {%> 
                Wrong Username or Password. Please try again...
                <jsp:include page="index.jsp"/>
                <%}%>          
    </body>
</html>
