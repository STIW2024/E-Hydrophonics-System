<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <a href="index.html"><button id="button">BACK</button></a>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
    <title>Registration Page</title>
</head>
<body>
    <div align="centre" id="Sign-Up"> 
        <fieldset style="width:75%">
            <legend><b><font color="red">Registration Form</font></legend> 
            <table class="center" border="0"> <tr> 
                <form method="GET" action="registerCustomer"> 
                    <td>Full Name: </td>
                    <td> <input type="text" name="name" placeholder="Full Name" size="30" style="height: 20px" required></td>
                    </tr> 
                    <td>Email Address: </td>
                    <td> <input type="email" name="email" placeholder="Email Address" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" size="30" style="height: 20px" required></td> 
                    </tr>
                    <td>Password: </td>
                    <td> <input type="password" name="password" placeholder="Password" size="30" style="height: 20px" required></td>
                    </tr>
                    <td>Mobile No: </td>
                    <td> <input type="number" name="phoneNo" placeholder="Mobile No" step="0" size="30" style="height: 20px" required></td> </tr> 
                    <tr> <td>Home Address: </td>
                        <td><textarea name="address" placeholder="Home Address" style="height: 30px; width: 235px" required></textarea></td>
                    </tr> 
                    <tr><td><input id="button" type="Submit" value="SUBMIT"/> <input id="button" type="reset" value="RESET"/></td> 
                    </tr> 
                </form> 
            </table> 
        </fieldset> 
    </div>
    <div class="panel-footer"><font color="white">&copy; Copyright 2017 - Software Engineering - Universiti Utara Malaysia</font></div>
</body>
</html>
