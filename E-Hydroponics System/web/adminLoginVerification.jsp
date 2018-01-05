<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Verification Page</title>
    </head>
    <body>
        <%! String Username, Password; %>
        <%
            Username = request.getParameter("Username");
            Password = request.getParameter("Password");
            
            if(Username.equalsIgnoreCase("admin") && Password.equalsIgnoreCase("12345"))
                {%>     
                <jsp:forward page="adminPage.jsp"/>
                <%}  
           else{%> 
                <p1><b><font color="red">Wrong Username or Password! Please try again!</font></p1>
                <jsp:include page="adminLogin.jsp"/>
                <%}
        %>          
    </body>
</html>
