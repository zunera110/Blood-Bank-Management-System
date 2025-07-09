import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DDashboardServlet")
public class DDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("DonorLogin.jsp"); 
            return;
        }
        String username = (String) session.getAttribute("username");
        try {
            Connection con = Database.getConnection();
            String sql = "SELECT fullName, username, age, gender, bloodGroup, address, email, contactNumber, lastDonationDate FROM donors WHERE username = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("fullName", rs.getString("fullName"));
                request.setAttribute("username", rs.getString("username"));
                request.setAttribute("age", rs.getString("age"));
                request.setAttribute("gender", rs.getString("gender"));
                request.setAttribute("bloodGroup", rs.getString("bloodGroup"));
                request.setAttribute("address", rs.getString("address"));
                request.setAttribute("email", rs.getString("email"));
                request.setAttribute("contactNumber", rs.getString("contactNumber"));
                request.setAttribute("lastDonationDate", rs.getString("lastDonationDate"));
            }
            rs.close();
            ps.close();
            con.close();

            RequestDispatcher rd = request.getRequestDispatcher("Donor_Dashboard.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load dashboard.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); 
    }
}
