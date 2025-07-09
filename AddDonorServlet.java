import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddDonorServlet")
public class AddDonorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Get database connection
            conn = Database.getConnection();

            // Prepare SQL insert statement
            String sql = "INSERT INTO donors (fullName, username, age, gender, bloodGroup, address, email, contactNumber, password) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);

            // Set parameter values from form
            pstmt.setString(1, request.getParameter("fullName"));
            pstmt.setString(2, request.getParameter("username"));
            pstmt.setInt(3, Integer.parseInt(request.getParameter("age")));
            pstmt.setString(4, request.getParameter("gender"));
            pstmt.setString(5, request.getParameter("bloodGroup"));
            pstmt.setString(6, request.getParameter("address"));
            pstmt.setString(7, request.getParameter("email"));
            pstmt.setString(8, request.getParameter("contactNumber"));
            pstmt.setString(9, request.getParameter("password"));

            // Execute and set message
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("message", "Donor added successfully!");
            } else {
                request.setAttribute("message", "Failed to add donor.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        // Forward to ManageDonorsServlet to refresh the donor list
//        request.getRequestDispatcher("ManageDonorsServlet").forward(request, response);
response.sendRedirect("ManageDonorsServlet");
    }
}
