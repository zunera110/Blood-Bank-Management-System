import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String donorId = request.getParameter("id");
        String newStatus = request.getParameter("status");

        try {
            Connection con = Database.getConnection();

            // Retrieve donor email
            String emailQuery = "SELECT email FROM donors WHERE id=?";
            PreparedStatement emailStmt = con.prepareStatement(emailQuery);
            emailStmt.setString(1, donorId);
            ResultSet rs = emailStmt.executeQuery();
            String donorEmail = null;
            if (rs.next()) {
                donorEmail = rs.getString("email");
            }

            // Update donor status
            String query = "UPDATE donors SET status=? WHERE id=?";
            PreparedStatement pstm = con.prepareStatement(query);
            pstm.setString(1, newStatus);
            pstm.setString(2, donorId);
            int rowsUpdated = pstm.executeUpdate();

            if (rowsUpdated > 0) {
                if (donorEmail != null && !donorEmail.isEmpty()) {
                    System.out.println("Sending email to: " + donorEmail);
                    SendEmail.sendEmail(donorEmail, "Donation Confirmation", "Your blood donation is successful!");
            } else {
                System.out.println("Donor email not found!");
            }
                 response.sendRedirect("ManageDonorsServlet");
            } else {
                response.getWriter().println("Failed to update status.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
