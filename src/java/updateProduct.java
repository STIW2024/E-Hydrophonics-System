
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class updateProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            PreparedStatement stmt;
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://node165026-e-hydroponics.j.layershift.co.uk/hydroponics", "root", "It5BlUrH3W");

            int a = Integer.parseInt(request.getParameter("p_id"));
            String b = request.getParameter("p_name");
            String c = request.getParameter("p_cat");
            String d = request.getParameter("p_price");
            String e = request.getParameter("p_img");
            String f = request.getParameter("p_desc");
            if (b != null && c != null && d != null && e != null && f != null) {
                String sql = "update product_details set product_name=?, product_cat=?, product_price=?, product_image=?,product_desc=? where product_id='" + a + "'";
                stmt = con.prepareStatement(sql);
                stmt.setString(1, b);
                stmt.setString(2, c);
                stmt.setString(3, d);
                stmt.setString(4, e);
                stmt.setString(5, f);
                stmt.execute();
            }

        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {

        } finally {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Successful Updated!');");
            out.println("location='adminPage.jsp';");
            out.println("</script>");
            out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
