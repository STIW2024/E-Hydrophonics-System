<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        </br>
    <h><a href="index.html"><button id="button">BACK</button></a></h>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
    <title>Customer Login Page</title>
</head>
<body>
    <div align="centre" id="Sign-Up"> 
        <fieldset style="width:70%">
            <legend><b><font color="red">Customer Login</font></legend> 
            <table class="center" border="0"> 
                <form method="GET" action="CustomerLog.jsp">  
                    <td>Email Address: </td>
                    <td><input type="text" name="email" placeholder="Email Address" size="25" style="height: 20px" required></td>
                    </tr> 
                    <td>Password: </td>
                    <td><input type="password" name="password" placeholder="Password" size="25" style="height: 20px" required></td> 
                    </tr>
                    <tr> <td><input id="button" type="Submit" value="LOGIN"> <input id="button" type="reset" value="RESET"></td>
                    </tr>
                </form>
            </table>
        </fieldset>
    </div>
    <br></br>
    <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
</body>
</html>
