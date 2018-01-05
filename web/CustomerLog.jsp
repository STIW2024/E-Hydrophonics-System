<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" href="./css/sign_up.css">
        <title>Customer Login Verification</title>
        <script type="text/javascript">
            function show_alert() {
                alert("Welcome to E-Hydroponics System!");
            }
        </script>
    </head>
    <body>
        <%! String dbEmail;
            String dbPassword;
        %>
        <%Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String sql = "SELECT email , password FROM customer_details WHERE email=? and password=?";

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if ((!(email.equals(null) || email.equals("")) && !(password.equals(null) || password.equals("")))) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://node165026-e-hydroponics.j.layershift.co.uk/hydroponics", "root", "It5BlUrH3W");
                    ps = con.prepareStatement(sql);
                    ps.setString(1, email);
                    ps.setString(2, password);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        dbEmail = rs.getString("email");
                        dbPassword = rs.getString("password");

                        if (email.equals(dbEmail) && password.equals(dbPassword)) {
                            session.setAttribute("email", dbEmail);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Welcome to E-Hydroponics System!');");
                            out.println("location='categories.jsp';");
                            out.println("</script>");
                        }
                    } else {
                        rs.close();
                        {%> 
    <p1><b><font color="red">Wrong Email or Password! Please try again!</font></p1>
            <jsp:include page="customerLogin.jsp"/>
            <%}
                        }
                        ps.close();
                    } catch (SQLException sqe) {
                        out.println(sqe);
                    }
                } else {

                }
            %>
</body>
</html>