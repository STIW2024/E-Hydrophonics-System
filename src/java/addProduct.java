
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            String product_name = request.getParameter("product_name");
            String product_cat = request.getParameter("product_cat");
            String product_price = request.getParameter("product_price");
            String product_image = request.getParameter("product_image");
            String product_desc = request.getParameter("product_desc");

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://node165026-e-hydroponics.j.layershift.co.uk/hydroponics", "root", "It5BlUrH3W");

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select product_id from product_details where product_id like '" + '%' + product_id + '%' + "'");
            if (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Product ID Already Exist in Product List!');");
                out.println("location='adminAddProduct.jsp';");
                out.println("</script>");
                out.close();
            } else {
                st.executeUpdate("insert into product_details(product_id, product_name, product_cat, product_price, product_image, product_desc)"
                        + "values('" + product_id + "','" + product_name + "', '" + product_cat + "','" + product_price + "','" + product_image + "','" + product_desc + "')");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Successful Added!');");
                out.println("location='adminPage.jsp';");
                out.println("</script>");
                out.close();
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            out.print(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(addProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
