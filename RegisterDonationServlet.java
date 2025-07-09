import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterDonationServlet")
public class RegisterDonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String donationDate = request.getParameter("donationDate");
        String location = request.getParameter("location");
        int units = Integer.parseInt(request.getParameter("units"));

        // Retrieve donor's username from session
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloodbank", "root", "root");
            Connection con = Database.getConnection();
            String sql = "INSERT INTO donations (username, donation_date, location, units) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, donationDate);
            ps.setString(3, location);
            ps.setInt(4, units);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("DDashboardServlet"); // redirect after success
            } else {
                response.getWriter().println("Failed to register donation.");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
